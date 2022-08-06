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
into a Book and Quill and sign it.
- You may teleport to the Terminus by typing "Terminus" into the book and signing it with any title.
- You may teleport to a player by typing "Teleport" into the book and titling the book with the player you want to teleport to.
- You may not teleport under any circumstances while in Adventure Mode. This is to prevent leaving areas such as the Terminus without properly modifying the game state.

# How it works
The loot table gets the skull of the player who loots the table, which contains the player name as a plaintext string in SkullOwner.Name.  
  
When a player teleport request is made, markers are placed at the location of every player, which are assigned skulls of the corresponding players as helmets (Minecraft limitation) which are then copied into their chestplates for aesthetic's sake.    
  
The title of written books (which is a plaintext, unlike the book's content; Minecraft limitation) is compared to every player marker when a teleport request is made.   
  
If a player marker with a matching username in its chestplate slot's appropriate data path is found, it is teleported to.    

# Questions asked during initial testing
**1. Can I teleport to myself?**  
  
No. You will instantly die. This is an intended feature that can be disabled by commenting out a certain section of transpose.mcfunction.

**2. Will you make this more readable?**  
    
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
  
Not the last one, for obvious reasons. The rest were.
  
**8. Is the description lore-accurate?**  
  
I have no idea. I frankly do not care, and changing the item itself is tedious, but I will if extraordinary circumstances warrant it.
  
**9. Can't you implement \[a cost]?**  
  
I was going to implement a cost. I chose not to, because the SMP's co-owner threatened to only use /tp if I did. Refer to second question.
  
**10. Aren't you the SMP owner?**  
  
With the seventh question in mind, no. I was just asked to make this.
