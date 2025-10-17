#store current gametime
data modify storage dsb:dc temp set value {}
execute store result storage dsb:dc temp.time int 1 run time query gametime

#creating a list of task that need to be executed at the current time
data modify storage dsb:dc work set value []
function dc:delay/get_tasks with storage dsb:dc temp

#go through the list of tasks and complete each one
function dc:delay/loop_works