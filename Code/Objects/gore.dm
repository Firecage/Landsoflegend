/obj/Misc/Gore
	icon = 'gore.dmi'

/obj/Misc/Gore/FleshBeastCorpse
	icon = 'corpses.dmi'
	icon_state = "flesh beast corpse right"
	pixel_x = 32

/obj/Misc/Gore/DrakeCorpse
	icon = 'corpses.dmi'
	icon_state = "drake corpse right"
	pixel_x = 32

/obj/Misc/Gore/TrollCorpse
	icon = 'corpses.dmi'
	icon_state = "troll corpse right"
	pixel_x = 32

/obj/Misc/Gore/YetiCorpse
	icon = 'corpses.dmi'
	icon_state = "yeti corpse right"
	pixel_x = 32

/obj/Misc/Gore/GiantSnakeCorpse
	icon = 'corpses.dmi'
	icon_state = "giant snake corpse right"
	pixel_x = 32

/obj/Misc/Gore/HeadWound
	icon_state = "damage head"
	layer = 4

/obj/Misc/Gore/TorsoWound
	icon_state = "damage torso"
	layer = 4

/obj/Misc/Gore/RightArmWound
	icon_state = "damage rarm"
	layer = 4

/obj/Misc/Gore/LeftArmWound
	icon_state = "damage larm"
	layer = 4

/obj/Misc/Gore/RightLegWound
	icon_state = "damage rleg"
	layer = 4

/obj/Misc/Gore/LeftLegWound
	icon_state = "damage lleg"
	layer = 4

/obj/Misc/Gore/BloodSplat
	icon_state = "floor small1"
	suffix = "Stuck"

/obj/Misc/Gore/BloodSplat/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact")
			view(usr) << "<b>[usr] wipes away some blood!<br>"
			del(src)
			return

/obj/Misc/Gore/BloodSplat/New()
	var/I = rand(1,5)
	src.icon_state = "floor small[I]"
	spawn(10000)
		if(src)
			del(src)

/obj/Misc/Gore/GreenBloodSplat
	icon_state = "green floor1"
	suffix = "Stuck"

/obj/Misc/Gore/GreenBloodSplat/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact")
			view(usr) << "<b>[usr] wipes away some blood!<br>"
			del(src)
			return

/obj/Misc/Gore/GreenBloodSplat/New()
	var/I = rand(1,5)
	src.icon_state = "green floor[I]"
	spawn(10000)
		if(src)
			del(src)

/obj/Misc/Gore/BloodTrail
	icon_state = "blood trail"
	suffix = "Stuck"

/obj/Misc/Gore/BloodTrail/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact")
			view(usr) << "<b>[usr] wipes away some blood!<br>"
			del(src)
			return

/obj/Misc/Gore/BloodTrail/New()
	spawn(2000)
		if(src)
			del(src)

/obj/Misc/Gore/BloodPuddle
	icon_state = "floor puddle"
	suffix = "Stuck"

/obj/Misc/Gore/BloodPuddle/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact")
			view(usr) << "<b>[usr] wipes away some blood!<br>"
			del(src)
			return

/obj/Misc/Gore/BloodPuddle/New()
	spawn(10000)
		if(src)
			del(src)

/obj/Misc/Gore/Puke
	icon_state = "Puke"
	suffix = "Stuck"

/obj/Misc/Gore/Puke/New()
	spawn(10000)
		if(src)
			del(src)

/obj/Misc/Gore/Puke/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact")
			view(usr) << "<b>[usr] wipes away some sick!<br>"
			del(src)
			return

/obj/Misc/Gore/GreenWallBloodSplat
	icon_state = "green wall1"
	suffix = "Stuck"

/obj/Misc/Gore/GreenWallBloodSplat/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact")
			view(usr) << "<b>[usr] wipes away some blood!<br>"
			del(src)
			return

/obj/Misc/Gore/GreenWallBloodSplat/New()
	var/I = rand(1,5)
	src.icon_state = "green wall[I]"
	spawn(10000)
		if(src)
			del(src)

/obj/Misc/Gore/WallBloodSplat
	icon_state = "wall small1"
	suffix = "Stuck"

/obj/Misc/Gore/WallBloodSplat/Click()
	if(src in range(1,usr))
		if(usr.Function == "Interact")
			view(usr) << "<b>[usr] wipes away some blood!<br>"
			del(src)
			return

/obj/Misc/Gore/WallBloodSplat/New()
	var/I = rand(1,5)
	src.icon_state = "wall small[I]"
	spawn(10000)
		if(src)
			del(src)

/obj/Misc/Gore/WallBloodSplatLarge
	suffix = "Stuck"
	icon_state = "wall"