
scoreboard players add @s gz_bullets 1
tp @s ^ ^ ^0.5

execute as @e[type=#ggunz:affected,tag=!gz_shoot,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run tag @a[distance=0.1,tag=gz_projectile] add gz_hit

execute unless block ~ ~ ~ #ggunz:non_solid run function ggunz:projectiles/hit/block/select
execute if entity @s[tag=gz_hit] at @s run function ggunz:projectiles/hit/entity/select

execute unless entity @s[tag=gz_hit] if score @s gz_bullets < @s gz_capacity at @s run function ggunz:projectiles/move

