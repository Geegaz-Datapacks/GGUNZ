#------------------------------#
#
#------------------------------#

effect give @s regeneration 5 0 false
effect give @s nausea 4 3 true
playsound minecraft:item.armor.equip_leather player @s ~ ~ ~ 1 1.8

execute if entity @s[tag=geegaz.tag.mainhand] run replaceitem entity @s weapon.mainhand air
execute if entity @s[tag=geegaz.tag.offhand] run replaceitem entity @s weapon.offhand air