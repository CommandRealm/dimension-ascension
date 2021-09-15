scoreboard players add @s intro_timer 1
effect give @s blindness 3 1 true
effect give @s invisibility 2 10 true
#effect give @s night_vision 2 255 true
effect give @s weakness 2 255 true
tp @s 0 8 -22 180 .5
clear @s
execute as @s[tag=intro_new] at @s run function calverin:intro/new
execute as @s[tag=intro_old] at @s run function calverin:intro/old