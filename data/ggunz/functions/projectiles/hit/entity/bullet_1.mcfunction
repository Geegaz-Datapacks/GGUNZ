
execute if entity @s[type=!#ggunz:undead] run effect give @s minecraft:instant_damage 1 0 true
execute if entity @s[type=#ggunz:undead] run effect give @s minecraft:instant_health 1 0 true
execute if entity @s[type=witch] run effect give @s minecraft:instant_damage 1 3 true
effect give @s slowness 3 3

execute positioned ^ ^ ^-0.2 run particle minecraft:block minecraft:diamond_block ~ ~ ~ 0 0 0 0 5
