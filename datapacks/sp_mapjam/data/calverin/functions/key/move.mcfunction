## Select
execute unless entity @e[type=marker,tag=key_hole,tag=gate_closed,distance=..4] run tag @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest,tag=!key_move] add key_move
tag @e[type=armor_stand,tag=key,limit=1,sort=nearest,tag=!key_move] add key_move
execute if entity @e[type=armor_stand,tag=key,tag=key_move] unless entity @e[type=marker,tag=key_hole,tag=gate_closed,distance=..4] run tag @s add key_move
execute if entity @e[type=armor_stand,tag=key,tag=key_move] if entity @e[type=marker,tag=key_hole,tag=gate_closed,distance=..4] run kill @e[type=area_effect_cloud,tag=key,tag=key_locate,sort=nearest,limit=1]
execute if entity @e[type=armor_stand,tag=key,tag=key_move] if entity @e[type=marker,tag=key_hole,tag=gate_closed,distance=..4] run tag @s remove has_key
execute if entity @e[type=armor_stand,tag=key,tag=key_move] if entity @s[tag=!has_key] run tag @e[type=marker,tag=key_hole,tag=gate_closed,distance=..4] add needs_key
execute as @e[type=armor_stand,tag=key,tag=key_move] at @s unless entity @e[type=marker,tag=key_hole,tag=needs_key] run particle minecraft:dust 1 0.902 0 1 ~ ~.75 ~ 0 0 0 1 1 force

## Player Movement
# Walk Time + Sprint Time
scoreboard players operation @s key_idle += @s key_idle2

# X
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[0] 100
execute as @e[type=minecraft:area_effect_cloud,tag=key,tag=key_locate,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[0] 100
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[0] double -0.0025 unless score @p[tag=has_key,gamemode=adventure,team=playing,tag=key_move] key_idle matches 0 run scoreboard players operation @s key_locate -= @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest,tag=key_move] key_locate
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[0] double -0.0015 if score @p[tag=has_key,gamemode=adventure,team=playing,tag=key_move] key_idle matches 0 run scoreboard players operation @s key_locate -= @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest,tag=key_move] key_locate
# Y
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[1] 100
execute as @e[type=minecraft:area_effect_cloud,tag=key,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[1] 100
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[1] double -0.0025 unless score @p[tag=has_key,gamemode=adventure,team=playing,tag=key_move] key_idle matches 0 run scoreboard players operation @s key_locate -= @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest,tag=key_move] key_locate
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[1] double -0.0015 if score @p[tag=has_key,gamemode=adventure,team=playing,tag=key_move] key_idle matches 0 run scoreboard players operation @s key_locate -= @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest,tag=key_move] key_locate
# Z
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[2] 100
execute as @e[type=minecraft:area_effect_cloud,tag=key,tag=key_locate,tag=key_move] at @s store result score @s key_locate run data get entity @s Pos[2] 100
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[2] double -0.0025 unless score @p[tag=has_key,gamemode=adventure,team=playing,tag=key_move] key_idle matches 0 run scoreboard players operation @s key_locate -= @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest,tag=key_move] key_locate
execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Motion[2] double -0.0015 if score @p[tag=has_key,gamemode=adventure,team=playing,tag=key_move] key_idle matches 0 run scoreboard players operation @s key_locate -= @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest,tag=key_move] key_locate
# Bobbing
execute if score @s[tag=key_move] key_idle matches 0 run scoreboard players add @s[tag=key_move] key_bob 1
execute unless score @s[tag=key_move] key_idle matches 0 run scoreboard players set @s key_bob 30
execute if score @s[tag=key_move] key_bob matches 0..20 positioned ^ ^ ^-1.25 run tp @e[type=minecraft:area_effect_cloud,tag=key,tag=key_locate,limit=1,tag=key_move] ~ ~.25 ~ facing entity @p[gamemode=adventure,team=playing,tag=has_key]
execute if score @s[tag=key_move] key_bob matches 21..41 positioned ^ ^ ^-1.25 run tp @e[type=minecraft:area_effect_cloud,tag=key,tag=key_locate,limit=1,tag=key_move] ~ ~.6 ~ facing entity @p[gamemode=adventure,team=playing,tag=has_key]
scoreboard players set @a[scores={key_bob=42..},tag=key_move] key_bob 0

execute as @e[type=minecraft:armor_stand,tag=key,tag=key_move] at @s store result entity @s Rotation[0] float 1 run data get entity @e[type=area_effect_cloud,tag=key,tag=key_locate,limit=1,sort=nearest] Rotation[0]
# TP if too far away
execute if entity @s[tag=key_move] unless entity @e[type=armor_stand,tag=key,distance=..8,tag=key_move] run tp @e[type=armor_stand,tag=key,tag=key_move,limit=1,sort=nearest] ^ ^ ^-1.25

## Reset
scoreboard players set @a key_idle 0
scoreboard players set @a key_idle2 0
tag @e remove key_move