#
data modify storage dsb:dc init.Pos set from entity @s Pos

#current direction of view
execute rotated ~ ~ run tp @s ~ ~ ~ ~ ~
data modify storage dsb:dc init.RotationX set from entity @s Rotation[0]
data modify storage dsb:dc init.RotationY set from entity @s Rotation[1]
#kill marker
kill @s