effect give @s invisibility 2 255 true
effect give @s weakness 2 255 true
execute positioned 69 71 4012 unless entity @s[distance=..3] run tp @s 69 71 4012
stopsound @s * minecraft:block.glass.step
scoreboard players add @s void_time 1
execute if score @s void_time matches 200 run title @s subtitle ["",{"text":"Well congratulations...","color":"blue"}]
execute if score @s void_time matches 200 run title @s title ""
execute if score @s void_time matches 300 run title @s subtitle ["",{"text":"You completed your life's mission!","color":"blue"}]
execute if score @s void_time matches 300 run title @s title ""
execute if score @s void_time matches 400 run title @s subtitle ["",{"text":". . .","color":"blue"}]
execute if score @s void_time matches 400 run title @s title ""
execute if score @s void_time matches 500 run title @s subtitle ["",{"text":"Now what?","color":"blue"}]
execute if score @s void_time matches 500 run title @s title ""
execute if score @s void_time matches 600 run title @s subtitle ["",{"text":"Well I suppose there isn't much to do, is there?","color":"blue"}]
execute if score @s void_time matches 600 run title @s title ""
execute if score @s void_time matches 700 run title @s subtitle ["",{"text":"Maybe you can listen to some music?","color":"blue"}]
execute if score @s void_time matches 700 run title @s title ""
execute if score @s void_time matches 719 run stopsound @s *
execute if score @s void_time matches 720 run playsound music_disc.stal master @s ~ ~ ~ 3 1
execute if score @s void_time matches 800 run title @s subtitle ["",{"text":"Well this is nice, isn't it?","color":"blue"}]
execute if score @s void_time matches 800 run title @s title ""
execute if score @s void_time matches 900 run title @s subtitle ["",{"text":"Not very fulfilling though, hm?","color":"blue"}]
execute if score @s void_time matches 900 run title @s title ""
execute if score @s void_time matches 1000 run title @s subtitle ["",{"text":"Well instead of just waiting in this endless void...","color":"blue"}]
execute if score @s void_time matches 1000 run title @s title ""
execute if score @s void_time matches 1100 run title @s subtitle ["",{"text":"Maybe you should play again?","color":"blue"}]
execute if score @s void_time matches 1100 run title @s title ""
execute if score @s void_time matches 1301 run title @s subtitle ""

execute if score @s void_time matches 1100.. unless entity @s[nbt={Inventory:[{Slot:4b,id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4},Count:1b}]}] run clear @s
execute if score @s void_time matches 1100.. run item replace entity @s hotbar.4 with carrot_on_a_stick{CustomModelData:4,display:{Name:'["",{"text":"Play Again? ","color":"gold","italic":false,"bold":true},{"text":"(Press ","color":"dark_aqua","italic":true},{"keybind":"key.use","color":"dark_aqua","italic":true},{"text":"!)","color":"dark_aqua","italic":false}]'}}
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run stopsound @a * minecraft:music_disc.stal
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run function calverin:stop_game
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run scoreboard players set @s lobby_timer 10
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run scoreboard players set @a intro_timer 500
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run gamemode adventure @a
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run tag @a remove lobby
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run tag @a add intro_old
execute if score @s void_time matches 1100.. if score @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:4}}}] right_click matches 1.. run scoreboard players reset @s right_click