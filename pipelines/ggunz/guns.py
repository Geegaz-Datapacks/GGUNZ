"""Plugin that ...
"""


__all__ = [
    "GunsOptions",
    "guns",
]

import nbtlib
from typing import List, Optional
from beet.core.file import JsonFile
from nbtlib import nbt, tag

from pydantic import BaseModel

from beet import Context, configurable

class GunsOptions(BaseModel):
    load: List[str] = []

def beet_default(ctx: Context):
    ctx.require(guns)


@configurable(validator=GunsOptions)
def guns(ctx: Context, opts: GunsOptions):
    gun_id = 0
    for filename in opts.load:
        filepath = ctx.directory / filename
        for key, value in nbtlib.parse_nbt(filepath.read_text()).items(): # parse json as nbt
            # Add id and ammo manually
            value["Id"] = tag.Int(gun_id)
            value["Ammo"] = tag.Int(0)

            command = f"data modify storage geegaz:ggunz temp.GunData set value {value.snbt()} \n"
            function_path = f"ggunz:recipes/{key}"
            if function_path in ctx.data.functions:
                ctx.data.functions[function_path].prepend(command)
                gun_id += 1