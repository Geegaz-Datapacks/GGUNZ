
scoreboard players add @s gz_reload 1

title @s actionbar [{"translate":"ggunz.text.reloading","bold":"true"}]

execute if score @s gz_reload >= @s gz_reload_max run function ggunz:reload/validate

