tag @s add has_key
execute as @e[type=marker,tag=key_pickup_spawn,tag=active,limit=1,sort=nearest] at @s run particle dust_color_transition 0.975 1 0 1 1 1 0 ~ ~.25 ~ 0 0 0 1 30 force
execute as @e[type=marker,tag=key_pickup_spawn,tag=active,limit=1,sort=nearest] at @s run playsound block.ender_chest.open master @a ~ ~ ~ 1 2
execute as @e[type=marker,tag=key_pickup_spawn,tag=active,limit=1,sort=nearest] at @s run setblock ~ ~ ~ potted_bamboo
execute as @e[type=marker,tag=key_pickup_spawn,tag=active,limit=1,sort=nearest] at @s run tag @s remove active