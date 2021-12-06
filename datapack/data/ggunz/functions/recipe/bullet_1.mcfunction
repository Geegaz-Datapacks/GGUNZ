
execute store result score @s gz_capacity run data get entity @s Item.Count 1
execute as @e[distance=0,limit=1] store result score @s gz_capacity run data get entity @s Item.Count 1
scoreboard players remove @s gz_capacity 1
scoreboard players remove @e[distance=0,limit=1] gz_capacity 1
execute store result entity @s Item.Count int 1 run scoreboard players get @s gz_capacity
execute as @e[distance=0,limit=1] store result entity @s Item.Count int 1 run scoreboard players get @s gz_capacity

loot spawn ~ ~ ~ loot ggunz:items/bullet_1

execute at @s run playsound minecraft:block.bamboo.hit master @a ~ ~ ~ 0.5 0 1
