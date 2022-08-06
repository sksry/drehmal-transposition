# Warnings
- This datapack may conflict with future versions of Drehmal. This is intended for v2.1.1.
- You use this datapack at your own risk. This is open-source, so you can personally determine whether or not this is safe to use. However, it is not commented for readability (for the most part). 

# Basics
- The Book of Transposition is very easy to obtain. Type:
```
avSys.set_transpose(user, syntax)
if syntax == "Terminus":
terminus.proxy(user)
if syntax == "Teleport":
dest = avSys.locate(syntax)
transpose(user, dest)
else:
avSys.error()
```
into a Book and Quill and sign it with any title. Alternatively, for testing purposes, run:
```
/give @p written_book{Transposition:1}
```
and hold the resulting item.
- You may teleport to the Terminus by typing `Terminus` into the book and signing it with any title.
- You may teleport to a player by typing `Teleport` into the book and signing it **after titling the book with the player username you want to teleport to.** You can not teleport to players with names that are 16 characters long due to the title length limit. Refer to the question sections for more details.
- You may not teleport under any circumstances while in Adventure Mode. This is to prevent leaving areas such as the Terminus without properly modifying the game state.
- Refer to this video:  
https://cdn.discordapp.com/attachments/723994031129886832/1005370357999468614/trans.mp4  
to see it in action (warning: download link).

# How player identification works
The loot table gets the skull of the player who loots the table, which contains the player name as a plaintext string in `SkullOwner.Name`.  
  
When a player teleport request is made, markers are placed at the location of every player, which are assigned skulls of the corresponding players as helmets (Minecraft limitation) with `loot replace`, which are then copied into their chestplates for aesthetic's sake.    
  
The title of written books (which is a plaintext, unlike the book's content; Minecraft limitation) is compared to every player marker when a teleport request is made.   
  
If a player marker with a matching username in its chestplate slot's appropriate data path is found, it is teleported to.  
  
All markers are cleared after a teleport attempt is made.  

# Questions asked during initial testing
**1. Can I teleport to myself?**  
  
No. You will instantly die. This is an intended feature that can be disabled by commenting out a certain section of transpose.mcfunction.

**2. Will you make the functions more readable?**  
    
If popular demand for the ability to modify this datapack warrants it.

**3. What happens if you teleport to a player that does not want to be teleported to?**  
  
Tell them to deal with it.
  
**4. Can you teleport back from the Terminus or teleport another player to you?**  
  
No. As the book's description says, the teleport is one-way.
  
**5. Do you plan to change the obtain method or add any new features?**  
  
Refer to the second question.
  
**6. Can I use this?**  
  
I can't stop you. Just don't claim that you made it, please.
  
**7. Were these questions actually asked?**  
  
Not the previous one, for obvious reasons. The rest were.
  
**8. Is the item description lore-accurate?**  
  
I have no idea. Probably not. I frankly do not care, and changing the item itself is tedious, but I will if extraordinary circumstances warrant it.
  
**9. Can't you implement \[a cost]?**  
  
I was going to implement a cost. I chose not to, because the SMP's co-owner threatened to only use /tp if I did. Refer to second question.
  
**10. Aren't you the SMP owner?**  
  
With the seventh question in mind, no. I was just asked to make this.

# Questions that I just thought of
**1. What if there's a bug? Will you change that?**  
  
If there is one, please contact me on Discord (`seeksery#0382`). I will fix problems in existing features.
  
**2. What do you mean by "Minecraft limitation"?**  
  
Mojang, in their infinite wisdom, decided to store strings as strings in some cases, as JSON in some other cases, and as JSON transformed into strings in still other cases. I can not use selectors to generate useful JSON strings with signs or loot tables, as it stores it in a format that can not be compared to the text within a book. Furthermore, I can not edit the data to be useful, as Minecraft offers no way of editing strings with commands. There is no reasonable way to get and store player names in a '{"text":"`name`"}' format, which is what I need to match the _content_ of the book. However, the _title_ of the book is a plaintext string. This can be directly compared to the `SkullOwner.Name` of a loot table-generated skull. As far as I'm aware, this is the only case where this is true for player names in all of Vanilla Minecraft. With this in mind, since the title length limit is 15 characters, there is no way to enable it for players with names that are 16 characters long.  
  
If you decide to be a smart-aleck and say that I could make it so that you _rename_ the book to choose a player to teleport to, I will:  
1. Commend you on your knowledge of the '{"text":"`name`"}' format.
2. Bring harm to you through ways that I am not allowed to describe here.
3. Point out that it would conflict with the ninth initial testing question.  
  
in that order. You have been warned.  
  
As for the other limitation in question, for some reason, you can not `loot replace` any slot on an armor stand other than the helmet with a loot table-generated player head (even though you could reasonably want the stand to hold it, for example).
