tag @s remove gz_mainhand
tag @s remove gz_offhand

execute unless entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] if data entity @s Inventory[{Slot:-106b}].tag.gz_data at @s run tag @s add gz_offhand
execute if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},tag=!gz_offhand] if data entity @s SelectedItem.tag.gz_data at @s run tag @s add gz_mainhand


