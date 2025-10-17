#count tasks
execute store result score *var1 dc_variables run data get storage dsb:dc work
#if there no tasks left
execute if score *var1 dc_variables matches 0 run return 0


###first task in processing (from the end)
data modify storage dsb:dc temp set from storage dsb:dc work[-1]
#flag for check requireEntity and requirePos
scoreboard players set #AND dc_variables 1

#if entity is need to execute a command, we check if it still exist
execute if data storage dsb:dc temp{requireEntity:1} store result score *var3 dc_variables run function dc:delay/check_if_entity with storage dsb:dc temp
scoreboard players operation #AND dc_variables *= *var3 dc_variables

#check if pos is loaded (in the right dimension)
execute if data storage dsb:dc temp{requirePos:1} store result score *var3 dc_variables run function dc:delay/get_coords
scoreboard players operation #AND dc_variables *= *var3 dc_variables


#delete task
data remove storage dsb:dc work[-1]
#check the flag. If a condition is not met, proceed to the next task
execute if score #AND dc_variables matches 0 run return run function dc:delay/loop_works

###
#run AS entity AT @s
execute if data storage dsb:dc temp{requirePos:0, requireEntity:1} run function dc:delay/run_cmd/on_entity with storage dsb:dc temp
#run AS server AT 0 0 0 in overworld
execute if data storage dsb:dc temp{requirePos:0, requireEntity:0} run function dc:delay/run_cmd/blank_launch with storage dsb:dc temp
#run AS entity AT $X $Y $Z
execute if data storage dsb:dc temp{requirePos:1, requireEntity:1} run function dc:delay/run_cmd/as_entity with storage dsb:dc temp
#run AT $X $Y $Z
execute if data storage dsb:dc temp{requirePos:1, requireEntity:0} run function dc:delay/run_cmd/on_position with storage dsb:dc temp
###

#go to next
function dc:delay/loop_works