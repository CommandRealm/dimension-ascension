title @p[gamemode=adventure,team=playing,scores={punch=0},tag=!has_key] subtitle ["",{"text":"You stole the key from ","color":"gold"},{"selector":"@p[gamemode=adventure,team=playing,tag=has_key]","color":"red","bold":true},{"text":"!","color":"gold"}]
title @p[gamemode=adventure,team=playing,scores={punch=0},tag=!has_key] title ""
playsound entity.player.levelup master @p[gamemode=adventure,team=playing,scores={punch=0},tag=!has_key] ~ ~ ~ 1 2
tag @p[gamemode=adventure,team=playing,scores={punch=0},tag=!has_key] add has_key 
tag @s remove has_key
title @s subtitle ["",{"text":"Your key was stolen by ","color":"gold"},{"selector":"@p[gamemode=adventure,team=playing,tag=has_key]","color":"red","bold":true},{"text":"!","color":"gold"}]
title @s title ""
playsound block.anvil.place master @s ~ ~ ~ 1 0