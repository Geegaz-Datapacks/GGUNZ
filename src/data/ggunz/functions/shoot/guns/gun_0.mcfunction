
function ggunz:projectiles/spawn/bullet_0

execute anchored eyes positioned ^ ^0.2 ^1.2 run particle campfire_cosy_smoke ~ ~ ~ 0 0 0 0 1
tp @s ~ ~ ~ ~ ~-10

execute at @s run playsound minecraft:entity.blaze.hurt player @a ~ ~ ~ 6.0 2
execute at @s run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 6.0 1.5