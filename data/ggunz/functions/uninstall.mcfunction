
scoreboard objectives remove gz_sneak
scoreboard objectives remove gz_click
scoreboard objectives remove gz_bullets
scoreboard objectives remove gz_capacity
scoreboard objectives remove gz_damage
scoreboard objectives remove gz_reload
scoreboard objectives remove gz_reload_max
scoreboard objectives remove gz_id

tellraw @a {"translate":"ggunz.text.uninstall","color":"red","bold":true}
datapack disable "file/GGUNZ Data"