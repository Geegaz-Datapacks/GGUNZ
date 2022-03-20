"""Plugin that generates custom items from a simple json structure
"""

from pathlib import Path
from beet import (
    Context,
    LootTable,
    Advancement,
    Function,
    Model,
    JsonFile,
    configurable
)
from beet.library.base import Namespace
from pydantic import BaseModel
from beet.core.file import JsonDict
from typing import Any, Dict, List, Optional

__all__ = [
    "GeneratedItemsOptions",
    "generated_items",
]

RARITY = [
    "white",
    "yellow",
    "aqua",
    "purple"
]


class GeneratedItemsOptions(BaseModel):
    load: List[str] = []
    custom_namespace: Optional[str] = None
    custom_model_data: int = 0


class ItemDataOptions(BaseModel):  # for handling loot tables and functions
    type: str = "item"
    name: str = "minecraft:clock"
    loot_table: Optional[JsonDict] = None
    functions: List[JsonDict] = []


class ItemAssetOptions(BaseModel):  # for handling models and textures
    texture: Optional[str] = None
    parent: str = "minecraft:item/generated"
    model: Optional[JsonDict] = None
    overrides: Optional[List[str]] = None


class ItemOptions(BaseModel):  # for data that affects both the item's data and asset
    custom_model_data: Optional[int] = None
    rarity: int = 0
    data: ItemDataOptions = ItemDataOptions()
    asset: ItemAssetOptions = ItemAssetOptions()


def beet_default(ctx: Context):
    ctx.require(generated_items)


@configurable(validator=GeneratedItemsOptions)
def generated_items(ctx: Context, opts: GeneratedItemsOptions):
    # get item files
    item_files: List[str] = []
    for path in opts.load:
        item_files.extend(Path().glob(path))

    namespace = opts.custom_namespace or ctx.project_id
    all_recipes: List[str] = [
        "# All craftable items in the pack\n"
    ]

    for filepath in item_files:
        # get item data
        for id, content in JsonFile(source_path=ctx.directory / filepath).data.items():
            new_item = ItemGenerator(
                ctx, namespace, id, opts.custom_model_data, content)
            
            # create loot table
            ctx.data[f"{namespace}:items/{id}"] = new_item.loot_table()

            # make an nbt recipe for it
            if f"{namespace}:items/{id}" in ctx.data.recipes:
                ctx.data[f"{namespace}:recipes/{id}"] = new_item.function()
                ctx.data[f"{namespace}:recipes/{id}"] = new_item.advancement()
                # add recipe to the list
                all_recipes.append(f"function {namespace}:recipes/{id}")
            
            # create model and add it to overrides
            ctx.assets[f"{namespace}:item/{id}"] = new_item.model()
            new_item.generate_overrides(ctx) # TODO: problem when "name" isn't in the form "minecraft:..."

    ctx.data[f"{namespace}:all_recipes"] = Function(all_recipes)


class ItemGenerator():
    """Container used to generate all files related to custom items"""
    custom_model_data: int = 0

    namespace: str
    id: str
    item: ItemOptions

    def __init__(self, ctx: Context, namespace: str, id: str, custom_model_data: int, json: JsonDict) -> None:

        self.namespace = namespace
        self.id = id

        self.item = ItemOptions(**json)

        ItemGenerator.custom_model_data += 1
        # instance CMD is set to static CMD
        self.custom_model_data = self.item.custom_model_data or (
            custom_model_data + ItemGenerator.custom_model_data)

    def loot_table(self):
        """Returns the loot table for this custom item, including custom functions"""
        return self.item.data.loot_table or LootTable(
            {
                "pools": [
                    {
                        "rolls": 1,
                        "entries": [
                            {
                                "type": self.item.data.type,
                                "name": self.item.data.name,
                                "functions": [
                                    {
                                        "function": "minecraft:set_name",
                                        "name": {
                                            "translate": f"{self.namespace}.item.name.{self.id}",
                                            "color": RARITY[self.item.rarity],
                                            "italic": False
                                        },
                                        "replace": False
                                    },
                                    {
                                        "function": "set_nbt",
                                        "tag": f"{{CustomModelData:{self.custom_model_data}}}"
                                    }
                                ] + self.item.data.functions
                            }
                        ]
                    }
                ]
            }
        )

    def function(self):
        return Function([
            f"""
clear @s knowledge_book 1
advancement revoke @s only {self.namespace}:recipes/{self.id}
recipe take @s {self.namespace}:recipes/{self.id}

loot give @s loot {self.namespace}:items/{self.id}
"""
        ])

    def advancement(self):
        return Advancement(
            {
                "criteria": {
                    "placeholder": {
                        "trigger": "minecraft:recipe_unlocked",
                        "conditions": {
                            "recipe": f"{self.namespace}:items/{self.id}"
                        }
                    }
                },
                "rewards": {
                    "function": f"{self.namespace}:recipes/{self.id}"
                }
            }
        )

    def model(self):
        """Returns the loot table for this custom item, including custom functions"""
        return self.item.asset.model or Model({
            "parent": self.item.asset.parent,
            "textures": {
                "layer0": self.item.asset.texture or f"{self.namespace}:item/{self.id}"
            }
        })

    def model_predicate(self):
        """Returns the predicate for the custom model data of this item, assuming the model is named the same"""
        return dict(
            {
                "predicate": {
                    "custom_model_data": self.custom_model_data
                },
                "model": f"{self.namespace}:item/{self.id}"
            }
        )

    def generate_overrides(self, ctx: Context):
        overrides: List[str] = self.item.asset.overrides or [
            self.item.data.name]

        for item in overrides:
            namespace, _, path = item.partition(":")
            model_data = ctx.assets.models[f"minecraft:item/{path}"].data
            if not "overrides" in model_data:
                model_data["overrides"] = []
            model_data["overrides"].append(self.model_predicate())
