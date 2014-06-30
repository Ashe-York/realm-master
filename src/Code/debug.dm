#ifdef DEBUG

//////////////////////////////////////////
// Verb: CountMobs
// Clearly tells you the number
// of mobs in the current world.

/mob/player/verb/CountMobs()
	var/counter
	for (var/mob/creature/REF in world)
		counter++
	src << "There are [counter] mobs in the world."



//////////////////////////////////////////
// Verb: ToggleControl
// Clearly takes over the mob. Used for testing
// for obvious reasons.

/mob/creature/verb/ToggleControl()
	set src in view(1)
	if (src.owner != usr)
		usr << "Taking control over..."
		sleep(5)
		src.MakeOwner(usr)
		usr << "Control taken..."
	else
		usr << "Removing control over..."
		sleep(5)
		src.RemoveOwner(usr)
		usr << "Control removed..."



//////////////////////////////////////////
// Verb: ToggleDig()
// In case we need it to dig and it is not digging.
// Should not actually be necessary, anymore, but
// just in case it is being left here.

/mob/creature/verb/ToggleDig()
	set src in view(1)
	if (src.owner == usr && !will_dig)
		src.will_dig = TRUE
		world << "Setting will_dig to TRUE"
	else if (src.owner == usr && will_dig)
		src.will_dig = FALSE
		world << "Setting will_dig to FALSE"
	else
		world << "You don't own this creature."



//////////////////////////////////////////
// Verb: ChangeAttribute
// Simply here to directly allow the developer
// to test the changing of attributes.

/mob/creature/verb/ChangeAttribute()
	set src in view(1)

	var/attribute = input("Which attribute?")
	var/change = input("How much?")
	var/chance = input("How likely?")

	ModifyAttribute(attribute, change, chance)



//////////////////////////////////////////
// Verb: ChangeSkill
// Simply here to directly allow the developer
// to test the changing of skills.

/mob/creature/verb/ChangeSkill()
	set src in view(1)

	var/skill = input("Which skill?") as text
	var/change = input("How much?") as num
	var/chance = input("How likely?") as num

	ModifySkill(skill, change, chance)



//////////////////////////////////////////
// Verb: ViewStats
// Needs to be changed into its own statpanel in the future,
// but for now-- For debugging purposes, it works fine like this.

/mob/creature/verb/ViewStats()
	set src in view(1)
	usr << "------------------------------"


	usr << "Name: [src.name]"
	usr << "---"
	usr << "Attributes:"

	usr << "Strength: [src.attribute_strength]"
	usr << "Agility: [src.attribute_agility]"
	usr << "Endurance: [src.attribute_endurance]"
	usr << "Intelligence: [src.attribute_intelligence]"

	usr << "---"
	usr << "Skills:"

	usr << "Combat: [src.skill_combat]"
	usr << "Mining: [src.skill_mining]"
	usr << "Fishing: [src.skill_fishing]"
	usr << "Woodcutting: [src.skill_woodcutting]"
	usr << "Crafting: [src.skill_crafting]"
	usr << "Construction: [src.skill_construction]"

	usr << "---"
	usr << "Needs:"

	usr << "Hunger: [src.need_hunger]"
	usr << "Thirst: [src.need_thirst]"
	usr << "Sleep: [src.need_sleep]"


	usr << "------------------------------"



#endif