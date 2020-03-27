#------------------------------#
#
#------------------------------#

summon armor_stand ~ ~ ~ {Silent:1b,Small:1b,Invisible:1b,Tags:["ggunz.tag.frag_grenade","ggunz.tag.grenade","global.ignore"]}
execute as @p run loot replace entity @e[type=armor_stand,tag=ggunz.tag.frag_grenade,limit=1,sort=nearest] armor.head loot ggunz:actions/summon_frag_grenade
data modify entity @e[type=armor_stand,tag=ggunz.tag.frag_grenade,limit=1,sort=nearest] Motion set from entity @s Motion
kill @s