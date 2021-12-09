
advancement revoke @s only ggunz:trigger
function ggunz:utilities/select_hand_shoot

execute if entity @s[tag=gz_mainhand] store result score @s gz_id run data get entity @s SelectedItem.tag.gz_data.id
execute if entity @s[tag=gz_offhand] store result score @s gz_id run data get entity @s Inventory[{Slot: -106b}].tag.gz_data.id

execute if entity @s[scores={gz_sneak=1..}] run tag @s add gz_part_reload
execute if entity @s[scores={gz_sneak=1..}] run function ggunz:reload/start
execute if entity @s[scores={gz_sneak=..0}] run function ggunz:shoot/guns/select
tag @s add gz_shoot