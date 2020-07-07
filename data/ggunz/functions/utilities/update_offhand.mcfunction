
setblock ~ 0 ~ yellow_shulker_box
loot replace block ~ 0 ~ container.0 loot ggunz:gun_select
scoreboard players reset @s gz_damage
execute unless entity @s[scores={gz_bullets=..0}] run function ggunz:utilities/calc_damage

data modify block ~ 0 ~ Items[{Slot:0b}].tag.display.Name set from entity @s Inventory[{Slot:-106b}].tag.display.Name
data modify block ~ 0 ~ Items[{Slot:0b}].tag.Enchantments set from entity @s Inventory[{Slot:-106b}].tag.Enchantments
execute store result block ~ 0 ~ Items[{Slot:0b}].tag.gz_data.bullets int 1 run scoreboard players get @s gz_bullets
execute store result block ~ 0 ~ Items[{Slot:0b}].tag.gz_data.capacity int 1 run scoreboard players get @s gz_capacity
execute store result block ~ 0 ~ Items[{Slot:0b}].tag.Damage int 0.01 run scoreboard players get @s gz_damage

loot replace entity @s weapon.offhand 1 mine ~ 0 ~ air{drop_contents:1b}
setblock ~ 0 ~ bedrock
