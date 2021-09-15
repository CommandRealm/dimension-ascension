# Keep key alive
execute store result score $result key_count if entity @e[type=armor_stand,tag=key]
execute if score $result key_count matches 2.. run kill @e[tag=key]
execute unless entity @e[type=armor_stand,tag=key] as @a[gamemode=adventure,team=playing,tag=has_key] at @s run function calverin:key/summon

# Steal Key
execute as @a[gamemode=adventure,team=playing,tag=has_key,scores={was_punched=15..}] at @s if entity @a[gamemode=adventure,team=playing,scores={punch=0},tag=!has_key] unless entity @e[type=marker,tag=key_hole,tag=needs_key] run function calverin:key/steal
scoreboard players reset @a punch
scoreboard players reset @a was_punched

# Move key to player with key or to key hole or kill key
execute as @a[gamemode=adventure,team=playing,tag=has_key,limit=1] at @s run function calverin:key/move
execute as @e[type=marker,tag=key_hole,tag=needs_key,limit=1] at @s run function calverin:key/key_hole_move
execute as @e[type=armor_stand,tag=key] unless entity @a[gamemode=adventure,team=playing,tag=has_key] unless entity @e[type=marker,tag=key_hole,tag=needs_key] at @s run tag @p[gamemode=adventure,team=playing] add has_key

# Key pickup
execute as @e[type=marker,tag=key_pickup_spawn,tag=active] at @s unless block ~ ~ ~ potted_poppy unless entity @a[tag=has_key] unless entity @e[type=marker,tag=key_hole,tag=needs_key] run setblock ~ ~ ~ potted_poppy
execute as @e[type=marker,tag=key_pickup_spawn,tag=active] at @s if block ~ ~ ~ potted_poppy if entity @a[tag=has_key] run setblock ~ ~ ~ potted_bamboo
execute as @a[gamemode=adventure,team=playing,tag=!has_key] at @s if block ~ ~ ~ potted_poppy unless entity @a[tag=has_key] run function calverin:key/pickup

# Gate opening animation
execute as @e[type=marker,tag=key_hole,tag=gate_open] at @s run function calverin:key/gate_open