/mob/creature/verb/ToggleControl() //DEBUG
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

/mob/creature/proc/MakeOwner(var/mob/player/owned)
	src.owner = owned
	owned.list_creatures += src

/mob/creature/proc/RemoveOwner(var/mob/player/owned)
	src.owner = null
	owned.list_creatures -= src