"""Plugin that ...
"""


__all__ = [
    "GunsOptions",
    "guns",
]

from beet.core.utils import JsonDict
from typing import List, Optional
from beet.core.file import JsonFile
from json import dumps
from nbtlib import nbt, Int, Float, tag, serialize_tag

from pydantic import BaseModel

from beet import Context, configurable

class GunsOptions(BaseModel):
    load: List[str] = []

def beet_default(ctx: Context):
    ctx.require(guns)


@configurable(validator=GunsOptions)
def guns(ctx: Context, opts: GunsOptions):
    gun_id = 0
    for filepath in opts.load:
        for key, value in JsonFile(source_path=ctx.directory / filepath).data.items(): # parse json as nbt
            gun_data: JsonDict = value.get("gun_data")
        
            if gun_data:
                gun_nbt: nbt = tag.Compound({
                    "Capacity": Int(gun_data.get("capacity")),
                    "ReloadTime": Int(gun_data.get("reload_time")),
                    "Id": Int(gun_id),
                    "Ammo": Int(0)
                })

                command = f"data modify storage geegaz:ggunz temp.GunData set value {serialize_tag(gun_nbt)}\n"
                function_path = f"ggunz:recipes/{key}"
                if function_path in ctx.data.functions:
                    ctx.data.functions[function_path].prepend(command)
                    gun_id += 1