/obj/HUD

/obj/HUD/E
	icon = 'HUD.dmi'
	icon_state = "equipped marker"
	layer = 11

/obj/HUD/C
	icon = 'HUD.dmi'
	icon_state = "carrying marker"
	layer = 11

/obj/HUD/Text
	icon = 'txt.dmi'
	layer = 100

/obj/HUD/Text/New(client/C)
	C.screen += src
	..()

/obj/HUD/Menus
	layer = 11

/obj/HUD/Menus/Box
	icon = 'HUD.dmi'
	icon_state = "box"