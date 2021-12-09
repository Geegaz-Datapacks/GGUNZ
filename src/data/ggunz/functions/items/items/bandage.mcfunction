
execute if entity @s[tag=gz_mainhand] run item replace entity @s weapon.mainhand with air
execute if entity @s[tag=gz_offhand] run item replace entity @s weapon.offhand with air

effect give @s nausea 4 0 true
effect give @s regeneration 10 0