scoreboard players add @s gate_open 1
execute if score @s gate_open matches 2 run playsound minecraft:block.lever.click master @a ~ ~ ~ 1 1
execute if score @s gate_open matches 2 run data merge entity @e[type=armor_stand,tag=key,limit=1,sort=nearest] {Pose:{Head:[90.0f,0.0f,162.0f]}}
execute if score @s gate_open matches 5 run data merge entity @e[type=armor_stand,tag=key,limit=1,sort=nearest] {Pose:{Head:[90.0f,0.0f,144.0f]}}
execute if score @s gate_open matches 8 run data merge entity @e[type=armor_stand,tag=key,limit=1,sort=nearest] {Pose:{Head:[90.0f,0.0f,126.0f]}}
execute if score @s gate_open matches 11 run data merge entity @e[type=armor_stand,tag=key,limit=1,sort=nearest] {Pose:{Head:[90.0f,0.0f,108.0f]}}
execute if score @s gate_open matches 14 run data merge entity @e[type=armor_stand,tag=key,limit=1,sort=nearest] {Pose:{Head:[90.0f,0.0f,90.0f]}}
execute if score @s gate_open matches 14 run playsound minecraft:block.lever.click master @a ~ ~ ~ 1 1.25
execute if score @s gate_open matches 14 run data merge entity @e[type=item_frame,tag=key_hole_item,distance=..3,sort=nearest,limit=1] {Item:{id:"minecraft:air"}}
execute if score @s gate_open matches 17..32 as @e[type=armor_stand,tag=key,limit=1,sort=nearest] at @s rotated ~ 0 run tp @s ^ ^ ^-.05
execute if score @s gate_open matches 32 run playsound minecraft:block.chain.hit master @a ~ ~ ~ 1 .75
execute if score @s gate_open matches 32 run tag @s remove needs_key
execute if score @s gate_open matches 32 run tag @a remove has_key
execute if score @s gate_open matches 32 run kill @e[tag=key]
execute if score @s gate_open matches 32 run particle block iron_bars ~ ~ ~ 0.05 0.05 0.05 .1 10 force
execute if score @s gate_open matches 42 run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 structure_void replace iron_bars
execute if score @s gate_open matches 42 run playsound minecraft:block.chain.place master @a ~ ~ ~ 1 0.75
execute if score @s gate_open matches 62 run fill ~-1 ~ ~-1 ~1 ~ ~1 structure_void replace iron_bars
execute if score @s gate_open matches 62 run playsound minecraft:block.chain.place master @a ~ ~ ~ 1 1
execute if score @s gate_open matches 82 run fill ~-1 ~1 ~-1 ~1 ~1 ~1 structure_void replace iron_bars
execute if score @s gate_open matches 82 run playsound minecraft:block.chain.place master @a ~ ~ ~ 1 1.25
execute if score @s gate_open matches 82.. run tag @s remove gate_open
execute if score @s gate_open matches 82.. run scoreboard players reset @s gate_open