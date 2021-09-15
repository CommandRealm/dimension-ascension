tag @s remove lobby
tag @s remove intro_new
scoreboard players operation @s leave_timer = $world leave_timer
execute if score $active game matches 0 run tag @s add intro_old
execute if score $active game matches 0 run scoreboard players set @s intro_timer 440
execute if score $active game matches 1 run spawnpoint @s 0 68 2000
execute if score $active game matches 1 run kill @s
execute if score $active game matches 1 if score $players game matches 0 unless entity @s[team=playing] run function calverin:stop_game
execute if score $active game matches 1 if score $players game matches 1.. run tag @s remove has_key
execute if score $active game matches 1 if score $players game matches 1.. unless entity @s[team=playing] run function calverin:spectate