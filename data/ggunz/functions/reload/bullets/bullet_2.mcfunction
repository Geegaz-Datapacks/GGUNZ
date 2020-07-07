
execute store success score temp gz_bullets run clear @s minecraft:clock{gz_data:{bullet_type:2}} 1
scoreboard players operation @s gz_bullets += temp gz_bullets

execute unless score temp gz_bullets matches 0 unless score @s gz_bullets >= @s gz_capacity run function ggunz:reload/bullets/bullet_2