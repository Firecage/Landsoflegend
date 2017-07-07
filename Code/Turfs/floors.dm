/turf/Floors/SolidStoneFloor
	icon_state = "stone floor"
	Type = "Dark"
	luminosity = 0
	ManMade = 1 // Makes it so the AddObjects proc wont place boulders onto it

/turf/Floors/SolidStoneFloor/Click()
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

/turf/Floors/Grass
	icon_state = "grass"
/turf/Floors/Grass/Click()
	if(usr.Function == "Combat")
		if(src.density)
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

/turf/Floors/GrassSnow
	icon_state = "grass-snow"
/turf/Floors/GrassSnow/Click()
	if(usr.Function == "Combat")
		if(src.density)
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

/turf/Floors/GrassSand
	icon_state = "grass-sand"
/turf/Floors/GrassSand/Click()
	if(usr.Function == "Combat")
		if(src.density)
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

/turf/Floors/Snow
	icon_state = "snow"
/turf/Floors/Snow/Click()
	if(usr.Function == "Combat")
		if(src.density)
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

/turf/Floors/Sky
	icon_state = "clouds"
	Type = "Hole"
/turf/Floors/Sky/Enter(var/atom/a)
	if(src.icon_state == "clouds")
		if(isobj(a))
			var/obj/O = a
			view(6,O) << "<font color = yellow>[O] falls down from the sky!<br>"
			O.loc = locate(src.x,src.y,1)
			oview(6,O) << "<font color = yellow>[O] falls down from the sky!<br>"
		if(ismob(a))
			var/mob/M = a
			view(6,M) << "<font color = yellow>[M] falls down from the sky!<br>"
			M.loc = locate(src.x,src.y,1)
			oview(6,M) << "<font color = yellow>[M] falls down from the sky!<br>"
			if(M.Dead == 0)
				M.HitObject()
			for(var/obj/Misc/Hole/H in range(0,M))
				M.Bump(H)
	else
		if(ismob(a))
			var/mob/M = a
			if(M.density && src.density)
				return
			for(var/mob/M2 in src)
				if(M2.density && M2 != M)
					return
			for(var/obj/O in src)
				if(O.density && M.density)
					return
	return(1)

/turf/Floors/AstralPlanes
	icon_state = "astral plane"

/turf/Floors/Ash
	icon_state = "ash floor"
/turf/Floors/Ash/Click()
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

/turf/Floors/Dirt
	icon_state = "dirt"
/turf/Floors/Dirt/Click()
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

/turf/Floors/UnderWater
	icon_state = "underwater floor"
	Type = "Water"
/turf/Floors/UnderWater/New()
	var/Bubs = prob(3)
	if(Bubs)
		src.overlays += /obj/Misc/Bubbles/
/turf/Floors/UnderWater/Entered(var/atom/a)
	if(ismob(a))
		var/mob/M = a
		if(M.Dead == 0)
			M.overlays += /obj/Misc/Bubbles/
			M.InWater = 2
			if(M.LastLoc)
				var/NotWater = 1
				if(istype(M.LastLoc,src.type))
					NotWater = 0
				if(NotWater)
					M.Breathe()
/turf/Floors/UnderWater/Exited(var/atom/a)
	if(ismob(a))
		var/mob/M = a
		M.overlays -= /obj/Misc/Bubbles/
		M.InWater = 0
/turf/Floors/UnderWater/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = locate(src.x,src.y,1)
	if(usr.OnFire && usr.Fuel)
		usr.OnFire = 0
		usr.Fuel = 0
		usr.overlays -= /obj/Misc/Fire/
		view() << "<font color = yellow>[usr] jumps into the water and puts them self out!<br>"
		return
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.icon_state == "underwater floor" && usr.Fainted == 0)
				if(usr.CantDoTask == 0)
					usr.CantDoTask = 1
					var/Delay = rand(100,150)
					if(usr.LeftLeg == 0)
						Delay += 25
					if(usr.RightLeg == 0)
						Delay += 25
					if(usr.RightArm == 0)
						Delay += 25
					if(usr.LeftArm == 0)
						Delay += 25
					spawn(Delay)
						if(usr)
							usr.CantDoTask = 0
					view() << "<font color = yellow>[usr] begins to swims up!<br>"
					var/Sink = 0
					Sink += usr.Weight / 5
					Sink -= usr.Strength / 4
					Sink -= usr.SwimmingSkill / 4
					var/Sinks = prob(Sink)
					if(Sinks)
						view() << "<font color = yellow>[usr] sinks back down again!<br>"
						return
					usr.loc = locate(src.x,src.y,1)
					usr.overlays -= /obj/Misc/Bubbles/
					if(usr.Dead == 0)
						usr.InWater = 1
					for(var/turf/T in range(0,usr))
						if(T.icon_state != "water")
							usr.loc = locate(src.x,src.y,3)
							if(usr.Dead == 0)
								usr.overlays += /obj/Misc/Bubbles/
							view() << "<font color = yellow>[usr] swims down again after finding no exit!<br>"
				else
					usr << "<font color = red>Must wait before trying to swim up again!<br>"
					return
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

/turf/Floors/Blood
	icon_state = "blood"
	density = 1
	Type = "Blood"

