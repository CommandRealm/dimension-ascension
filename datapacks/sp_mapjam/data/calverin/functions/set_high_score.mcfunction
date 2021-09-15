scoreboard players operation $high_score minutes = @s minutes
scoreboard players operation $high_score seconds = @s seconds
scoreboard players operation $high_score ticks = @s ticks
tellraw @a [{"selector":"@s","color":"gold"},{"text":" has set a new ","color":"green"},{"text":"High Score","underlined":true,"color":"gold"},{"text":" with a time of ","color":"green"},{"score":{"objective":"minutes","name":"$high_score"},"color":"gold"},{"text":" minutes","color":"gold"},{"text":", and ","color":"green"},{"score":{"objective":"seconds","name":"$high_score"},"color":"gold"},{"text":" seconds","color":"gold"},{"text":"!","color":"green"}]
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 10 0
execute as @a at @s run playsound minecraft:entity.player.levelup master @s 69 71 4012 10 0