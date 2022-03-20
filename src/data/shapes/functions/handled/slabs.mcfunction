## get y coord's decimal points (ex: Y=69.45 -> .y = 45) 
execute store result score $y shapes.var run data get entity @s Pos[1] 100.0
scoreboard players operation $y shapes.var %= #100 shapes.var

## check if its a bottom slab
execute store result score $type shapes.var if block ~ ~ ~ #minecraft:slabs[type=bottom]
## if double slab, dont go through at all
execute if block ~ ~ ~ #minecraft:slabs[type=double] run scoreboard players set @s shapes.var 0
## if bottom slab, stop shapes.var if inside bottom part
execute if score $type shapes.var matches 1 if score $y shapes.var matches ..55 run scoreboard players set @s shapes.var 0
## if top slab, stop shapes.var if inside top part
execute if score $type shapes.var matches 0 if score $y shapes.var matches 45.. run scoreboard players set @s shapes.var 0