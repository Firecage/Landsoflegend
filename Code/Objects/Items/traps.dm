/obj/Items/Traps
	icon = 'traps.dmi'

/obj/Items/Traps/SpikedBall
	icon_state = "spiked ball"
	Type = "Spiked Ball"

/obj/Items/Traps/SandStonePressurePlate
	name = ""
	Type = "Pressure Plate"
	icon_state = "pressure plate2"

/obj/Items/Traps/SandStonePressurePlate/New()
	spawn(1)
		for(var/obj/Items/Traps/T in orange(4,src))
			if(src.Ref == null)
				src.Ref = T
	src.PressurePlateTrap()

/obj/proc/PressurePlateTrap()
	for(var/mob/M in range(0,src))
		view(src) << "<font color = red>You hear a loud grinding noise...<br>"
		if(src.Ref)
			var/obj/O = src.Ref
			if(O.Type == "Spiked Ball")
				return
	spawn(5) PressurePlateTrap()

