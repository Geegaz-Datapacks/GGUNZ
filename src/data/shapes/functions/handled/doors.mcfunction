execute store result score #x shapes.var run data get entity @s Pos[0] 100.0
execute store result score #z shapes.var run data get entity @s Pos[2] 100.0
scoreboard players operation #x shapes.var %= #100 shapes.var
scoreboard players operation #z shapes.var %= #100 shapes.var

### Rotation Invarience
scoreboard players operation $x shapes.var = #x shapes.var
scoreboard players operation $z shapes.var = #z shapes.var
execute if block ~ ~ ~ #minecraft:doors[facing=north] run function shapes:transforms/rotate_90
execute if block ~ ~ ~ #minecraft:doors[facing=west] run function shapes:transforms/rotate_180
execute if block ~ ~ ~ #minecraft:doors[facing=south] run function shapes:transforms/rotate_270

execute if block ~ ~ ~ #minecraft:doors[hinge=left,open=true] if score $z shapes.var matches ..25 run scoreboard players set @s shapes.var 0
execute if block ~ ~ ~ #minecraft:doors[hinge=right,open=true] if score $z shapes.var matches 75.. run scoreboard players set @s shapes.var 0
execute if block ~ ~ ~ #minecraft:doors[open=false] if score $x shapes.var matches ..25 run scoreboard players set @s shapes.var 0