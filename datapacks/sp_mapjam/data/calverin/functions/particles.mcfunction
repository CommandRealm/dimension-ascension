# Nether
execute if score @s dimension matches 1 run particle minecraft:dust 1 0 0 2 ~ ~.75 ~1000 0 0 0 1 0 force @a[distance=1..]
execute if score @s dimension matches 1 run particle minecraft:dust 1 0 0 2 ~ ~.75 ~2000 0 0 0 1 0 force @a[distance=1..]
# OW
execute if score @s dimension matches 2 run particle minecraft:dust 0 1 0.082 2 ~ ~.75 ~1000 0 0 0 1 0 force @a[distance=1..]
execute if score @s dimension matches 2 run particle minecraft:dust 0 1 0.082 2 ~ ~.75 ~-1000 0 0 0 1 0 force @a[distance=1..]
# End
execute if score @s dimension matches 3 run particle minecraft:dust 0.675 0.482 0.675 2 ~ ~.75 ~-1000 0 0 0 1 0 force @a[distance=1..]
execute if score @s dimension matches 3 run particle minecraft:dust 0.675 0.482 0.675 2 ~ ~.75 ~-2000 0 0 0 1 0 force @a[distance=1..]