/turf/Floors/Swamp
	icon_state = "swampy water"
	Type = "Water"
/turf/Floors/Swamp/Click()
	for(var/obj/Items/Armour/Shields/Torch/T in usr)
		if(T.Type == "Torch Lit" && T.suffix == "Equip")
			view() << "<font color = yellow>[usr] places their Torch into the water!<br>"
			usr.overlays-=image(T.icon,T.icon_state,T.ItemLayer)
			T.CarryState = "torch"
			T.EquipState = "torch equip"
			T.icon_state = T.EquipState
			T.Type = "Torch"
			usr.overlays+=image(T.icon,T.icon_state,T.ItemLayer)
			return
	if(usr.OnFire && usr.Fuel)
		usr.OnFire = 0
		usr.Fuel = 0
		usr.overlays -= /obj/Misc/Fire/
		view() << "<font color = yellow>[usr] jumps into the water and puts them self out!<br>"
		return
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

/turf/Floors/Water
	icon_state = "water"
	Type = "Water"
/turf/Floors/Water/Enter(var/atom/a)
	if(ismob(a))
		var/mob/M = a
		if(src.ManMade && M.InWater)
			M.InWater = 0
			M.overlays -= /obj/Misc/Swim/
		if(src.density)
			return
		for(var/atom/A in src)
			if(A.density && M.density)
				return
	return(1)
/turf/Floors/Water/Entered(var/atom/a)
	if(ismob(a))
		var/mob/M = a
		if(M.Dead == 0)
			M.overlays += /obj/Misc/Swim/
			M.InWater = 1
		if(src.ManMade && M.InWater)
			M.InWater = 0
			M.overlays -= /obj/Misc/Swim/
/turf/Floors/Water/Exited(var/atom/a)
	if(ismob(a))
		var/mob/M = a
		M.overlays -= /obj/Misc/Swim/
		M.InWater = 0
/turf/Floors/Water/Click()
	for(var/obj/Items/Armour/Shields/Torch/T in usr)
		if(T.Type == "Torch Lit" && T.suffix == "Equip")
			view() << "<font color = yellow>[usr] places their Torch into the water!<br>"
			usr.overlays-=image(T.icon,T.icon_state,T.ItemLayer)
			T.CarryState = "torch"
			T.EquipState = "torch equip"
			T.icon_state = T.EquipState
			T.Type = "Torch"
			usr.overlays+=image(T.icon,T.icon_state,T.ItemLayer)
			return
	if(usr.OnFire && usr.Fuel)
		usr.OnFire = 0
		usr.Fuel = 0
		usr.overlays -= /obj/Misc/Fire/
		view() << "<font color = yellow>[usr] jumps into the water and puts them self out!<br>"
		return
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src.icon_state == "water")
			if(src in range(1,usr))
				view() << "<font color = yellow>[usr] dives down into the [src]!<br>"
				usr.overlays -= /obj/Misc/Swim/
				if(usr.Dead == 0)
					usr.InWater = 2
					spawn(1)
						if(usr && usr.InWater == 2)
							usr.Breathe()
				usr.loc = locate(src.x,src.y,3)
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

/turf/Floors/StoneRoad
	icon_state = "stone road3"

/turf/Floors/StoneRoad/Click()
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

/turf/Floors/DirtRoad
	icon_state = "dirt road"
	Dura = 33
/turf/Floors/DirtRoad/Click()
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

/turf/Floors/Sand
	icon_state = "sand"
/turf/Floors/Sand/Click()
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

/turf/Floors/WoodFloor
	icon_state = "wood floor"
	Fuel = 100
	Type = "Dark"
	luminosity = 0
	ManMade = 1 // Makes it so the AddObjects proc wont place boulders onto it
	Dura = 50
	Material = "Wood"
/turf/Floors/WoodFloor/Click()
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

/turf/Floors/RedCarpet
	icon_state = "red carpet"
	Type = "Dark"
	ManMade = 1 // Makes it so the AddObjects proc wont place boulders onto it
	Dura = 33
/turf/Floors/RedCarpet/Click()
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

/turf/Floors/LightStoneSlab
	name = "Stone Slab"
	icon_state = "light slab stone floor"
	Type = "Dark"
	luminosity = 0
	Material = "Stone"
	ManMade = 1 // Makes it so the AddObjects proc wont place boulders onto it
	Dura = 100
/turf/Floors/LightStoneSlab/Click()
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

/turf/Floors/StrangeCrystalSlab
	icon_state = "strange crystal slab"
	Type = "Dark"
	luminosity = 0
	ManMade = 1 // Makes it so the AddObjects proc wont place boulders onto it
	Dura = 400
	Material = "Stone"
/turf/Floors/StrangeCrystalSlab/Click()
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

/turf/Floors/StoneSlab
	icon_state = "slab stone floor"
	Type = "Dark"
	luminosity = 0
	ManMade = 1 // Makes it so the AddObjects proc wont place boulders onto it
	Dura = 100
	Material = "Stone"
/turf/Floors/StoneSlab/Click()
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

/turf/Floors/SandStoneSlab
	icon_state = "slab sandstone floor"
	Type = "Dark"
	luminosity = 0
	Material = "Stone"
	Dura = 100
/turf/Floors/SandStoneSlab/Click()
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