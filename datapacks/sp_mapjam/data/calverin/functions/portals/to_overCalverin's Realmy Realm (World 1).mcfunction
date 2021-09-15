scoreboard players set @s portal_effect 20
item replace entity @s armor.head with carved_pumpkin{Enchantments:[{id:"minecraft:binding_curse",lvl:1}],display:{Name:'{"text":""}'},HideFlags:63}
kill @e[tag=key]
# If in nether go +1000
execute if entity @s[scores={dimension=1}] align xz run tp @s ~.5 ~ ~1000.5
# If in end go -1000
execute if entity @s[scores={dimension=3}] align xz run tp @s ~.5 ~ ~-999.5
execute if entity @s[scores={dimension=1}] align xz run playsound minecraft:block.portal.ambient master @s ~.5 ~ ~1000.5 0.75 2
execute if entity @s[scores={dimension=3}] align xz run playsound minecraft:block.portal.ambient master @s ~.5 ~ ~-999.5 0.75 2
execute if entity @s[scores={dimension=1}] align xz run particle falling_spore_blossom ~.5 ~3 ~1000.5 .45 .01 .45 0.01 30 force @s
execute if entity @s[scores={dimension=3}] align xz run particle falling_spore_blossom ~.5 ~3 ~-999.5 .45 .01 .45 0.01 30 force @s
tag @s add in_portal
scoreboard players set @s dimension 2