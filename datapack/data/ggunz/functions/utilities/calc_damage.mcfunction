
scoreboard players set multiplier gz_damage 100
scoreboard players set max gz_damage 326
scoreboard players operation @s gz_damage = @s gz_capacity
scoreboard players operation @s gz_damage -= @s gz_bullets
scoreboard players operation @s gz_damage *= multiplier gz_damage
scoreboard players operation @s gz_damage /= @s gz_capacity
scoreboard players operation @s gz_damage *= max gz_damage
execute if score @s gz_bullets = @s gz_capacity run scoreboard players add @s gz_damage 100
