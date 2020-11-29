
execute as @s anchored eyes positioned ^ ^ ^1 run summon area_effect_cloud ~ ~ ~ {Age:0,Duration:200,Tags:["gz_projectile","gz_bullet_2","gz_spawn"]}
execute as @s run data modify entity @e[type=area_effect_cloud, tag=gz_spawn, limit=1] Rotation set from entity @s Rotation

execute as @e[type=area_effect_cloud, tag=gz_spawn, limit=1] run scoreboard players set @s gz_capacity 8
execute as @e[type=area_effect_cloud, tag=gz_spawn] run tag @s remove gz_spawn