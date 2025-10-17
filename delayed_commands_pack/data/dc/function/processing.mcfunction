#store request coords
execute if data storage dsb:dc init{requirePos:1} summon marker run function dc:get_pos
#if entity, then store uuid and nick (if player)
execute if data storage dsb:dc init{requireEntity:1} as @s run function dc:get_uuid

#time at which the command should be executed
execute store result score *var1 dc_variables run time query gametime
execute store result score *var2 dc_variables run data get storage dsb:dc init.time
execute store result storage dsb:dc init.time int 1 run scoreboard players operation *var1 dc_variables += *var2 dc_variables

#the dimension in which the command was invoked
execute if dimension minecraft:overworld run data modify storage dsb:dc init.dimension set value "minecraft:overworld"
execute if dimension minecraft:the_nether run data modify storage dsb:dc init.dimension set value "minecraft:the_nether"
execute if dimension minecraft:the_end run data modify storage dsb:dc init.dimension set value "minecraft:the_end"
# execute if dimension namespace:your_dimension run data modify storage dsb:dc init.dimension set value "namespace:your_dimension"

#after processing append request to list with all tasks
data modify storage dsb:dc Tasks append from storage dsb:dc init