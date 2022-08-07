

# Failsafe
tag @s[gamemode=adventure] add book_noperms
execute as @s[tag=book_noperms] run tellraw @a [{"text":"["},{"text":"ａｖＳＹＳ","color":"aqua"},{"text":"] ／／ＥＲＲ： ＩＮＳＵＦＦＩＣＩＥＮＴ ＰＥＲＭＩＳＳＩＯＮＳ／／","color":"white"}]
playsound minecraft:block.beacon.deactivate master @s[tag=book_noperms] ~ ~ ~ 1000 0 1
replaceitem entity @s[tag=book_noperms] weapon writable_book{display:{Name:'{"text":"Tome of Transposition","color":"gold","italic":false,"underlined":true}',Lore:['{"text":"This portable link to the Terminus\\nharnesses latent Primal Energy to\\ntemporarily rend local space-time,\\nallowing one-way travel from any\\npoint in the world.\\n"}','{"text":"Transposition","color":"gold","italic":false}','{"text":"Type the word \\"Terminus\\" and\\nsign the book to be brought\\ndirectly to the Terminus, or\\ntype \\"Teleport\\", title it a player\'s\\nname, and sign to attempt to\\nteleport to them.\\n","color":"gray"}','{"text":"Mythical","color":"gold","italic":false}']},Transposition:1,Enchantments:[{}],pages:[""]} 1
tag @s[tag=!book_noperms] add book_missed

# Terminus
tag @s[nbt={SelectedItem:{tag:{pages:['{"text":"Terminus"}']}}}] add book_terminus_teleport
tag @s[nbt={SelectedItem:{tag:{pages:['{"text":"terminus"}']}}}] add book_terminus_teleport
effect give @s[tag=book_terminus_teleport] minecraft:blindness 3 1 true
playsound minecraft:custom.warp master @s[tag=book_terminus_teleport] ~ ~ ~ 99999999999999 1 1
title @s[tag=book_terminus_teleport] title {"text":"ＴＨＥ ＴＥＲＭＩＮＵＳ","color":"dark_aqua"}
tp @s[tag=book_terminus_teleport] 26475 138 -105
execute as @s[tag=book_terminus_teleport] run tellraw @a [{"text":"["},{"text":"ａｖＳＹＳ","color":"aqua"},{"text":"] ／／ＩＮＩＴＩＡＴＩＮＧ ＰＨＡＳＥ ＷＡＲＰ．．．／／","color":"white"}]
replaceitem entity @s[tag=book_terminus_teleport] weapon writable_book{display:{Name:'{"text":"Tome of Transposition","color":"gold","italic":false,"underlined":true}',Lore:['{"text":"This portable link to the Terminus\\nharnesses latent Primal Energy to\\ntemporarily rend local space-time,\\nallowing one-way travel from any\\npoint in the world.\\n"}','{"text":"Transposition","color":"gold","italic":false}','{"text":"Type the word \\"Terminus\\" and\\nsign the book to be brought\\ndirectly to the Terminus, or\\ntype \\"Teleport\\", title it a player\'s\\nname, and sign to attempt to\\nteleport to them.\\n","color":"gray"}','{"text":"Mythical","color":"gold","italic":false}']},Transposition:1,Enchantments:[{}],pages:[""]} 1
tag @s[tag=book_terminus_teleport] remove book_missed
tag @s[tag=book_terminus_teleport] remove book_terminus_teleport

# Player
tag @s[nbt={SelectedItem:{tag:{pages:['{"text":"Teleport"}']}}}] add book_player_teleport
tag @s[nbt={SelectedItem:{tag:{pages:['{"text":"teleport"}']}}}] add book_player_teleport
execute as @a at @s run function transposition:transposition/set_marker
execute as @e[tag=sign_marker] store success entity @s ShowArms byte 1 run data modify entity @s ArmorItems[2].tag.SkullOwner.Name set from entity @a[tag=book_player_teleport,limit=1,sort=nearest] SelectedItem.tag.title

execute if entity @e[nbt={ShowArms:0b},tag=fatal_sign_marker] run tag @s add book_player_teleport_fatal
execute at @s[tag=book_player_teleport_fatal] run playsound minecraft:entity.zombie_villager.cure master @a ~ ~ ~ 100 1 1
execute at @s[tag=book_player_teleport_fatal] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 100 1 1
execute at @s[tag=book_player_teleport_fatal] run particle minecraft:end_rod ~ ~ ~ 0 0.5 0 0.6 500 force
execute at @s[tag=book_player_teleport_fatal] run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force
execute as @s[tag=book_player_teleport_fatal] run tellraw @a [{"text":"["},{"text":"ａｖＳＹＳ","color":"aqua"},{"text":"] ／／ＥＲＲ： ＦＡＴＡＬ ＴＲＡＮＳＰＯＳＩＴＩＯＮ ＥＲＲＯＲ／／","color":"white"}]
tag @s[tag=book_player_teleport_fatal] remove book_player_teleport
replaceitem entity @s[tag=book_player_teleport_fatal] weapon writable_book{display:{Name:'{"text":"Tome of Transposition","color":"gold","italic":false,"underlined":true}',Lore:['{"text":"This portable link to the Terminus\\nharnesses latent Primal Energy to\\ntemporarily rend local space-time,\\nallowing one-way travel from any\\npoint in the world.\\n"}','{"text":"Transposition","color":"gold","italic":false}','{"text":"Type the word \\"Terminus\\" and\\nsign the book to be brought\\ndirectly to the Terminus, or\\ntype \\"Teleport\\", title it a player\'s\\nname, and sign to attempt to\\nteleport to them.\\n","color":"gray"}','{"text":"Mythical","color":"gold","italic":false}']},Transposition:1,Enchantments:[{}],pages:[""]} 1
execute as @s[tag=book_player_teleport_fatal] run kill @e[tag=sign_marker]
kill @s[tag=book_player_teleport_fatal]
tag @s[tag=book_player_teleport_fatal] remove book_missed
tag @s[tag=book_player_teleport_fatal] remove book_player_teleport_fatal

