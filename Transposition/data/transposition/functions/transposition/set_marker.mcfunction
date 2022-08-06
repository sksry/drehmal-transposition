summon armor_stand ~ ~ ~ {Tags:[sign_marker_temp,sign_marker],Invisible:1,Marker:1,Small:1,Invulnerable:1,NoGravity:1,ShowArms:1b,Silent:1}
execute as @s run loot replace entity @e[tag=sign_marker_temp] armor.head loot transposition:get_name/head
execute as @e[tag=sign_marker_temp] run data modify entity @s ArmorItems[2] set from entity @s ArmorItems[3]
data remove entity @e[tag=sign_marker_temp,limit=1,sort=nearest] ArmorItems[3]
execute if entity @s[tag=book_player_teleport] run tag @e[tag=sign_marker_temp] add fatal_sign_marker
tag @e[tag=sign_marker_temp] remove sign_marker_temp