"""
Plugin that creates the files for nbt crafting with the knowledge book workaround,
by linking loot tables and recipes

recipes are checked from their root folder, so {namespace}:{path}
loot tables are checked from {namespace}:items/{path}
functions and advancements are output in {namespace}:recipes/{path}
"""

from beet import Context, Advancement, Function


def beet_default(ctx: Context):
    for path, recipe in ctx.data.recipes.items():
        namespace, _, path = path.partition(":")

        loot_table_path = f"{namespace}:items/{path}"
        recipe_path = f"{namespace}:{path}"
        function_path = f"{namespace}:recipes/{path}"
        advancement_path = function_path

        if loot_table_path in ctx.data.loot_tables:
            ctx.data[advancement_path] = Advancement(
                {
                    "criteria": {
                        "placeholder": {
                            "trigger": "minecraft:recipe_unlocked",
                            "conditions": {
                                "recipe": recipe_path
                            }
                        }
                    },
                    "rewards": {
                        "function": function_path,
                        "loot": [
                            loot_table_path
                        ]
                    }
                }
            )
            ctx.data[function_path] = Function([
                "clear @s knowledge_book 1",
                f"advancement revoke @s only {advancement_path}",
                f"recipe take @s {recipe_path}"
            ])
