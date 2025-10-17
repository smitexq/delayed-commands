#if entity exist AND is loaded in world, then complete the check (we can run the command) and return TRUE
# PS* value in dc_ExistEntity always matches 1, if entity exist (doesn't matter if loaded or not)
$execute if score $(UUID) dc_ExistEntity matches 1 if entity $(UUID) run return 1

#if entity EXIST, BUT NOT LOADED, then hold up this task and delay execution by 10 seconds
#'raw' predicate. The player's nickname changes, as the scoreboard cannot check the player's value based on their UUID, unlike other creatures
$execute if predicate {"condition": "minecraft:any_of", "terms":[{"condition": "minecraft:value_check", \
"value":{"type": "minecraft:score","target": {"type": "minecraft:fixed","name": "$(UUID)"},"score": "dc_ExistEntity"},"range": 1}, {"condition": "minecraft:value_check", \
"value":{"type": "minecraft:score","target": {"type": "minecraft:fixed","name": "$(playerName)"},"score": "dc_ExistEntity"},"range": 1}]} \
run function dc:delay/hold_up/start

#mark the flag go to next task
return fail