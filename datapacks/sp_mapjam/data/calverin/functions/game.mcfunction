# Key Stuff
function calverin:key/main

# Make prefixes invisible
team modify spectating prefix ""
team modify playing prefix ""

# Dimension Swapping
execute as @a[gamemode=adventure,team=playing,tag=!in_portal] at @s if block ~ ~ ~ #flower_pots run function calverin:portals/main
execute as @a[gamemode=adventure,team=playing,tag=in_portal] at @s unless block ~ ~ ~ #flower_pots run spawnpoint @s ~ ~ ~
execute as @a[gamemode=adventure,team=playing,scores={portal_effect=1..}] at @s run scoreboard players remove @s portal_effect 1
execute as @a[gamemode=adventure,team=playing,scores={portal_effect=..0}] at @s run item replace entity @s armor.head with air
execute as @a[gamemode=adventure,team=playing,tag=in_portal] at @s unless block ~ ~ ~ #flower_pots run tag @s remove in_portal

# Explain Pedestal
execute as @a[gamemode=adventure,team=playing,tag=!explained] at @s run title @s actionbar ["",{"text":"You seem to be trapped. Find a pedestal and stand on it."}]

# Speedrun Timer
execute as @a[gamemode=adventure,team=playing,scores={dimension=1..3}] at @s run function calverin:timer
## Normal
execute unless entity @a[gamemode=adventure,team=playing,tag=has_key,tag=explained] as @a[gamemode=adventure,team=playing,tag=explained] at @s if score @s minutes matches 10.. if score @s seconds matches 10.. run title @s actionbar ["",{"text":"Time:","color":"gold","underlined": true},{"text":" ","color":"gold"},{"score":{"objective":"minutes","name":"*"},"color":"dark_aqua","bold":true},{"text":":","color":"dark_aqua","bold":true},{"score":{"objective":"seconds","name":"*"},"color":"dark_aqua","bold":true}]
## 10+ Seconds; <10 Minutes
execute unless entity @a[gamemode=adventure,team=playing,tag=has_key,tag=explained] as @a[gamemode=adventure,team=playing,tag=explained] at @s if score @s minutes matches ..9 if score @s seconds matches 10.. run title @s actionbar ["",{"text":"Time:","color":"gold","underlined": true},{"text":" ","color":"gold"},{"text":"0","color":"dark_aqua","bold":true},{"score":{"objective":"minutes","name":"*"},"color":"dark_aqua","bold":true},{"text":":","color":"dark_aqua","bold":true},{"score":{"objective":"seconds","name":"*"},"color":"dark_aqua","bold":true}]
## <10 Seconds; 10+ Minutes
execute unless entity @a[gamemode=adventure,team=playing,tag=has_key,tag=explained] as @a[gamemode=adventure,team=playing,tag=explained] at @s if score @s minutes matches 10.. if score @s seconds matches ..9 run title @s actionbar ["",{"text":"Time:","color":"gold","underlined": true},{"text":" ","color":"gold"},{"score":{"objective":"minutes","name":"*"},"color":"dark_aqua","bold":true},{"text":":0","color":"dark_aqua","bold":true},{"score":{"objective":"seconds","name":"*"},"color":"dark_aqua","bold":true}]
## <10 Seconds; <10 Minutes
execute unless entity @a[gamemode=adventure,team=playing,tag=has_key,tag=explained] as @a[gamemode=adventure,team=playing,tag=explained] at @s if score @s minutes matches ..9 if score @s seconds matches ..9 run title @s actionbar ["",{"text":"Time:" ,"color":"gold","underlined": true},{"text":" ","color":"gold"},{"text":"0","color":"dark_aqua","bold":true},{"score":{"objective":"minutes","name":"*"},"color":"dark_aqua","bold":true},{"text":":0","color":"dark_aqua","bold":true},{"score":{"objective":"seconds","name":"*"},"color":"dark_aqua","bold":true}]

# Key Holder Actionbar
execute if entity @a[gamemode=adventure,team=playing,tag=has_key] run title @a[gamemode=adventure,team=playing,tag=!has_key,tag=explained] actionbar ["",{"selector":"@p[tag=has_key]","color":"red","bold":true},{"text":" has the key!","color":"gold"},{"text":" (Critical hit them to steal it!)","color":"dark_red","bold":true}]
execute if entity @a[gamemode=adventure,team=playing,tag=has_key] run title @a[gamemode=adventure,team=playing,tag=has_key,tag=explained] actionbar ["",{"text":"You have the key!","color":"gold","bold":true}]

# Kill player if too low
execute as @a[gamemode=adventure,team=playing] at @s if entity @s[y=0,dy=63] unless entity @s[z=-100,dz=300] run kill @s
execute as @a[gamemode=adventure,team=playing] at @s if entity @s[y=0,dy=63] if entity @s[z=-100,dz=300] run tag @s add broken_spawn
execute as @a[gamemode=adventure,team=playing,tag=broken_spawn] at @s run tp @s @a[gamemode=adventure,team=playing,limit=1,sort=random]
execute as @a[gamemode=adventure,team=playing,tag=broken_spawn] at @s run scoreboard players operation @s dimension = @p[gamemode=adventure,team=playing,tag=!broken_spawn] dimension
execute as @a[gamemode=adventure,team=playing,tag=broken_spawn] at @s run tag @s remove broken_spawn
execute as @a[gamemode=adventure,team=playing] at @s if entity @s[y=0,dy=63] run kill @s
execute as @a[gamemode=adventure,team=playing] at @s store result score @s fire_time run data get entity @s Fire
execute as @a[gamemode=adventure,team=playing] at @s if score @s fire_time matches 1.. run kill @s
execute as @a[gamemode=adventure,team=playing] at @s if block ~ ~ ~ lava run kill @s

# Dust marker for other players
execute as @a[gamemode=adventure,team=playing,scores={dimension=1..3}] at @s run function calverin:particles

# Void (Winning)
execute as @a[gamemode=adventure,team=playing,scores={dimension=42}] at @s run function calverin:void

# Spectate Players
execute as @a[gamemode=spectator,team=spectating] at @s unless entity @p[gamemode=adventure,team=playing,distance=..1] run spectate @p[gamemode=adventure,team=playing]