/obj/Items/Plants
	icon = 'plants.dmi'
	suffix = "Stuck"

/obj/Items/Plants/Plant
	icon_state = "plant1"
	Fuel = 15
	desc = "This is a plant, depending on what type, it might be useful.<br>"

/obj/Items/Plants/Plant/New()
	spawn(10)
		var/I = rand(1,7)
		src.icon_state = "plant[I]"
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)
