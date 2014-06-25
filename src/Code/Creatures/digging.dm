/obj/effect/digAt
	var/digger
	icon = 'src/Sprites/Effects/digging.dmi'
	icon_state = "dig_at"


/mob/creature
	var/will_dig
	var/dig_target


/mob/creature/proc/Dig() // Called by the debug verb as well as when a wall is set to be dug.
	while (will_dig)
		for (var/obj/effect/digAt/REF_dig in oview(src))
			var/mob/player/REF_player = src.owner
			if (REF_dig in REF_player.list_toBeDug)
				for(var/turf/REF_turf in view(0,REF_dig))
					src.destination = REF_turf
				if(src.dig_target == null)
					src.dig_target = REF_dig
		sleep(1)
	sleep(10)


/mob/creature/Bump(var/atom/obstacle) // Write what is done to the thing being dug here.
	if (obstacle.type == /turf/wall)
		var/turf/wall/REF_obstacle = obstacle
		if (REF_obstacle.diggable == TRUE)
			REF_obstacle.Mine(src.skill_mining, src.owner) // REBALANCE MAY BE NEEDED


/turf/wall/proc/Mine(loss, owner) // loss refers to how much 'health' the wall loses.
	flick("flick_dig", src)
	health -= loss
	if (health <= 0)
		var/REF_ground = src.underneath
		for (var/obj/effect/digAt/REF_dig in view(0, src))
			if (REF_dig)
				src.ToggleDigAt(owner)
		new REF_ground(src)


/turf/proc/ToggleDigAt(var/mob/player/REF_player)

	if (src.type != /turf/wall) return



	var/turf/wall/REF_wall = src
	for (var/obj/effect/digAt/REF_dig in view(0, src))
		if (REF_wall in REF_player.list_toBeDug)
			REF_player.list_toBeDug -= REF_wall
			del(REF_dig)
			return

	if (REF_wall.density == TRUE && REF_wall.diggable == TRUE)
		var/obj/effect/digAt/REF_dig = new
		REF_dig.loc = locate(REF_wall.x, REF_wall.y, REF_wall.z)
		REF_player.list_toBeDug += REF_wall


/turf/wall/DblClick()
	src.ToggleDigAt(usr)