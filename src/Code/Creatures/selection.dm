/mob/creature/DblClick()
	if (usr == owner)
		src.ToggleSelect(usr)
	else
		usr << "You do not own this creature, and cannot command it!"


/mob/creature/proc/ToggleSelect(mob/player/USER)
	if (src.selected == TRUE)
		src.Deselect(USER)
	else
		src.Select(USER)


/mob/creature/proc/Select(mob/player/USER)
	src.selected = TRUE

	USER.client.images += selected_icon
	USER.list_selected_creatures += src


/mob/creature/proc/Deselect(mob/player/USER)
	src.selected = FALSE

	USER.client.images -= selected_icon
	USER.list_selected_creatures -= src


/mob/creature/New()
	var/image/REF = new('src/Sprites/Effects/creature_select.dmi', src)
	src.selected_icon = REF