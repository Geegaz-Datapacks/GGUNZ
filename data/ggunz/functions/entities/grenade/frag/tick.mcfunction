#------------------------------#
#
#------------------------------#
particle smoke ~ ~0.8 ~ 0 0 0 0.02 1
playsound minecraft:block.sand.place hostile @a ~ ~ ~ 1 1.5
playsound minecraft:entity.silverfish.hurt hostile @a ~ ~ ~ 0.1 1.5

scoreboard players add @s ggunz.timer 1
execute if entity @s[scores={ggunz.timer=60..}] run function ggunz:entities/grenade/frag/explode