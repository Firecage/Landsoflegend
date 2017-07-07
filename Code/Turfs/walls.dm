/turf/Walls/MapEdge
	density = 1
	opacity = 1

/turf/Walls/SolidDarkStone
	icon_state = "dark stone"
	Type = "Solid Wall"
	density = 1
	opacity = 1
	Dura = 100
	ManMade = 1
	Material = "Stone"
/turf/Walls/SolidDarkStone/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/SolidStone
	icon_state = "stone"
	Type = "Solid Wall"
	density = 1
	opacity = 1
	Dura = 800
	ManMade = 1
	Material = "Stone"
/turf/Walls/SolidStone/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/BrickWall
	icon_state = "brick wall"
	density = 1
	opacity = 1
	Material = "Stone"
	Dura = 650
/turf/Walls/BrickWall/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/WoodenWall
	icon_state = "wood wall"
	density = 1
	opacity = 1
	Fuel = 100
	Material = "Wood"
	Dura = 300
/turf/Walls/WoodenWall/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/BulkyBrickWall
	icon_state = "bulky brick wall"
	density = 1
	opacity = 1
	Material = "Stone"
	Dura = 700
/turf/Walls/BulkyBrickWall/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/StrangeCrystalWall
	icon_state = "strange crystal wall"
	density = 1
	opacity = 1
	Material = "Stone"
	Dura = 2000
/turf/Walls/StrangeCrystalWall/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/BulkyBrickWindow
	icon_state = "bulky brick window"
	density = 1

/turf/Walls/ReallyBulkyBrickWall
	icon_state = "really bulky wall"
	density = 1
	opacity = 1
	Material = "Stone"
	Dura = 800
/turf/Walls/ReallyBulkyBrickWall/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/ReallyBulkyLightBrickWall
	icon_state = "really bulky light stone wall"
	density = 1
	opacity = 1
	Material = "Stone"
	Dura = 800
/turf/Walls/ReallyBulkyLightBrickWall/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)

/turf/Walls/ReallyBulkySandStoneWall
	icon_state = "really bulky sandstone wall"
	density = 1
	opacity = 1
	Material = "Stone"
	Dura = 800
/turf/Walls/ReallyBulkySandStoneWall/Click()
	if(usr.Function == "Combat")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		usr.WallDigAttack(src)