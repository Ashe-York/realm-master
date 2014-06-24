/obj/effect/digAt
	var/digger
	icon = 'src/Sprites/Effects/digging.dmi'
	icon_state = "dig_at"

/mob/creature/proc/Dig() // Called by the debug verb as well as when a wall is set to be dug.
	while (will_dig)
		for (var/obj/effect/digAt/REF_dig in oview(src))
			if (REF_dig.digger == src)
				for(var/turf/REF_turf in view(0,REF_dig))
					src.destination = REF_turf
				if(src.dig_target == null)
					src.dig_target = REF_dig
		sleep(1)

/mob/creature/Bump(var/atom/obstacle) // Write what is done to the thing being dug here.

	if (obstacle.type == /turf/wall)
		var/turf/wall/REF_obstacle = obstacle
		if (REF_obstacle.diggable == TRUE)
			flick("flick_dig", REF_obstacle)
			REF_obstacle.Mine(src.skill_mining)

/turf/wall/proc/Mine(loss) // loss refers to how much 'health' the wall loses.
	health -= loss
	if (health <= 0)
		var/REF_ground = src.underneath
		new REF_ground(src)

/turf/wall/DblClick()
	var/mob/player/REF_player = usr
	for (var/mob/creature/REF_creature in REF_player.list_selected_creatures)

		for (var/obj/effect/digAt/REF_dig in view(0, src))
			if (REF_dig.digger == REF_creature)
				REF_creature.destination = null
				REF_creature.dig_target = null
				del(REF_dig)
				return

		if (src.density == TRUE && src.diggable == TRUE)
			REF_creature.destination = null
			var/obj/effect/digAt/REF_dig = new
			REF_dig.loc = locate(src.x, src.y, src.z)
			REF_dig.digger = REF_creature
			REF_creature.Dig()