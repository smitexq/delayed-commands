#if pos is loaded
$execute in $(dimension) if loaded $(X_int) $(Y_int) $(Z_int) run return 1

#delay + 10 seconds
function dc:delay/hold_up/start

return fail