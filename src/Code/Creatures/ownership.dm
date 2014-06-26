/mob/creature/proc/MakeOwner(var/mob/player/REF_player)
	src.owner = REF_player
	REF_player.list_creatures += src
	REF_player.client.images += src.icon_owned
	world << src.will_dig

/mob/creature/proc/RemoveOwner(var/mob/player/REF_player)
	src.owner = null
	REF_player.list_creatures -= src
	REF_player.client.images -= src.icon_owned