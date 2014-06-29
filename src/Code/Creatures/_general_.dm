//////////////////////////////////////////
//
// Remember to separate related things with
// either line-breaks or a new 'path', for
// readability and organizational purposes.
//
//////////////////////////////////////////

/mob/creature

	var/owner // References a player
	var/selected = FALSE

	var/icon_selected // Stores the selection icon which goes above the creature's head when selected.
	var/icon_owned // Stores the ownership icon which goes above the creature's head when owned

	var/tmp/destination
	var/step_delay

	var/age
	var/die_age

	var/minimum_damage
	var/maximum_damage

	var/NPC = TRUE // For use in 'ownership' calculations and procs. Turned off when owned, so 'NPC' by default.


/mob/creature/New()
	spawn() StartAllProcs()
	..()

	var/image/REF_selected_image = new('src/Sprites/Effects/creature_select.dmi', src)
	src.icon_selected = REF_selected_image // The selection icon which goes above the creature's head when selected.

	var/image/REF_owned_image = new('src/Sprites/Effects/creature_owned.dmi', src)
	src.icon_owned = REF_owned_image