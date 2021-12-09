
function ggunz:utilities/select_hand_shoot

execute if entity @s[tag=gz_mainhand] run function ggunz:shoot/mainhand
execute if entity @s[tag=gz_offhand] run function ggunz:shoot/offhand

tag @s remove gz_shoot
tag @s remove gz_part_reload