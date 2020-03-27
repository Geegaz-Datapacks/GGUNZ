#------------------------------#
#
#------------------------------#
summon minecraft:creeper ~ ~ ~ {ExplosionRadius:2b,Fuse:0s}
data modify entity @e[type=creeper,limit=1,sort=nearest] CustomName set from entity @s ArmorItems[3].tag.display.Name
kill @s
