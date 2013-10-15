/mob/creature/proc/MakeOwner(var/mob/player/owned)
	src.owner = owned
	owned.list_creatures += src

/mob/creature/proc/RemoveOwner(var/mob/player/owned)
	src.owner = null
	owned.list_creatures -= src