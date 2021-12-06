
function ggunz:projectiles/spawn/bullet_2

execute anchored eyes positioned ^ ^0.2 ^1.2 run particle campfire_cosy_smoke ~ ~ ~ 0 0 0 0 1
execute anchored eyes positioned ^ ^1 ^1.2 run particle minecraft:explosion ~ ~ ~ 0 0 0 0 1
tp @s ~ ~ ~ ~ ~-25


execute at @s run playsound minecraft:entity.blaze.hurt player @a ~ ~ ~ 6.0 2
execute at @s run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 6.0 1