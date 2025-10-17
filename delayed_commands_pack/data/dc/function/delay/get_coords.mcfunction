#store coords
data modify storage dsb:dc temp.X set from storage dsb:dc temp.Pos[0]
data modify storage dsb:dc temp.Y set from storage dsb:dc temp.Pos[1]
data modify storage dsb:dc temp.Z set from storage dsb:dc temp.Pos[2]

#converting to int, because 'if loaded' command not take a float
data modify storage dsb:dc intPos.dimension set from storage dsb:dc temp.dimension
execute store result storage dsb:dc intPos.X_int int 1 run data get storage dsb:dc temp.X
execute store result storage dsb:dc intPos.Y_int int 1 run data get storage dsb:dc temp.Y
execute store result storage dsb:dc intPos.Z_int int 1 run data get storage dsb:dc temp.Z

return run function dc:delay/check_if_loaded with storage dsb:dc intPos