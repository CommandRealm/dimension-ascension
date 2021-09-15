tag @a[tag=!intro_old,tag=!intro_new] add lobby
gamemode adventure @a[tag=lobby]
scoreboard players set @a[tag=!admin] lobby_timer 5
tp @a[tag=!admin] 0 9.5 55 180 .5
scoreboard players set $active game 0
function calverin:restart_game