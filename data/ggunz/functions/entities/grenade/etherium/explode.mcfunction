#------------------------------#
#
#------------------------------#
summon minecraft:creeper ~ ~ ~ {ExplosionRadius:1b,Fuse:0s,ActiveEffects:[{Id:2b,Amplifier:2b,Duration:100}]}
data modify entity @e[type=creeper,limit=1,sort=nearest] CustomName set from entity @s ArmorItems[3].tag.display.Name
kill @s
