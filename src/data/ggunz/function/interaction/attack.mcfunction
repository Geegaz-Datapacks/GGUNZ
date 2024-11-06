function ggunz:debug/print {message:"attacked"}

execute as @e[type=interaction, tag=ggunz.interaction, sort=nearest] if data entity @s attack run function ggunz:interaction/attack_entity
advancement revoke @s only ggunz:interaction/attack