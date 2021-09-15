# Scoreboards
scoreboard objectives add key_locate dummy
scoreboard objectives add key_idle minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add key_idle2 minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add key_bob dummy
scoreboard objectives add was_punched minecraft.custom:minecraft.damage_resisted
scoreboard objectives add punch minecraft.custom:minecraft.damage_dealt
scoreboard objectives add gate_open dummy
scoreboard objectives add key_count dummy
scoreboard objectives add dimension dummy
scoreboard objectives add portal_effect dummy
scoreboard objectives add game dummy
scoreboard objectives add leave_timer dummy
scoreboard objectives add intro_timer dummy
scoreboard objectives add leave minecraft.custom:minecraft.leave_game
scoreboard objectives add right_click minecraft.used:carrot_on_a_stick
scoreboard objectives add lobby_timer dummy
scoreboard objectives add fire_time dummy
scoreboard objectives add void_time dummy
scoreboard objectives add ticks dummy
scoreboard objectives add seconds dummy
scoreboard objectives add minutes dummy
scoreboard players set $1200 minutes 1200
scoreboard players set $20 seconds 20
scoreboard players set $high_score ticks 1000000

# Game Settings
scoreboard players set $active game 0
scoreboard players set $players game 0

# Gamerules
gamerule doMobSpawning false
gamerule doMobLoot false
gamerule fireDamage false
gamerule fallDamage false
gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule doDaylightCycle false
gamerule doWeatherCycle false
weather rain
difficulty normal
gamerule showDeathMessages false
gamerule spectatorsGenerateChunks false
gamerule sendCommandFeedback false
gamerule reducedDebugInfo true

# Times
title @a times 20 40 20

# Teams
team add playing {"text":"Players","color":"gold"}
team modify playing color gold
team modify playing seeFriendlyInvisibles false
team modify playing collisionRule never

team add spectating {"text":"Spectators","color":"gray"}
team modify spectating color gray
team modify spectating seeFriendlyInvisibles false

# Reset Everything
function calverin:restart_game