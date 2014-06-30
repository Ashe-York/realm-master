/*

NOTES:

Each of the need procs could easily be in a single proc. However, I want it to be simple to read and them separated
so that we can program in different behaviors easily, without relying on a bunch of if operators. Specifically,
sleep will need to actually end up triggering some sort of sleep state-- I choose to have this be a future
thing, rather than implement it totally now.

Also note that NPCs don't currently have such needs. Perhaps, in the future, more intelligent behavior could
be programmed, but for now these are only for owned units.

*/



/mob/creature
	var/need_hunger
	var/need_thirst
	var/need_sleep

	// These variables determine the speed by which the corresponding 'need' speeds up. Exponentially.
	var/food_speed		= 1
	var/thirst_speed	= 1
	var/sleep_speed		= 1



//////////////////////////////////////////
// Procs: NeedProcs
// Called by the StartOwnershipProcs() procedure.

// See top of need procs for notes.w
/mob/creature/proc/Hunger()
	need_hunger = 100
	while (NPC == FALSE)
		ModifyNeed("hunger", food_speed * rand(2, 4)) // Food to be slower in general...

		if (need_hunger < 0)
			need_hunger = 0
			//Starvation()

		sleep(10)

	// Executes if one is no longer an NPC. May be replaced with proc later.
	need_hunger = null




/mob/creature/proc/Thirst()
	need_thirst = 100
	while (NPC == FALSE)
		ModifyNeed("thirst", thirst_speed * rand(4, 7)) // Thirst to be quicker in general...

		if (need_thirst < 0)
			need_thirst = 0
			//Dehydration()


		sleep(10)

	// Executes if one is no longer an NPC. May be replaced with proc later.
	need_thirst = null




/mob/creature/proc/Sleep()
	need_sleep = 100
	while (NPC == FALSE)
		ModifyNeed("sleep", sleep_speed * rand(1, 3)) // Sleep to be quite a bit slower in general...

		if (need_sleep < 0)
			need_sleep = 0
			//Exhaustion()

		sleep(10)

	// Executes if one is no longer an NPC. May be replaced with proc later.
	need_sleep = null



//////////////////////////////////////////
// Proc: ModifyNeed
// Separate proc in case we want to change such things directly in the future.
// Can't think of many instances that would be fair to really consider, yet, but it
// simplifies the code a bit.

/mob/creature/proc/ModifyNeed(need, amount)
	switch (need)
		if ("hunger")	need_hunger -= amount
		if ("thirst")	need_thirst -= amount
		if ("sleep")	need_sleep	-= amount