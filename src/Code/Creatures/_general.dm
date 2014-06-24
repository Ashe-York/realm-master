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

	var/will_dig
	var/dig_target

	var/minimum_damage
	var/maximum_damage


/mob/creature

	var/health     = 350
	var/max_health = 350

	var/attribute_strength
	var/attribute_agility
	var/attribute_endurance
	var/attribute_intelligence

	var/skill_combat
	var/skill_mining
	var/skill_fishing
	var/skill_woodcutting
	var/skill_crafting
	var/skill_construction

/mob/creature/New()
	spawn() StartAllProcs()
	..()

	var/image/REF_selected_image = new('src/Sprites/Effects/creature_select.dmi', src)
	src.icon_selected = REF_selected_image // The selection icon which goes above the creature's head when selected.

	var/image/REF_owned_image = new('src/Sprites/Effects/creature_owned.dmi', src)
	src.icon_owned = REF_owned_image