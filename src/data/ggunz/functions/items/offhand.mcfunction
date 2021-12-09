
execute store result score @s gz_id run data get entity @s Inventory[{Slot:-106b}].tag.gz_data.id
execute if data entity @s Inventory[{Slot:-106b}].tag.gz_data.item run function ggunz:items/items/select

execute if entity @s[tag=!gz_item_use,scores={gz_sneak=1..}] at @s run function ggunz:reload/start
execute if entity @s[tag=!gz_item_use,scores={gz_sneak=..0}] at @s run playsound minecraft:block.iron_trapdoor.open player @s ~ ~ ~ 1.0 2