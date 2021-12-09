
scoreboard players set @s gz_reload 0
scoreboard players set @s gz_reload_max 0
execute if entity @s[tag=gz_mainhand] store result score @s gz_reload_max run data get entity @s SelectedItem.tag.gz_data.reload_time 20
execute if entity @s[tag=gz_offhand] store result score @s gz_reload_max run data get entity @s Inventory[{Slot: -106b}].tag.gz_data.reload_time 20

execute if entity @s[tag=gz_mainhand] run tag @s add gz_reloading
execute if entity @s[tag=gz_offhand] run tag @s add gz_reloading
