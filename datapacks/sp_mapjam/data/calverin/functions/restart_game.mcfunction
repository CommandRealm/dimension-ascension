kill @e[tag=key]
tag @a remove has_key
tag @e[type=marker,tag=key_pickup_spawn] add active
tag @e[type=marker,tag=key_hole] add gate_closed
tag @e[type=marker,tag=key_hole] remove needs_key
execute as @e[type=marker,tag=key_hole] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_bars replace structure_void
execute as @e[type=marker,tag=key_hole] at @s run data merge entity @e[type=item_frame,tag=key_hole_item,distance=..3,sort=nearest,limit=1] {Item:{id:"minecraft:apple",tag:{CustomModelData:1},Count:1b}}