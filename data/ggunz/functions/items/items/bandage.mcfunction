
execute if entity @s[tag=gz_mainhand] run replaceitem entity @s weapon.mainhand air
execute if entity @s[tag=gz_offhand] run replaceitem entity @s weapon.offhand air

effect give @s nausea 4 0 true
effect give @s regeneration 10 0