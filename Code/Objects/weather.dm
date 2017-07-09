/obj/Misc/Weather
	icon = 'fx.dmi'

/obj/Misc/Weather/Night
	layer = 10
	icon_state = "night"

/obj/Misc/Weather/Rain
	layer = 10
	icon_state = "rain"

/obj/Misc/Weather/Snow
	layer = 10
	icon_state = "snow"

/obj/Misc/Weather/LighteningBolt
	layer = 10
	icon_state = "lighteningbolt"

/obj/Misc/Weather/LighteningHit
	layer = 10
	icon_state = "lighteninghit"
	luminosity = 5

/obj/Misc/Weather/LighteningHit/New()
	var/obj/Misc/Weather/LighteningBolt/LB = new
	LB.pixel_y = 32
	src.overlays += LB

	var/obj/Misc/Weather/LighteningBolt/LB2 = new
	LB2.pixel_y = 64
	src.overlays += LB2
	spawn(10)
		if(src)
			del(src)