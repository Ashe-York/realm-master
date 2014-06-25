//////////////////////////////////////////
// NOTE: All of these are temporary and only for the purposes
// of debugging at the moment. Thank you.


turf/wall
	density = 1
	opacity = 1
	icon = 'src/Sprites/Turfs/wall.dmi'

	var/diggable = TRUE
	var/health = 100
	var/underneath = /turf/floor


turf/floor
	density = 0
	opacity = 0
	icon = 'src/Sprites/Turfs/floor.dmi'


turf/water
	density = 1
	opacity = 0
	icon = 'src/Sprites/Turfs/water.dmi'