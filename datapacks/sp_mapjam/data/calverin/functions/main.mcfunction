# Effects
effect give @a minecraft:saturation 1000000 255 true
effect give @a minecraft:resistance 1000000 255 true
execute as @a run attribute @s minecraft:generic.knockback_resistance base set 1.0

# Clear items on ground
kill @e[type=item,nbt={OnGround:1b}]

# Join Game
scoreboard players add $world leave_timer 1
scoreboard players add @a[tag=has_joined] leave_timer 1
scoreboard players remove @a[scores={leave=1..}] leave_timer 1000
scoreboard players reset @a[scores={leave=1..}] leave
execute as @a[tag=!has_joined] at @s run scoreboard players set @s intro_timer -60
execute as @a[tag=!has_joined] at @s run tag @s add intro_new
execute as @a[tag=has_joined] at @s unless score @s leave_timer = $world leave_timer run function calverin:rejoin

execute if score $world leave_timer matches 40000.. run scoreboard players set @a[tag=has_joined] leave_timer 2
execute if score $world leave_timer matches 40000.. run scoreboard players set $world leave_timer 2

# Intros
team leave @a[tag=intro_old]
team leave @a[tag=intro_new]
execute as @a[team=!playing,team=!spectating,tag=!admin] at @s run function calverin:intro/main
scoreboard players reset @a[tag=!intro_old,tag=!intro_new] intro_timer

# Lobby
execute as @a[tag=lobby,tag=!admin] at @s run function calverin:lobby/main

# Game
execute if entity @a[gamemode=adventure,team=playing] if score $active game matches 1 run function calverin:game

# Player Count
execute store result score $all_players game if entity @a
execute store result score $players game if entity @a[gamemode=adventure,team=playing]

# Stop game if too few players
execute if score $players game matches 0 if score $active game matches 1 run function calverin:stop_game

# Reset
scoreboard players reset @a[tag=lobby] right_click