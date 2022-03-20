# [x,z]*Rot(270) = [z,-x]
scoreboard players set $z shapes.var 100
scoreboard players operation $z shapes.var -= #x shapes.var
scoreboard players operation $x shapes.var = #z shapes.var