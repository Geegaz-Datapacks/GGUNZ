
execute if entity @s[tag=gz_shoot] run function ggunz:shoot/shoot
execute if entity @s[tag=gz_reloading] run function ggunz:reload/timer
execute if entity @s[scores={gz_click=1..}] at @s run function ggunz:items/select_click