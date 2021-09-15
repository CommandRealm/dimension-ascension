scoreboard players set @s portal_effect 40
item replace entity @s armor.head with carved_pumpkin{Enchantments:[{id:"minecraft:binding_curse",lvl:1}],display:{Name:'{"text":""}'},HideFlags:63}
kill @e[tag=key]
tag @s remove has_key
tp @s 69 71 4012
playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 1 0
scoreboard players set @s dimension 42
execute if score @s ticks < $high_score ticks run function calverin:set_high_score