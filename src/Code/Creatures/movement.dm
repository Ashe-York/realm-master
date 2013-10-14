/turf/floor/Click()
	var/mob/creature/REF_creature
	var/mob/player/REF_player = usr
	for (REF_creature in REF_player.list_selected_creatures)
		REF_creature.destination = src


/mob/creature/proc/Movement()
	if(destination)
		step_to(src, destination, 0)
		if(src.loc == destination)
			destination = null
			world << "Destination Reached" // DEBUG
		sleep(1.5)
		src.Movement()
	else
		step_rand(src)
		sleep(10)
		src.Movement()


/mob/creature/verb/MakeMove()
	set src in view(1)
	src.Movement()