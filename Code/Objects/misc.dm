/obj/Misc/Contact

/obj/Misc/Admins

/obj/Misc/Night
	icon = 'fx.dmi'
	icon_state = "night"
	layer = 99

/obj/Misc/ContainerOverlays
	icon = 'containers.dmi'

/obj/Misc/ContainerOverlays/BowlOverlay
	icon_state = "bowl liquid"

/obj/Misc/Layer

/obj/Misc/RailTracks
	icon = 'tools.dmi'
	icon_state = "tracks"
	suffix = "Stuck"

/obj/Misc/Marker
	icon = 'misc.dmi'
	icon_state = "marker"

/obj/Misc/Marker/New()
	spawn(9)
		src.RandomItem()

