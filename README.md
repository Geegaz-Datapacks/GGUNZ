# GGUNZ
Minecraft datapack about firearms

F3 + T to reload the resourcepack

`/reload` to reload the datapack

## Using the [`generated_items` pipeline](/pipelines/generated_items.py):
GGUNZ uses a Beet pipeline to generate custom items.
Here is the full json structure of a default item:
```json
{
    "item_id": {
        "custom_model_data": 1,
        "rarity": 0,
        "data": {
            "type": "item",
            "name": "minecraft:clock",
            "functions": []
        },
        "asset": {
            "texture": "<namespace>:item/<item_id>",
            "parent": "minecraft:item/generated",
            "model": {
                "parent": "<parent>",
                "textures": {
                    "layer0": "<texture>"
                }
            },
            "overrides": ["minecraft:clock"]
        }
    }
}
```
All the fields can be removed (except for the content of `model`, which must be a valid item model) and will default to the values shown above, where fields between `<>` use previously-defined values.
As an example, the item defined above could be simplified as:
```json
{
    "item_id": {}
}
```
### Pipeline Parameters
| Parameter         | Type    | Action                                           |
|-------------------|---------|--------------------------------------------------|
| load              | `[str]` | get recursively every json file in this folder   |
| custom_namespace  | `str`   | generate all items in this namespace             |
| custom_model_data | `int`   | start indexing custom model data from this value |

---
- **GGUNZ data pack** is licensed under a [GNU GPLv3 license](/data_pack_license.md "See license")
- **GGUNZ resource pack** is licensed under a [CC BY 4.0 license](/resource_pack_license.md "See license")
