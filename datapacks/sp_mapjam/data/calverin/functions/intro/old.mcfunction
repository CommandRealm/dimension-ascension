# Shortened cutscene for returning players and end of cutscene for new ones
execute if score @s intro_timer matches 502 run gamemode adventure @s
execute if score @s intro_timer matches 502 run tag @s remove intro_new
execute if score @s intro_timer matches 502 run title @s subtitle {"text":"presents...","color":"white"}
execute if score @s intro_timer matches 502 run title @s title ["",{"text":"Command","color":"aqua","bold":true},{"text":" Realm","color":"dark_aqua","bold":true}]
execute if score @s intro_timer matches 572 run title @s subtitle ""
execute if score @s intro_timer matches 572 run title @s title ["",{"text":"Dimension ","color":"dark_red","bold":true},{"text":"Ascension","color":"dark_purple","bold":true}]
execute if score @s intro_timer matches 642 run tag @s remove intro_old
execute if score @s intro_timer matches 642 run tag @s remove intro_new
execute if score @s intro_timer matches 642 run team join playing @s
execute if score @s intro_timer matches 642 run tp @s 0 9.5 55 180 .5
execute if score @s intro_timer matches 642 run scoreboard players set @s lobby_timer 5
execute if score @s intro_timer matches 642 run tag @s add lobby
execute if score @s intro_timer matches 642 if score $players game matches 1.. if score $active game matches 1 run function calverin:spectate