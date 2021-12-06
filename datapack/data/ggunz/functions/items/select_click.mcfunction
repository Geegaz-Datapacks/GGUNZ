
function ggunz:utilities/select_hand_reload

execute if entity @s[tag=gz_mainhand] run function ggunz:items/mainhand
execute if entity @s[tag=gz_offhand] run function ggunz:items/offhand

tag @s remove gz_item_use