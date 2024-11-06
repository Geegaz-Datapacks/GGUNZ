# [x,z]*Rot(90) = [-z,x]
scoreboard players set $x shapes.var 100
scoreboard players operation $x shapes.var -= #z shapes.var
scoreboard players operation $z shapes.var = #x shapes.var