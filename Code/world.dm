/world/
	view = 7
	version = 63
	name = "Lands of Legend - Version 0.63"
	status = "Lands of Legend - Version 0.63"
	hub = "Ginseng.LandsofLegend"
	hub_password = ""
	loop_checks = 0
	tick_lag = 0.75

/world/New()
	log = file("ErrorLog.txt")
	LoadMisc()
	CreateOre()
	LoadMap()
	DayNightCyle()
	var/Finish_Remote_Server_Access
	for(var/turf/T in block(locate(98,42,3),locate(114,38,3)))
		var/InTiles = 0
		if(T in Tiles)
			InTiles = 1
		if(InTiles == 0)
			Tiles += T
	for(var/turf/T in world)
		if(T in Tiles)
			for(var/obj/Items/Plants/P in T)
				if(P.icon_state != "big stump" && P.icon_state != "small stump")
					del(P)
	while(1)
		sleep(18000)
		Time()
		SaveMisc()