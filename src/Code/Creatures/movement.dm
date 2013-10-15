/turf/floor/Click()
	var/mob/creature/REF_creature
	var/mob/player/REF_player = usr
	for (REF_creature in REF_player.list_selected_creatures)
		REF_creature.destination = src

/mob/creature/proc/Movement()
	while (TRUE)

		if (destination && get_dist(src, destination) >= 1)
			step_to(src, destination)
			sleep(walk_delay * 2)

		else if (!owner && !destination)
			step_rand(src)
			sleep(10)

		else
			sleep(5)



/mob/creature/verb/MakeMove() // DEBUG
	set src in view(1)
	src.Movement()