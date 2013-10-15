#ifdef DEBUG

/mob/player/verb/CountMobs()
	var/counter
	for (var/mob/creature/REF in world)
		counter++
	src << "There are [counter] mobs in the world."

/mob/creature/verb/MakeMove()
	set src in view(1)
	src.Movement()

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

/mob/creature/verb/ToggleDig()
	set src in view(1)
	if (src.owner == usr && !will_dig)
		src.will_dig = TRUE
		src.Dig()
	if (src.owner == usr && will_dig)
		src.will_dig = FALSE
#endif