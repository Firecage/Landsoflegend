/obj/Items/Furniture/Misc/Fence
	icon = 'tools.dmi'
	icon_state = "front"
	density = 1
	Fuel = 50
	suffix = "Stuck"

/obj/Items/Furniture/Misc/Fence/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact" && usr.Dead == 0)
			view(usr) << "<font color = yellow>[usr] climbs up onto the [src]!<br>"
			usr.loc = src.loc
			return

/obj/Items/Furniture/Misc/BookStand
	icon = 'furniture.dmi'
	icon_state = "bookstand"
	Fuel = 25

/obj/Items/Furniture/Misc/StoneStand
	icon = 'furniture.dmi'
	icon_state = "stone stand"

/obj/Items/Furniture/Misc/Picture
	icon = 'misc.dmi'
	icon_state = "pic 1"
	name = "Picture"
	suffix = "Stuck"
	Weight = 4
	Fuel = 35

/obj/Items/Furniture/Misc/Picture/New()
	var/PicNum = rand(1,12)
	src.icon_state = "pic [PicNum]"
	if(src.dir == NORTH)
		src.pixel_y = 32
	if(src.dir == SOUTH)
		src.pixel_y = -32
	if(src.dir == EAST)
		src.pixel_x = 32
	if(src.dir == WEST)
		src.pixel_x = -32

/obj/Items/Furniture/Misc/GlowingCrystal
	icon = 'misc.dmi'
	icon_state = "glowing crystal"
	name = "Glowing Crystal"
	suffix = "Stuck"
	Weight = 4
	luminosity = 5
	Fuel = 35

/obj/Items/Furniture/Misc/GlowingCrystal/New()
	if(src.dir == NORTH)
		src.pixel_y = 32
	if(src.dir == SOUTH)
		src.pixel_y = -32
	if(src.dir == EAST)
		src.pixel_x = 32
	if(src.dir == WEST)
		src.pixel_x = -32
