#store all data for execute this command
data modify storage dsb:dc init set from storage dsb:dc temp

#time + 10 seconds
execute store result score *var2 dc_variables run time query gametime
scoreboard players set *var3 dc_variables 60
execute store result storage dsb:dc init.time int 1 run scoreboard players operation *var2 dc_variables += *var3 dc_variables

#append in list Tasks
data modify storage dsb:dc Tasks append from storage dsb:dc init

#delay
schedule function dc:delay/start 3s append