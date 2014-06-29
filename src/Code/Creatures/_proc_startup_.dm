// Initial proc start-ups can go here.

/mob/creature/proc/StartAllProcs()
	spawn(rand(5, 10))	Movement() // Random in order to make not all units follow the exact same thing here.
	spawn(rand(5, 10))	Dig()

/mob/creature/proc/StartOwnershipProcs()
	src.NPC = FALSE
	spawn(rand(1, 20))	Hunger()
	spawn(rand(1, 20))	Thirst()
	spawn(rand(1, 20))	Sleep()
