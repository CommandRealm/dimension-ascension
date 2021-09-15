tag @e[type=armor_stand,tag=key,limit=1,sort=nearest,tag=!key_move] add key_move
execute if entity @e[type=armor_stand,tag=key,tag=key_move] run tag @s add key_move

## Key Hole Movement
# X
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[0] 100
execute store result score @s key_locate run data get entity @s Pos[0] 100
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[0] double -0.001 run scoreboard players operation @s key_locate -= @e[type=minecraft:marker,tag=key_hole,tag=gate_closed,tag=key_move,limit=1,sort=nearest] key_locate
# Y
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[1] 100
execute store result score @s key_locate run data get entity @s Pos[1] 100
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[1] double -0.001 run scoreboard players operation @s key_locate -= @e[type=minecraft:marker,tag=key_hole,tag=gate_closed,tag=key_move,limit=1,sort=nearest] key_locate
# Z
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[2] 100
execute store result score @s key_locate run data get entity @s Pos[2] 100
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[2] double -0.001 run scoreboard players operation @s key_locate -= @e[type=minecraft:marker,tag=key_hole,tag=gate_closed,tag=key_move,limit=1,sort=nearest] key_locate

execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move,distance=2..] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b, Tags: ["key_hole_rotate","key"],Silent:1b}
execute as @e[type=armor_stand,tag=key,tag=key_hole_rotate] at @s run tp @s ~ ~ ~ facing entity @e[type=marker,tag=key_hole,tag=needs_key,limit=1,sort=nearest]
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move,distance=2..] at @s store result entity @s Rotation[0] float 1 run data get entity @e[type=armor_stand,tag=key,tag=key_hole_rotate,limit=1,sort=nearest] Rotation[0]

# Unlock
execute positioned ~ ~-.1 ~ if entity @e[type=minecraft:armor_stand,tag=key,tag=key_move,distance=..0.5] run function calverin:key/unlock

## Reset
tag @e remove key_move
kill @e[tag=key_hole_rotate]