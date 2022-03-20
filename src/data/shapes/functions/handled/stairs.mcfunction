execute store result score #x shapes.var run data get entity @s Pos[0] 100.0
execute store result score $y shapes.var run data get entity @s Pos[1] 100.0
execute store result score #z shapes.var run data get entity @s Pos[2] 100.0
scoreboard players operation #x shapes.var %= #100 shapes.var
scoreboard players operation $y shapes.var %= #100 shapes.var
scoreboard players operation #z shapes.var %= #100 shapes.var

### Rotation Invarience
scoreboard players operation $x shapes.var = #x shapes.var
scoreboard players operation $z shapes.var = #z shapes.var
execute if block ~ ~ ~ #minecraft:stairs[facing=north] run function shapes:transforms/rotate_90
execute if block ~ ~ ~ #minecraft:stairs[facing=west] run function shapes:transforms/rotate_180
execute if block ~ ~ ~ #minecraft:stairs[facing=south] run function shapes:transforms/rotate_270

scoreboard players set #bool shapes.var 0
### Shape = Straight
execute if score $x shapes.var matches 55.. run scoreboard players set #bool shapes.var 1

### Shapes
execute if block ~ ~ ~ #minecraft:stairs[shape=inner_left] if score $z shapes.var matches ..45 run scoreboard players set #bool shapes.var 1
execute if block ~ ~ ~ #minecraft:stairs[shape=inner_right] if score $z shapes.var matches 55.. run scoreboard players set #bool shapes.var 1
execute if block ~ ~ ~ #minecraft:stairs[shape=outer_left] if score $z shapes.var matches 45.. run scoreboard players set #bool shapes.var 0
execute if block ~ ~ ~ #minecraft:stairs[shape=outer_right] if score $z shapes.var matches ..55 run scoreboard players set #bool shapes.var 0

### Bottom Step
execute store result score #type shapes.var if block ~ ~ ~ #minecraft:stairs[half=bottom]
execute if score #type shapes.var matches 1 if score $y shapes.var matches ..55 run scoreboard players set #bool shapes.var 1
execute if score #type shapes.var matches 0 if score $y shapes.var matches 45.. run scoreboard players set #bool shapes.var 1

execute if score #bool shapes.var matches 1 run scoreboard players set @s shapes.var 0