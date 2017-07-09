/obj/Items/Plants/Bush
	icon_state = "bush1"
	Fuel = 30
	desc = "This is a bush, you might find berries in them.<br>"

/obj/Items/Plants/Bush/Click()
	if(src in range(1,usr))
		if(usr.Function == "Examine")
			usr << "<font color=teal>[src.desc]"
			return
		if(usr.Function == "Combat")
			if(usr.Dead == 0 && usr.Fainted == 0 && usr.Stunned == 0 && usr.Job == null && usr.CanMove)
				var/HasArms = 1
				if(usr.LeftArm <= 20)
					if(usr.RightArm <= 20)
						HasArms = 0
				if(HasArms)
					view(usr) << "<font color = yellow>[usr] rips up the [src]!<br>"
					del(src)
					return
				else
					usr << "<font color = red>You cant do that with hurt arms!<br>"
					return
		if(usr.Function == "Interact")
			if(usr.Dead == 0)
				if(usr.Job == null)
					var/Loc = usr.loc
					if(usr.Fainted == 0)
						if(usr.Stunned == 0)
							if(src.Type)
								view(usr) << "<font color=yellow>[usr] begins to pick berries from the [src]!<br>"
								usr.Job = "PickBerries"
								usr.CanMove = 0
								var/Time = 150
								Time -= usr.FarmingSkill * 2
								if(Time <= 25)
									Time = 25
								spawn(Time)
									if(src && usr)
										if(usr.loc == Loc)
											if(usr.Job == "PickBerries")
												usr.Job = null
												usr.FarmingSkill += usr.FarmingSkillMulti
												if(src.Type == "RedBerries")
													var/obj/Items/Foods/RedBerries/R = new
													R.loc = usr.loc
												if(src.Type == "BlueBerries")
													var/obj/Items/Foods/BlueBerries/B = new
													B.loc = usr.loc
												src.Type = null
												src.overlays = null
												usr << "<font color =green>You finish picking berries from the [src]!<br>"
												usr.MovementCheck()
										else
											usr << "<font color=red>You moved from the position you were picking berries at, you failed to get any!<br>"
											usr.MovementCheck()
											return

/obj/Items/Plants/Bush/New()
	var/I = rand(1,3)
	src.icon_state = "bush[I]"
	var/HasBerries = prob(75)
	if(HasBerries)
		var/Colour = rand(1,2)
		if(Colour == 1)
			src.overlays += /obj/Items/Plants/Berries/RedBerries/
			src.Type = "RedBerries"
		if(Colour == 2)
			src.overlays += /obj/Items/Plants/Berries/BlueBerries/
			src.Type = "BlueBerries"
	spawn(10)
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)

/obj/Items/Plants/Berries

/obj/Items/Plants/Berries/RedBerries
	layer = 4
	icon_state = "berries1"

/obj/Items/Plants/Berries/BlueBerries
	layer = 4
	icon_state = "berries3"