tag @s[tag=book_player_teleport] add book_player_teleport_failed
execute if entity @e[tag=sign_marker,nbt={ShowArms:0b}] run tag @s[tag=book_player_teleport] remove book_player_teleport_failed
playsound minecraft:block.beacon.deactivate master @s[tag=book_player_teleport_failed] ~ ~ ~ 1000 0 1
execute as @s[tag=book_player_teleport_failed] run tellraw @a [{"text":"["},{"text":"ａｖＳＹＳ","color":"aqua"},{"text":"] ／／ＥＲＲ： ＬＩＮＫ ＳＥＡＲＣＨ ＦＡＩＬＥＤ／／","color":"white"}]
tag @s[tag=book_player_teleport_failed] remove book_player_teleport
replaceitem entity @s[tag=book_player_teleport_failed] weapon writable_book{display:{Name:'{"text":"Tome of Transposition","color":"gold","italic":false,"underlined":true}',Lore:['{"text":"This portable link to the Terminus\\nharnesses latent Primal Energy to\\ntemporarily rend local space-time,\\nallowing one-way travel from any\\npoint in the world.\\n"}','{"text":"Transposition","color":"gold","italic":false}','{"text":"Type the word \\"Terminus\\" and\\nsign the book to be brought\\ndirectly to the Terminus, or\\ntype \\"Teleport\\", title it a player\'s\\nname, and sign to attempt to\\nteleport to them.\\n","color":"gray"}','{"text":"Mythical","color":"gold","italic":false}']},Transposition:1,Enchantments:[{}],pages:[""]} 1
execute as @s[tag=book_player_teleport_failed] run kill @e[tag=sign_marker]
tag @s[tag=book_player_teleport_failed] remove book_missed
tag @s[tag=book_player_teleport_failed] remove book_player_teleport_failed

effect give @s[tag=book_player_teleport] minecraft:blindness 3 0 true
effect give @s[tag=book_player_teleport] minecraft:slowness 8 0 true
effect give @s[tag=book_player_teleport] minecraft:weakness 8 4 true
playsound minecraft:custom.warp master @s[tag=book_player_teleport] ~ ~ ~ 99999999999999 1 1
execute at @e[tag=sign_marker,nbt={ShowArms:0b}] run tp @s[tag=book_player_teleport] ~ ~ ~
execute as @s[tag=book_player_teleport] run tellraw @a [{"text":"["},{"text":"ａｖＳＹＳ","color":"aqua"},{"text":"] ／／ＩＮＩＴＩＡＴＩＮＧ ＬＩＮＫ ＷＡＲＰ．．．／／","color":"white"}]
replaceitem entity @s[tag=book_player_teleport] weapon writable_book{display:{Name:'{"text":"Tome of Transposition","color":"gold","italic":false,"underlined":true}',Lore:['{"text":"This portable link to the Terminus\\nharnesses latent Primal Energy to\\ntemporarily rend local space-time,\\nallowing one-way travel from any\\npoint in the world.\\n"}','{"text":"Transposition","color":"gold","italic":false}','{"text":"Type the word \\"Terminus\\" and\\nsign the book to be brought\\ndirectly to the Terminus, or\\ntype \\"Teleport\\", title it a player\'s\\nname, and sign to attempt to\\nteleport to them.\\n","color":"gray"}','{"text":"Mythical","color":"gold","italic":false}']},Transposition:1,Enchantments:[{}],pages:[""]} 1
execute as @s[tag=book_player_teleport] run kill @e[tag=sign_marker]
tag @s[tag=book_player_teleport] remove book_missed
tag @s[tag=book_player_teleport] remove book_player_teleport

playsound minecraft:block.beacon.deactivate master @s[tag=book_missed] ~ ~ ~ 1000 0 1
execute as @s[tag=book_missed] run tellraw @a [{"text":"["},{"text":"ａｖＳＹＳ","color":"aqua"},{"text":"] ／／ＥＲＲ： ＩＮＶＡＬＩＤ ＳＹＮＴＡＸ／／","color":"white"}]
replaceitem entity @s[tag=book_missed] weapon writable_book{display:{Name:'{"text":"Tome of Transposition","color":"gold","italic":false,"underlined":true}',Lore:['{"text":"This portable link to the Terminus\\nharnesses latent Primal Energy to\\ntemporarily rend local space-time,\\nallowing one-way travel from any\\npoint in the world.\\n"}','{"text":"Transposition","color":"gold","italic":false}','{"text":"Type the word \\"Terminus\\" and\\nsign the book to be brought\\ndirectly to the Terminus, or\\ntype \\"Teleport\\", title it a player\'s\\nname, and sign to attempt to\\nteleport to them.\\n","color":"gray"}','{"text":"Mythical","color":"gold","italic":false}']},Transposition:1,Enchantments:[{}],pages:[""]} 1
tag @s[tag=book_missed] remove book_missed
tag @s[tag=book_noperms] remove book_noperms