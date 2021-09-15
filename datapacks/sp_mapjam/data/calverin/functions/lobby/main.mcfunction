tag @s remove intro_old
tag @s remove intro_new
gamemode adventure @a[tag=lobby,tag=!admin]
effect give @s invisibility 2 10 true
#effect give @s night_vision 2 255 true
effect give @s weakness 2 255 true
scoreboard players reset @s intro_timer
execute if score @s lobby_timer matches 1.. run scoreboard players remove @s lobby_timer 1
execute if score @s lobby_timer matches 0 run tp @s 0 9.5 55 180 .5

# Make prefixes visible
team modify spectating prefix {"text":"[SPECTATING] ","color":"gray"}
team modify playing prefix {"text":"[PLAYING] ","color":"gold"}

# RP Message
title @s actionbar ["",{"text":"The required resource pack is ","color":"white"},{"translate":"DISABLED","bold":true,"color":"gold"}]

# Items
execute as @a[gamemode=adventure,tag=lobby,team=playing] at @s unless entity @s[nbt={Inventory:[{Slot:4b,id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:1},Count:1b}]}] run clear @s
execute as @a[gamemode=adventure,tag=lobby,team=spectating] at @s unless entity @s[nbt={Inventory:[{Slot:4b,id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2},Count:1b}]}] run clear @s
execute as @a[gamemode=adventure,tag=lobby] at @s unless entity @s[nbt={Inventory:[{Slot:0b,id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:3},Count:1b}]}] run clear @s
execute as @a[gamemode=adventure,tag=lobby] at @s unless entity @s[nbt={Inventory:[{Slot:8b,id:"minecraft:written_book",tag:{CustomModelData:1},Count:1b}]}] run clear @s
item replace entity @a[gamemode=adventure,tag=lobby,team=playing] hotbar.4 with carrot_on_a_stick{CustomModelData:1,display:{Name:'["",{"text":"You will Play! ","color":"green","italic":false},{"text":"(Press ","color":"gray","italic":false},{"keybind":"key.use","color":"gray","italic":true},{"text":" to spectate.)","color":"gray","italic":false}]'}}
item replace entity @a[gamemode=adventure,tag=lobby,team=spectating] hotbar.4 with carrot_on_a_stick{CustomModelData:2,display:{Name:'["",{"text":"You will Spectate! ","color":"red","italic":false},{"text":"(Press ","color":"gray","italic":false},{"keybind":"key.use","color":"gray","italic":true},{"text":" to play.)","color":"gray","italic":false}]'}}
item replace entity @a[gamemode=adventure,tag=lobby] hotbar.0 with carrot_on_a_stick{CustomModelData:3,display:{Name:'["",{"text":"Press ","color":"gold","italic":false},{"keybind":"key.use","color":"gold","italic":true},{"text":" to start the game!","color":"gold","italic":false}]'}}
item replace entity @a[gamemode=adventure,tag=lobby] hotbar.8 with written_book{CustomModelData:1,display:{Name:'["",{"text":"Map Credits and Intro Text ","color":"white","italic":false},{"text":"(Press ","color":"dark_aqua","italic":false},{"keybind":"key.use","color":"dark_aqua","italic":true},{"text":" to view.)","color":"dark_aqua","italic":false}]'},HideFlags:63,pages:['{"text":"§1=-=-=-CREDITS-=-=-=\\n\\n§4---| PROGRAMMING |---\\n§6§lCalverin\\n\\n§r§2--|  LEVEL DESIGN  |--\\n§3§lCaptonium & EdLePug\\n\\n§4§5--|  ART & MODELS  |--\\n§d§lEdLePug & Calverin\\n\\n§r§1=-=-=-=-=-=-=-=-=-="}','["",{"text":"§8=-=-=Intro Text=-=-=\\n\\n§0You are an inter-dimensional explorer. \\n\\nYou have one goal in life.\\n\\nBe the first to find the "},{"text":"Fourth Dimension","bold":true},{"text":".","color":"reset"}]','{"text":"Many people doubt its existence; they believe there are only three dimensions.\\n\\nYou know better. You know it is real.\\n\\nAnd after years of searching, you finally know where it is.\\n\\n§8=-=-=-=-=-=-=-=-=-="}'],title:"Credits and Intro Text",author:"Command Realm"}

# Switch Playing/Spectating
execute as @a[gamemode=adventure,tag=lobby,team=playing,scores={right_click=1..}] at @s if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:1},Count:1b}}] run function calverin:lobby/to_spectating
execute as @a[gamemode=adventure,tag=lobby,team=spectating,scores={right_click=1..}] at @s if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2},Count:1b}}] run function calverin:lobby/to_playing

# Try to Start Game
execute as @a[gamemode=adventure,tag=lobby,scores={right_click=1..}] at @s if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:3},Count:1b}}] run function calverin:lobby/start_attempt