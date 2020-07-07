
execute if entity @s[tag=gz_bullet_0] run function ggunz:projectiles/hit/block_bullet_0
execute if entity @s[tag=gz_bullet_1] run function ggunz:projectiles/hit/block_bullet_1
execute if entity @s[tag=gz_bullet_2] run function ggunz:projectiles/hit/block_bullet_2
execute if block ~ ~ ~ minecraft:bell run function ggunz:projectiles/hit/block_bell

execute unless entity @s[tag=gz_continue] run function ggunz:projectiles/hit/block_solid
tag @s remove gz_continue