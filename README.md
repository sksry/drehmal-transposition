How it works:

- The loot table gets the skull of the player who loots the table, which contains the player name as a plaintext string in SkullOwner.Name
- When a player teleport request is made, markers are placed at the location of every player, which are assigned skulls of the corresponding players as helmets 
(Minecraft limitation) which are then copied into their chestplates for aesthetic's sake
- The title of the book (which is a plaintext, unlike the book's content; Minecraft limitation) is compared to every player marker
- If a player marker with a matching username in its chestplate slot's appropriate data path is found, it is teleported to
