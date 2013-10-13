/mob/creature
	var/health     = 350
	var/max_health = 350

	var/owner

	var/destination
	var/walk_delay

	var/age
	var/die_age

/mob/creature
	var/selected = FALSE
	var/selected_icon

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