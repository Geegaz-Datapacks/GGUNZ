"""Plugin that ...
"""


from beet import (
    Context, 
    LootTable, 
    Advancement, 
    Function, 
    Model, 
    configurable
)
from beet.library.resource_pack import ResourcePackNamespace
from pydantic import BaseModel
from beet.core.utils import JsonDict
from beet.core.file import JsonFile
from typing import List, Optional

__all__ = [
    "ItemsOptions",
    "items",
]

RARITY = [
    "white",
    "yellow",
    "aqua",
    "purple"
]


class ItemsOptions(BaseModel):
    load: List[str] = []
    custom_namespace: Optional[str] = None
    cmd_id: int = 0


def beet_default(ctx: Context):
    ctx.require(items)


@configurable(validator=ItemsOptions)
def items(ctx: Context, opts: ItemsOptions):
    for filename in opts.load:
        # get json file
        for id, data in JsonFile(source_path=ctx.directory / filename).data.items():
            new_item = ItemGenerator(ctx, opts, id, data)
            # create loot table
            ctx.data[f"{new_item.namespace}:items/{id}"] = new_item.loot_table()

            """
            TODO: create cmd overrides automatically ?
            """
            for item in new_item.overrides:
                namespace, _, path = item.partition(":")
                model_data = ctx.assets.models[f"minecraft:item/{path}"].data
                if not "overrides" in model_data:
                    model_data["overrides"] = []
                model_data["overrides"].append(new_item.model_predicate())
    


class ItemGenerator():
    """Container used to generate all files related to custom items"""
    cmd_id: int = 0
    custom_model_data: int
    overrides: List[str]

    namespace: str
    id: str
    type: str
    name: str
    rarity: int
    functions: List[JsonDict]

    def __init__(self, ctx: Context, opts: ItemsOptions, id: str, data: JsonDict) -> None:
        ItemGenerator.cmd_id += 1
        self.custom_model_data = opts.cmd_id + ItemGenerator.cmd_id

        self.namespace = opts.custom_namespace or ctx.project_id
        self.id = id
        if "source" in data:
            self.type = data["source"].get("type") or "item"
            self.name = data["source"].get("name") or "minecraft:clock"
        else:
            self.type = "item"
            self.name = "minecraft:clock"
        self.rarity = data.get("rarity") or 0
        self.functions = data.get("functions") or []

        if self.type == "item":
            self.overrides = [self.name]
        else:
            self.overrides = data.get("overrides") or []

    def loot_table(self):
        """Returns the loot table for this custom item, including custom functions"""
        return LootTable(
            {
                "pools": [
                    {
                        "rolls": 1,
                        "entries": [
                            {
                                "type": self.type,
                                "name": self.name,
                                "functions": [
                                    {
                                        "function": "minecraft:set_name",
                                        "name": {
                                            "translate": f"{self.namespace}.item.name.{self.id}",
                                            "color": RARITY[self.rarity],
                                            "italic": False
                                        },
                                        "replace": False
                                    },
                                    {
                                        "function": "set_nbt",
                                        "tag": f"{{CustomModelData:{self.custom_model_data}}}"
                                    }
                                ] + self.functions
                            }
                        ]
                    }
                ]
            }
        )

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
