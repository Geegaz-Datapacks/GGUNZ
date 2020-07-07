
execute as @e[type=area_effect_cloud,tag=gz_projectile] run function ggunz:utilities/bullet_tick
execute as @a run function ggunz:utilities/player_tick
execute at @a as @e[type=item,distance=..10] run function ggunz:utilities/item_tick

scoreboard players set @a gz_click 0
scoreboard players set @a gz_sneak 0