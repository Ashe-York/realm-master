/atom/Click()
	var/mob/creature/REF_creature
	var/mob/player/REF_player = usr
	for (REF_creature in REF_player.list_selected_creatures)
		REF_creature.destination = src

/mob/creature/proc/Movement()
	while (TRUE)

		if (destination && get_dist(src, destination) >= 1)
			if (get_dist(src, destination) > 1)
				step_to(src, destination)
				sleep(walk_delay)
			if (get_dist(src, destination) == 1)
				step_towards(src, destination)
				sleep(walk_delay)


		else if (!owner && !destination)
			step_rand(src)
			sleep(10)

		else
			sleep(5)