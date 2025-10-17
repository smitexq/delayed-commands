# require: true/false
#store all data for command
$data modify storage dsb:dc init set value {time:$(tick), command:"$(command)", requirePos:$(requirePos), requireEntity:$(requireEntity)}

#processing request
function dc:processing

#delayed start
$schedule function dc:delay/start $(tick)t append