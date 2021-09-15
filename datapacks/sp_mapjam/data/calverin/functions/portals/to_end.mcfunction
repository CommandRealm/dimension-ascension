scoreboard players set @s portal_effect 20
item replace entity @s armor.head with carved_pumpkin{Enchantments:[{id:"minecraft:binding_curse",lvl:1}],display:{Name:'{"text":""}'},HideFlags:63}
kill @e[tag=key]
execute align xz run tp @s ~.5 ~ ~1000.5
execute align xz run playsound minecraft:block.portal.travel master @s ~.5 ~ ~1000.5 0.35 2
execute align xz run particle end_rod ~.5 ~1 ~1000.5 .5 .65 .5 0.01 30 force @s
tag @s add in_portal
scoreboard players set @s dimension 3