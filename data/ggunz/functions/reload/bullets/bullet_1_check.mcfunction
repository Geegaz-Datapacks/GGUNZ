
scoreboard players operation temp gz_bullets = @s gz_bullets
scoreboard players add temp gz_bullets 4

execute unless score temp gz_bullets > @s gz_capacity run function ggunz:reload/bullets/bullet_1
