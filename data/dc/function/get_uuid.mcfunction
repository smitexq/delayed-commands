#saving UUID of entity. And mark in dc_ExistEntity value 1
scoreboard players set @s dc_ExistEntity 1

###the gu library allows you to get a uuid from 4 digits. Not my code
function dc:gu/generate
data modify storage dsb:dc init.UUID set from storage gu:main out

#if entity - player, then get his nick, otherwise value is null (need for macros in check_if_entity)
data modify storage dsb:dc init.playerName set value "#null"
execute if entity @s[type=minecraft:player] run function dc:get_nick