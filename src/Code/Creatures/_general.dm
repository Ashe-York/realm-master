/mob/creature
	var/health     = 350
	var/max_health = 350

	var/owner

	var/tmp/destination
	var/walk_delay

	var/age
	var/die_age

	var/will_dig
	var/dig_target

	var/minimum_damage = 1
	var/maximum_damage = 5

/mob/creature
	var/selected = FALSE
	var/icon_selected

/mob/creature
	var/attribute_strength
	var/attribute_agility
	var/attribute_endurance
	var/attribute_intelligence

	var/skill_combat
	var/skill_mining
	var/skill_fishing
	var/skill_woodcutting
	var/skill_crafting

/mob/creature/New()
	spawn() StartAllProcs()
	..()
	var/image/REF_image = new('src/Sprites/Effects/creature_select.dmi', src)
	src.icon_selected = REF_image