
execute if entity @s[tag=ggunz.mainhand] run data modify storage geegaz:ggunz temp.GunData set from entity @s SelectedItem.tag.ggunz.GunData
execute if entity @s[tag=offhand] run data modify storage geegaz:ggunz temp.GunData set from entity @s Inventory[{Slot:-106b}].tag.ggunz.GunData

execute store result score $ggunz.id ggunz.var run data get storage geegaz:ggunz temp.GunData.Id
execute store result score $ggunz.ammo ggunz.var run data get storage geegaz:ggunz temp.GunData.Ammo
execute store result score $ggunz.capacity ggunz.var run data get storage geegaz:ggunz temp.GunData.Capacity
execute store result score $ggunz.reload_time ggunz.var run data get storage geegaz:ggunz temp.GunData.ReloadTime 20

say loaded gun data in storage