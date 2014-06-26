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

#endif