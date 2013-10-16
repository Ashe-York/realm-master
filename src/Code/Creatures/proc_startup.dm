// Initial proc start-ups can go here.

/mob/creature/proc/StartAllProcs()
	spawn(rand(5,10)) Movement() // Random in order to make not all units follow the exact same thing here.