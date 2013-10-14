/mob/player/verb/CountMobs() // DEBUG
	var/counter
	for (var/mob/creature/REF in world)
		counter += 1
	src << "There are [counter] mobs in the world."