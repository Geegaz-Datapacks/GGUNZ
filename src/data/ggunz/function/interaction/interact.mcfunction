function ggunz:debug/print {message:"interacted"}

execute as @e[type=interaction, tag=ggunz.interaction, sort=nearest] if data entity @s interaction run function ggunz:interaction/interact_entity
advancement revoke @s only ggunz:interaction/interact