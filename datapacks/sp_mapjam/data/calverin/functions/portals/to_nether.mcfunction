scoreboard players set @s portal_effect 20
item replace entity @s armor.head with carved_pumpkin{Enchantments:[{id:"minecraft:binding_curse",lvl:1}],display:{Name:'{"text":""}'},HideFlags:63}
kill @e[tag=key]
execute align xz run tp @s ~.5 ~ ~-999.5
execute align xz run playsound minecraft:block.portal.trigger master @s ~.5 ~ ~-999.5 0.5 2
execute align xz run particle dripping_lava ~.5 ~2.1 ~-999.5 .65 0 .65 10 50 force @s
tag @s add in_portal
scoreboard players set @s dimension 1