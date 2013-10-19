//////////////////////////////////////////
//
// This is the default mob for players, and their
// mob with which they interact with the world.
// Be gentle.
//
//////////////////////////////////////////

/mob/player
	density = 0
	var/list/list_creatures = list()
	var/tmp/list/list_selected_creatures = list()

/mob/player/verb/OOC(msg as text)
	set hidden = 1
	world << "[src.key]: [msg]"