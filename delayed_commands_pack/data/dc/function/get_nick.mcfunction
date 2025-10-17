setblock 11102025 255 0 minecraft:shulker_box

#give a head with player nick and copy in storage
loot insert 11102025 255 0 loot dc:get_nick
data modify storage dsb:dc init.playerName set from block 11102025 255 0 Items[0].components."minecraft:profile".name

setblock 11102025 255 0 minecraft:air