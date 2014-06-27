/////////////////////////
/*

NOTES:

Modify attribute and modify skill are separate procedures currently. While they can be
easily combined, I feel that it would be more effective to have them separate due to
modify skill being called a lot more often, in all likelihood. I'd like to potentially
turn skills into datums in the future, anyway, and this would make any such transition
easier.


*/
/////////////////////////



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



//////////////////////////////////////////
// Procedure: ModifyAttribute
// Standard to be called when changing attributes.
// attribute needs to be a string, whereas change
// and chance both have to be of input type 'num'

/mob/creature/proc/ModifyAttribute(attribute, change, chance)
	if(rand(0, 100) < chance)
		switch (attribute)
			if ("strength") 	attribute_strength += change
			if ("agility") 		attribute_agility += change
			if ("endurance")	attribute_endurance += change
			if ("intelligence") attribute_intelligence += change

	if (attribute_strength < 0)		attribute_strength = 0
	if (attribute_agility < 0)		attribute_agility = 0
	if (attribute_endurance < 0)	attribute_endurance = 0
	if (attribute_intelligence < 0) attribute_intelligence = 0


//////////////////////////////////////////
// Procedure: ModifyAttribute
// Standard to be called when changing skills.
// skill needs to be a string, whereas change
// and chance both have to be of input type 'num'

/mob/creature/proc/ModifySkill(skill, change, chance)
	if(rand(0, 100) < chance)
		switch (skill)
			if("combat")		skill_combat += change * mod_combat
			if("mining")		skill_mining += change * mod_mining
			if("fishing")		skill_fishing += change * mod_fishing
			if("woodcutting")	skill_woodcutting += change * mod_woodcutting
			if("crafting")		skill_crafting += change * mod_crafting
			if("construction")	skill_construction += change * mod_construction

	if (skill_combat < 0)		skill_combat = 0
	if (skill_mining < 0)		skill_mining = 0
	if (skill_fishing < 0)		skill_fishing = 0
	if (skill_woodcutting < 0)	skill_fishing = 0
	if (skill_crafting < 0)		skill_crafting = 0
	if (skill_construction < 0) skill_construction = 0