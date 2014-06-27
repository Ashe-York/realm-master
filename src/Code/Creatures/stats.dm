/mob/creature

	var/health
	var/max_health

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

	var/mod_combat 			= 1
	var/mod_mining			= 1
	var/mod_fishing			= 1
	var/mod_woodcutting		= 1
	var/mod_crafting		= 1
	var/mod_construction	= 1


/mob/creature/proc/ModifyAttribute(attribute, change, chance)
	if(rand(0, 100) < chance)
		switch (attribute)
			if ("strength") attribute_strength += change
			if ("agility") attribute_agility += change
			if ("endurance") attribute_endurance += change
			if ("intelligence") attribute_intelligence += change


/mob/creature/proc/ModifySkill(skill, change, chance)
	if(rand(0, 100) < chance)
		switch (skill)
			if("combat") skill_combat += change * mod_combat
			if("mining") skill_mining += change * mod_mining
			if("fishing") skill_fishing += change * mod_fishing
			if("woodcutting") skill_woodcutting += change * mod_woodcutting
			if("crafting") skill_crafting += change * mod_crafting
			if("construction") skill_construction += change * mod_construction