
scoreboard players set @s gz_bullets 0
execute at @s run function ggunz:projectiles/move

execute if entity @s[tag=gz_bullet_0] run particle smoke ^ ^ ^-0.5 0 0 0 0 1
execute if entity @s[tag=gz_bullet_1] run particle enchanted_hit ^ ^ ^-0.5 0 0 0 0 1
execute if entity @s[tag=gz_bullet_2] run particle large_smoke ^ ^ ^-0.5 0 0 0 0 1