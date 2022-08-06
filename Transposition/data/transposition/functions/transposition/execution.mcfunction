execute as @a[nbt={SelectedItem:{id:"minecraft:written_book",tag:{Transposition:1}}}] run function transposition:transposition/transpose
execute as @a[nbt={SelectedItem:{id:"minecraft:written_book",tag:{pages:['{"text":"avSys.set_transpose(user, syntax)\\nif syntax == \\"Terminus\\":\\nterminus.proxy(user)\\nif syntax == \\"Teleport\\":\\ndest = avSys.locate(syntax)\\ntranspose(user, dest)\\nelse:\\navSys.error()"}']}}}] at @s unless entity @s[nbt={SelectedItem:{tag:{Transposition:1}}}] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1 1
execute as @a[nbt={SelectedItem:{id:"minecraft:written_book",tag:{pages:['{"text":"avSys.set_transpose(user, syntax)\\nif syntax == \\"Terminus\\":\\nterminus.proxy(user)\\nif syntax == \\"Teleport\\":\\ndest = avSys.locate(syntax)\\ntranspose(user, dest)\\nelse:\\navSys.error()"}']}}}] unless entity @s[nbt={SelectedItem:{tag:{Transposition:1}}}] run tellraw @a [{"text":"["},{"text":"ａｖＳＹＳ","color":"aqua"},{"text":"] ／／ＴＲＡＮＳＰＯＳＩＴＩＯＮ ＰＲＯＸＹ ＥＳＴＡＢＬＩＳＨＥＤ．／／","color":"white"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:written_book",tag:{pages:['{"text":"avSys.set_transpose(user, syntax)\\nif syntax == \\"Terminus\\":\\nterminus.proxy(user)\\nif syntax == \\"Teleport\\":\\ndest = avSys.locate(syntax)\\ntranspose(user, dest)\\nelse:\\navSys.error()"}']}}}] unless entity @s[nbt={SelectedItem:{tag:{Transposition:1}}}] run replaceitem entity @s weapon writable_book{display:{Name:'{"text":"Tome of Transposition","color":"gold","italic":false,"underlined":true}',Lore:['{"text":"This portable link to the Terminus\\nharnesses latent Primal Energy to\\ntemporarily rend local space-time,\\nallowing one-way travel from any\\npoint in the world.\\n"}','{"text":"Transposition","color":"gold","italic":false}','{"text":"Type the word \\"Terminus\\" and\\nsign the book to be brought\\ndirectly to the Terminus, or\\ntype \\"Teleport\\", title it a player\'s\\nname, and sign to attempt to\\nteleport to them.\\n","color":"gray"}','{"text":"Mythical","color":"gold","italic":false}']},Transposition:1,Enchantments:[{}],pages:[""]} 1