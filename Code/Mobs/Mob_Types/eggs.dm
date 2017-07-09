/mob/NPC/Misc/NewBorn

/mob/NPC/Misc/FrogEgg
	icon = 'misc.dmi'
	icon_state = "frog egg"
	Race = "Frogman"
	density = 0

/mob/NPC/Misc/SnakeEgg
	icon = 'misc.dmi'
	icon_state = "snake egg"
	Race = "Snakeman"
	density = 0

/mob/NPC/Evil/Misc/Spider_Egg
	icon = 'misc.dmi'
	icon_state = "spider eggs"
	Race = "GiantSpider"
	density = 0

	Humanoid = 0

	Type = "Egg"

	Blood = 100
	BloodMax = 100
	BloodColour = /obj/Misc/Gore/GreenBloodSplat/
	BloodWallColour = /obj/Misc/Gore/GreenWallBloodSplat/

	HP = 100
	HPMAX = 100

	Soul = 0

	Faction = "Spider Hordes"

/mob/NPC/Evil/Misc/Spider_Egg/Click()
	if(usr.Function == "Combat")
		usr.Target = src
		usr << "<b>You target [src]!<br>"

	if(usr.Function == "Pull")
		if(src in range(1,usr))
			if(usr.Pull == src)
				usr.Pull = null
				if(src.Pull == usr)
					src.Pull = null
				view(usr) << "<b>[usr] stops pulling [src]<br>"
				return
			if(src.suffix == null)
				if(usr.Pull == null)
					usr.Pull = src
					src.Pull = usr
					usr.Pull()
					view(usr) << "<b>[usr] starts pulling [src]<br>"
					return

/mob/NPC/Evil/Misc/Spider_Egg/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.DeadIcon = 'misc.dmi'
	src.DeadState = "spider egg dead"
	src.BloodFlow()
	src.SpiderEggHatch()
