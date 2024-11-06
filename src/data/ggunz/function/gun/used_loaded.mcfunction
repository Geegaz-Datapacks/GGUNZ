function ggunz:debug/print {message:"used loaded gun"}

kill @e[type=arrow,sort=nearest,limit=1]
stopsound @a player item.crossbow.shoot

playsound minecraft:entity.wind_charge.wind_burst player @a ~ ~ ~ 0.8 2.0
playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 3.0 1.25

advancement revoke @s only ggunz:gun/used_loaded