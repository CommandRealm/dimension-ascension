# Intro text and cutscene for new players
execute if score @s intro_timer matches -59 run gamemode adventure @s
execute if score @s intro_timer matches -59 run tag @s add has_joined
execute if score @s intro_timer matches -59 run scoreboard players operation @s leave_timer = $world leave_timer
execute if score @s intro_timer matches 2 run title @s times 10 40 10
execute if score @s intro_timer matches 2 if score $all_players game matches 1 run title @s subtitle ["",{"text":"You are an inter-dimensional explorer.","color":"white"}]
execute if score @s intro_timer matches 2 if score $all_players game matches 2.. run title @s subtitle ["",{"text":"You are a group of rival inter-dimensional explorers.","color":"white"}]
execute if score @s intro_timer matches 2 run title @s title ""
execute if score @s intro_timer matches 62 run title @s times 10 30 10
execute if score @s intro_timer matches 62 if score $all_players game matches 1 run title @s subtitle ["",{"text":"You have one goal in life:","color":"white"}]
execute if score @s intro_timer matches 62 if score $all_players game matches 2.. run title @s subtitle ["",{"text":"You all have one goal in life:","color":"white"}]
execute if score @s intro_timer matches 62 run title @s title ""
execute if score @s intro_timer matches 112 run title @s times 10 40 10
execute if score @s intro_timer matches 112 run title @s subtitle ["",{"text":"Be the first to find the fabled ","color":"white"},{"text":"Fourth Dimension.","color":"white","bold":true}]
execute if score @s intro_timer matches 112 run title @s title ""
execute if score @s intro_timer matches 172 run title @s subtitle ["",{"text":"Many people doubt its existence;","color":"white"}]
execute if score @s intro_timer matches 172 run title @s title ""
execute if score @s intro_timer matches 232 run title @s subtitle ["",{"text":"They believe there are only three dimensions.","color":"white"}]
execute if score @s intro_timer matches 232 run title @s title ""
execute if score @s intro_timer matches 292 run title @s times 10 30 10
execute if score @s intro_timer matches 292 run title @s subtitle ["",{"text":"You know better.","color":"white"}]
execute if score @s intro_timer matches 292 run title @s title ""
execute if score @s intro_timer matches 342 run title @s subtitle ["",{"text":"You know it is real.","color":"white"}]
execute if score @s intro_timer matches 342 run title @s title ""
execute if score @s intro_timer matches 392 run title @s subtitle ["",{"text":"And after years of searching,","color":"white"}]
execute if score @s intro_timer matches 392 run title @s title ""
execute if score @s intro_timer matches 442 run title @s times 10 30 20
execute if score @s intro_timer matches 442 run title @s subtitle ["",{"text":"You finally know where it is.","color":"white"}]
execute if score @s intro_timer matches 442 run title @s title ""
execute if score @s intro_timer matches 502 run title @s times 10 40 20
execute if score @s intro_timer matches 502 run tag @s add intro_old