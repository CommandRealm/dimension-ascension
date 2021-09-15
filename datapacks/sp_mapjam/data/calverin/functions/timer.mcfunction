scoreboard players add @s ticks 1
scoreboard players operation @s minutes = @s ticks
scoreboard players operation @s seconds = @s ticks

scoreboard players operation @s minutes /= $1200 minutes

scoreboard players operation @s seconds %= $1200 minutes
scoreboard players operation @s seconds /= $20 seconds