$data remove storage dsb:dc Tasks[{UUID:$(UUID),command:"$(command)"}]


###if requireEntity:false and {UUID:null}

data modify storage dsb:dc checkUUID set value null
$execute store success score *var1 dc_variables run data modify storage dsb:dc checkUUID set value $(UUID)

execute if score *var1 dc_variables matches 1 run return fail

$data remove storage dsb:dc Tasks[{requireEntity:0, command:"$(command)"}]