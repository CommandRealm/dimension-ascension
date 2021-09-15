execute if score $players game matches 1.. run function calverin:start_game
execute if score $players game matches 0 run function calverin:lobby/failed_start
scoreboard players reset @s right_click