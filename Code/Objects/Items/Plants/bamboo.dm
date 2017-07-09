/obj/Items/Plants/Bamboo
	icon_state = "bamboo1"
	Fuel = 30
	desc = "This is bamboo.<br>"
	density = 1
	opacity = 1

/obj/Items/Plants/Bamboo/New()
	var/I = rand(1,2)
	src.icon_state = "bamboo[I]"
	spawn(10)
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T.icon_state != "grass")
				if(T.icon_state != "ash floor")
					if(T.icon_state != "dirt")
						if(T.icon_state != "dirt road")
							del(src)
