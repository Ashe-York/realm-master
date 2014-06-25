/atom/Click()
	var/mob/creature/REF_creature
	var/mob/player/REF_player = usr

	if(src in REF_player.list_creatures) return

	for (REF_creature in REF_player.list_selected_creatures)
		REF_creature.destination = src


/mob/creature/proc/Movement()
	while (TRUE)

		if (destination && get_dist(src, destination) >= 1)
			if (get_dist(src, destination) > 1) // Includes pathfinding...
				step_to(src, destination)
			else if (get_dist(src, destination) == 1) // Does not include pathfinding. Causes it to 'bump' destination.
				step_towards(src, destination)
			sleep(step_delay)

		else if (!owner && !destination)
			step_rand(src) // Will likely replace with 'NPCBehavior()', an as of yet unmade proc, at some point.
			sleep(10)

		else
			sleep(5)