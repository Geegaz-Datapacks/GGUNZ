#------------------------------#
#
#------------------------------#
execute store result score @s ggunz.id run data get entity @s Item.tag.ggunz.id
execute unless entity @s[scores={ggunz.id=1..}] run tag @s add ggunz.tag.snbl

execute if score @s ggunz.id matches 40 run function ggunz:entities/grenade/frag/summon
execute if score @s ggunz.id matches 41 run function ggunz:entities/grenade/etherium/summon
