#------------------------------#
# 
#------------------------------#
execute if entity @s[tag=geegaz.tag.mainhand] store result score item ggunz.id run data get entity @s SelectedItem.tag.ggunz.id
execute if entity @s[tag=geegaz.tag.offhand] store result score item ggunz.id run data get entity @s Inventory[{Slot:-106b}].tag.ggunz.id

say hey

scoreboard players reset item