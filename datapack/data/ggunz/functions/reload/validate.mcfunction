
function ggunz:utilities/select_hand_reload
execute unless entity @s[tag=gz_mainhand] unless entity @s[nbt={SelectedItem:{id:"minecraft:crossbow"}}] if data entity @s Inventory[{Slot:-106b}].tag.gz_data at @s run tag @s add gz_offhand
execute unless entity @s[tag=gz_offhand] if entity @s[nbt={SelectedItem:{id:"minecraft:crossbow"}}] if data entity @s SelectedItem.tag.gz_data at @s run tag @s add gz_mainhand

execute if entity @s[tag=gz_mainhand] store result score @s gz_reload_max run data get entity @s SelectedItem.tag.gz_data.reload_time 20
execute if entity @s[tag=gz_offhand] store result score @s gz_reload_max run data get entity @s Inventory[{Slot: -106b}].tag.gz_data.reload_time 20

execute if entity @s[tag=gz_mainhand] if score @s gz_reload >= @s gz_reload_max run function ggunz:reload/mainhand
execute if entity @s[tag=gz_offhand] if score @s gz_reload >= @s gz_reload_max run function ggunz:reload/offhand
execute unless entity @s[tag=gz_mainhand] unless entity @s[tag=gz_offhand] run tag @s remove gz_reloading
