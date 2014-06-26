//////////////////////////////////////////
// Effect: digAt
// Simple effect to be able to ensure that auto-dig works correctly.
// Also gives a visual representation of auto-dig.

/obj/effect/digAt
	var/digger
	icon = 'src/Sprites/Effects/digging.dmi'
	icon_state = "dig_at"



//////////////////////////////////////////
// Variable Definitions

/mob/creature
	var/will_dig
	var/dig_target



//////////////////////////////////////////
// Procedure: Dig
// Called when a creature is made. Infinite
// loop searching for nearby digging targets.

/mob/creature/proc/Dig()
	while (TRUE)
		if (will_dig)
			if (!dig_target)
				for (var/obj/effect/digAt/REF_dig in oview(src))
					var/mob/player/REF_player = src.owner
					if (REF_dig in REF_player.list_toBeDug)
						dig_target = REF_dig
			if (dig_target)
				src.destination = dig_target
			sleep(1)
		sleep(10)



//////////////////////////////////////////
// Procedure: Bump
// Designed to cause the mining
// of a target wall. Obstacle is what is
// bumped into.

/mob/creature/Bump(var/atom/obstacle)
	if (obstacle.type == /turf/wall)
		var/turf/wall/REF_obstacle = obstacle
		if (REF_obstacle.diggable == TRUE)
			REF_obstacle.Mine(src.skill_mining, src) // REBALANCE MAY BE NEEDED
	..()



//////////////////////////////////////////
// Procedure: Mine
// 'loss' is a number which is taken from the health.
// 'digger' is passed into to ensure access to owner's
// list of mining targets.

/turf/wall/proc/Mine(loss, var/mob/creature/digger)
	flick("flick_dig", src)
	health -= loss
	if (health <= 0)
		var/REF_ground = src.underneath
		for (var/obj/effect/digAt/REF_dig in view(0, src))
			if (REF_dig)
				src.ToggleDigAt(digger.owner)
		new REF_ground(src)
		digger.dig_target = null



//////////////////////////////////////////
// Procedure: ToggleDigAt
// Needs the player who sets it off so that it
// can be added/removed from their list of
// digging targets.

/turf/proc/ToggleDigAt(var/mob/player/REF_player)
	if (src.type != /turf/wall) return

	var/turf/wall/REF_wall = src
	for (var/obj/effect/digAt/REF_dig in view(0, src))
		if (REF_dig in REF_player.list_toBeDug)
			REF_player.list_toBeDug -= REF_dig
			del(REF_dig)
			return

	if (REF_wall.density == TRUE && REF_wall.diggable == TRUE)
		var/obj/effect/digAt/REF_dig = new
		REF_dig.loc = locate(REF_wall.x, REF_wall.y, REF_wall.z)
		REF_player.list_toBeDug += REF_dig



//////////////////////////////////////////
// Procedure: DbleClick
// Clear.

/turf/wall/DblClick()
	src.ToggleDigAt(usr)