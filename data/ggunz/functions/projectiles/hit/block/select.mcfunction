
execute if entity @s[tag=gz_bullet_0] run function ggunz:projectiles/hit/block/bullet_0
execute if entity @s[tag=gz_bullet_1] run function ggunz:projectiles/hit/block/bullet_1
execute if entity @s[tag=gz_bullet_2] run function ggunz:projectiles/hit/block/bullet_2

execute unless entity @s[tag=gz_continue] run function ggunz:projectiles/hit/block/solid
tag @s remove gz_continue