
execute if entity @s[tag=gz_bullet_0] as @e[type=#ggunz:affected,sort=nearest,limit=1] run function ggunz:projectiles/hit/entity/bullet_0
execute if entity @s[tag=gz_bullet_1] as @e[type=#ggunz:affected,sort=nearest,limit=1] run function ggunz:projectiles/hit/entity/bullet_1
execute if entity @s[tag=gz_bullet_2] as @e[type=#ggunz:affected,sort=nearest,limit=1] run function ggunz:projectiles/hit/entity/bullet_2

execute unless entity @s[tag=gz_sniper_bullet] run kill @s