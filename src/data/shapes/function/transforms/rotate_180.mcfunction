# [x,z]*Rot(180) = [-x,-z]
scoreboard players set $x shapes.var 100
scoreboard players set $z shapes.var 100
scoreboard players operation $x shapes.var -= #x shapes.var
scoreboard players operation $z shapes.var -= #z shapes.var