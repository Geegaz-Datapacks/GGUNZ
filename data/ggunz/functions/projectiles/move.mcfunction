
scoreboard players add @s gz_bullets 1
tp @s ^ ^ ^0.5

execute positioned ~ ~-1 ~ as @e[type=#ggunz:affected,distance=..2,tag=!gz_shoot] at @s run function ggunz:projectiles/detect_hitbox
execute unless block ~ ~ ~ #ggunz:non_solid run function ggunz:projectiles/hit/block_select

execute unless entity @s[tag=gz_hit] if score @s gz_bullets < @s gz_capacity at @s run function ggunz:projectiles/move

