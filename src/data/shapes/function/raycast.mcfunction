# $temp shapes.var  -> the remaining distance saved before hit detection
# @s shapes.var     -> the remaining distance. 0 means a hit happened

scoreboard players operation $temp shapes.var = @s shapes.var

execute unless block ~ ~ ~ #shapes:air run scoreboard players set @s shapes.var 0
#execute if block ~ ~ ~ #shapes:partial run function shapes:partial

scoreboard players add @s[scores={shapes.var=0}] shapes.hit 1
scoreboard players operation @s[tag=shapes.pass] shapes.var = $temp shapes.var

scoreboard players remove @s shapes.var 1
execute if score @s shapes.var matches 1.. positioned ^ ^ ^0.05 run function shapes:raycast
