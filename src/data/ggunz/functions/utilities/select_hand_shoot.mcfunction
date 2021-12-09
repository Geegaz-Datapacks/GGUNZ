tag @s remove gz_mainhand
tag @s remove gz_offhand

execute unless entity @s[nbt={SelectedItem:{id:"minecraft:crossbow"}}] if data entity @s Inventory[{Slot:-106b}].tag.gz_data at @s run tag @s add gz_offhand
execute if entity @s[nbt={SelectedItem:{id:"minecraft:crossbow"}},tag=!gz_offhand] if data entity @s SelectedItem.tag.gz_data at @s run tag @s add gz_mainhand