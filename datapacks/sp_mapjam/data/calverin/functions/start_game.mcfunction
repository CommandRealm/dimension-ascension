spawnpoint @a[gamemode=adventure,team=playing] 0 68 2000
gamemode spectator @a[team=spectating]
scoreboard players set $active game 1
function calverin:restart_game
scoreboard players set @a ticks 0
scoreboard players set @a dimension 2
scoreboard players reset @a void_time
tp @a 0 68 2000
clear @a
tag @a remove lobby
team join spectating @a[team=!playing,team=!spectating]
execute if score $high_score minutes matches 1.. run tellraw @a ["",{"text":"Current High Score:","underlined":true,"color":"dark_aqua"},{"text":" "},{"score":{"objective":"minutes","name":"$high_score"},"color":"gold"},{"text":" minutes, ","color":"gold"},{"score":{"objective":"seconds","name":"$high_score"},"color":"gold"},{"text":" seconds","color":"gold"}]