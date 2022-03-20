execute store result score #x shapes.var run data get entity @s Pos[0] 100.0
execute store result score $y shapes.var run data get entity @s Pos[1] 100.0
execute store result score #z shapes.var run data get entity @s Pos[2] 100.0
scoreboard players operation #x shapes.var %= #100 shapes.var
scoreboard players operation $y shapes.var %= #100 shapes.var
scoreboard players operation #z shapes.var %= #100 shapes.var

### Rotation Invarience
scoreboard players operation $x shapes.var = #x shapes.var
scoreboard players operation $z shapes.var = #z shapes.var
execute if block ~ ~ ~ #minecraft:trapdoors[facing=north] run function shapes:transforms/rotate_90
execute if block ~ ~ ~ #minecraft:trapdoors[facing=west] run function shapes:transforms/rotate_180
execute if block ~ ~ ~ #minecraft:trapdoors[facing=south] run function shapes:transforms/rotate_270

execute if block ~ ~ ~ #minecraft:trapdoors[half=bottom,open=false] if score $y shapes.var matches ..25 run scoreboard players set @s shapes.var 0
execute if block ~ ~ ~ #minecraft:trapdoors[half=top,open=false] if score $y shapes.var matches 75.. run scoreboard players set @s shapes.var 0
execute if block ~ ~ ~ #minecraft:trapdoors[open=true] if score $x shapes.var matches ..25 run scoreboard players set @s shapes.var 0