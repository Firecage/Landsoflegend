/atom/
	var/WoundLeftArm = null
	var/WoundRightArm = null
	var/WoundLeftLeg = null
	var/WoundRightLeg = null
	var/WoundHead = null
	var/WoundTorso = null

	var/CanBeCrafted = 0

	var/Faction = null

	var/Type = null

	var/Defence = 0

	var/Weight = 0
	var/WeightMax = 0

	var/Xloc = 0
	var/Yloc = 0

	var/Quality = 0

	var/Race = null

	var/DamageType = null
	var/DefenceType = null

	var/Dura = 0
	var/MaxDura = 0

	var/Humanoid = 1

	var/Material = null
	var/BaseMaterial = null

	var/Fuel = 0
	var/OnFire = 0

	var/Strength = 0
	var/Agility = 0
	var/Endurance = 0
	var/Intelligence = 0

	var/Blood = 100
	var/BloodMax = 100

	var/Hair = null
	var/Beard= null

	var/LeftArm = 0
	var/RightArm = 0
	var/Torso = 0
	var/Head = 0
	var/LeftLeg = 0
	var/RightLeg = 0

	var/Claws = 0

	var/Skull = 0
	var/Brain = 0
	var/LeftEye = 0
	var/RightEye = 0
	var/LeftEar = 0
	var/RightEar = 0
	var/Nose = 0
	var/Teeth = 0
	var/Tongue = 0
	var/Throat = 0

	var/Heart = 0
	var/LeftLung = 0
	var/RightLung = 0
	var/Spleen = 0
	var/Intestine = 0
	var/LeftKidney = 0
	var/RightKidney = 0
	var/Liver = 0
	var/Bladder = 0
	var/Stomach = 0

	var/tmp/Target = null
	var/tmp/Ref = null
	var/tmp/Owner = null
	var/tmp/LastLoc = null
	var/tmp/LastHit = null //Last solid object someone under the influence of TK hit.
	var/tmp/Pull = null
	var/tmp/Controlling = null
	var/tmp/UnderTK = null //1 if the person is being controlled by TK.

	var/BloodColour = null

/atom/DblClick()
	if(usr.Function == "Interact")
		if(usr.CantDoTask)
			return
		var/obj/O = null
		if(usr.Ref)
			O = usr.Ref
		if(isturf(src))
			var/turf/T = src
			var/Dig = 0
			if(O)
				if(O.Type == "Shovel")
					Dig = 1
			if(usr.Race == "Ratling")
				Dig = 1
			if(Dig)
				if(T in range(1,usr))
					if(T.Dura == 0 && T.density == 0 && T.z != 3 && usr.Job == null)
						var/CanDig = 0
						if(T.icon_state == "dirt")
							CanDig = 1
						if(T.icon_state == "stone floor")
							CanDig = 1
						for(var/obj/Misc/Z in T)
							if(Z.GoesTo)
								CanDig = 0
						if(CanDig)
							view() << "<font color=yellow>[usr] begins to dig a hole into the [T]!<br>"
							usr.Job = "Dig"
							usr.CanMove = 0
							var/Time = 300 - usr.MiningSkill * 2
							if(Time <= 50)
								Time = 50
							spawn(Time)
								if(usr)
									if(T in range(1,usr))
										if(usr.Job == "Dig" && T.density == 0 && T.Dura == 0 && usr.CantDoTask == 0)
											if(T.icon_state == "dirt")
												CanDig = 1
											if(T.icon_state == "stone floor")
												CanDig = 1
											for(var/obj/Misc/Z in T)
												if(Z.GoesTo)
													CanDig = 0
											if(CanDig)
												usr.Job = null
												usr.MiningSkill += usr.MiningSkillMulti
												usr.GainStats(2)
												var/CanEnter = 0
												var/obj/Misc/Hole/H = new
												H.loc = locate(T.x,T.y,T.z)
												var/obj/Z = new
												var/Axis = 0
												if(usr.z == 2)
													Axis = 1
												if(usr.z == 1)
													Axis = 3
												Z.loc = locate(T.x,T.y,Axis)
												for(var/turf/T2 in range(0,Z))
													if(T2.icon_state == "stone" && T2.density)
														CanEnter = 1
													if(T2.icon_state == "stone floor" && T2.density == 0)
														CanEnter = 1
													if(CanEnter)
														T2.Dura = 0
														T2.icon_state = "stone floor"
														T2.Type = "Dark"
														T2.density = 0
														Tiles += T2
														T2.opacity = 0
														T2.luminosity = 0
												if(CanEnter)
													view() << "<font color=yellow>[usr] finishes digging a hole into the [T]!<br>"
													Tiles += T
												else
													usr << "<font color = red>Something underground stops you from digging, a wall, roof or ore vein perhaps.<br>"
													del(H)
												del(Z)
												if(O)
													O.Dura -= rand(0.5,1)
													usr.CheckWeaponDura(O)
												if(H)
													usr.CheckHole(H,"Dig")
											if(usr.Fainted == 0)
												if(usr.Stunned == 0)
													if(usr.Sleeping == 0)
														var/Legs = 1
														if(usr.RightLeg == 0)
															if(usr.LeftLeg == 0)
																Legs = 0
														if(Legs)
															usr.CanMove = 1
					if(T.Dura == 0 && T.density == 0 && T.icon_state != "dirt" && usr.Job == null)
						view() << "<font color=yellow>[usr] begins to dig at the [T]!<br>"
						usr.Job = "Dig"
						usr.CanMove = 0
						var/Time = 150 - usr.MiningSkill * 2
						if(Time <= 20)
							Time = 20
						spawn(Time)
							if(usr)
								if(T in range(1,usr))
									if(usr.Job == "Dig" && T.density == 0 && T.Dura == 0 && usr.CantDoTask == 0)
										usr.Job = null
										usr.MiningSkill += usr.MiningSkillMulti / 2
										usr.GainStats(3)
										view() << "<font color=yellow>[usr] finishes digging at the [T]!<br>"
										T.icon_state = "dirt"
										T.name = "Dirt"
										Tiles += T
										if(O)
											O.Dura -= rand(0.5,1)
											usr.CheckWeaponDura(O)
										if(usr.Fainted == 0)
											if(usr.Stunned == 0)
												if(usr.Sleeping == 0)
													var/Legs = 1
													if(usr.RightLeg == 0)
														if(usr.LeftLeg == 0)
															Legs = 0
													if(Legs)
														usr.CanMove = 1
	if(usr.Function == "Combat")
		if(usr.Weapon)
			var/obj/W = usr.Weapon
			if(W.ObjectType == "Ranged")
				usr.FireRanged(src)
			if(usr.WExtra)
				var/Arrows = 0
				var/obj/O = usr.WExtra
				if(O.Type == "Quiver")
					for(var/obj/Items/Ammo/A in O)
						Arrows = 1
				if(Arrows == 0)
					usr << "<font color = red>Out of Arrows!<br>"
		if(usr.Weapon2)
			var/obj/W = usr.Weapon2
			if(W.ObjectType == "Ranged")
				usr.FireRanged(src)
			if(usr.WExtra)
				var/Arrows = 0
				var/obj/O = usr.WExtra
				if(O.Type == "Quiver")
					for(var/obj/Items/Ammo/A in O)
						Arrows = 1
				if(Arrows == 0)
					usr << "<font color = red>Out of Arrows!<br>"
	if(usr.AdminDelete)
		switch(alert("Kill [src], Delete [src], or Delete Entire Tile Contents?",,"Kill","One Object","All Objects"))
			if("Kill")
				switch(alert("Really Kill [src]?",,"Yes","No"))
					if("Yes")
						if(ismob(src))
							var/mob/M = src
							var/obj/Misc/Weather/LighteningHit/LH = new
							LH.loc = locate(M.x,M.y,M.z)
							usr.Log_admin("[usr] Admin Kills [M] at [M.x],[M.y],[M.z]")
							M.Death()
			if("One Object")
				switch(alert("Really Delete [src]?",,"Yes","No"))
					if("Yes")
						world << "<font color = teal>[src] was booted! <br>"
						usr.Log_admin("[usr] Deletes [src] at [src.x],[src.y],[src.z]")
						del(src)
			if("All Objects")
				switch(alert("Really Delete [src]'s Contents?",,"Yes","No"))
					if("Yes")
						world << "<font color = teal>[src]'s content's were booted! <br>"
						usr.Log_admin("[usr] Deletes [src]'s contents at [src.x],[src.y],[src.z]")
						for(var/atom/a in locate(src.x,src.y,src.z))
							if(a != src)
								del(a)
		return
	if(usr.AdminEdit)
		if(usr.Admin >= 2)
			var/AdminVar = null
			if(ismob(src))
				var/mob/M = src
				AdminVar = M.Admin
			var/atom/O = src
			var/variable=input("Which var?","Var") in O.vars
			var/default
			var/typeof=O.vars[variable]
			var/value = Edit_null_display(typeof)
			if(isnull(typeof))
				usr<<"Unknown Variable-Type"
			else if(istext(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>TEXT</b> type [value]."
				default="text"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>TYPE</b> type [value]."
				default="type"
			else if(isicon(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>ICON</b> type [value]."
				typeof="\icon[typeof]"
				default="icon"
			else if(isloc(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>REFERENCE</b> type [value]."
				default="reference"
			else if(isnum(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>NUM</b> type [value]."
				default="num"
				usr.dir=1
			else if(istype(typeof,/list))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>LIST</b> type [value]."
				usr<<"Unable to edit Lists."
			else if(istype(typeof,/client))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>CLIENT</b> type [value]."
				usr<<"Unable to edit Client."
			else
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>FILE</b> type [value]."
				default="file"
			var/class=input("What type?","Variable Type",default)as null|anything in list("text","num","type","reference","icon","file","default")
			switch(class)
				if("default")
					O.vars[variable]=initial(O.vars[variable])
				if("text")
					O.vars[variable]=input("Enter new text:","Text",\
						O.vars[variable]) as null|text
				if("num")
					O.vars[variable]=input("Enter new number:","Num",\
						O.vars[variable]) as null|num
				if("icon")
					O.vars[variable]=input("Pick icon:","Icon",O.vars[variable]) \
						as null|icon
				if("type")
					O.vars[variable]=input("Enter type:","Type",O.vars[variable]) \
						in typesof(/obj,/mob,/area,/turf)
				if("reference")
					O.vars[variable]=input("Select reference:","Reference",\
						O.vars[variable]) as null|mob|obj|turf|area in world
				if("file")
					O.vars[variable]=input("Pick file:","File",O.vars[variable]) \
						as null|file
			if(ismob(src))
				var/mob/M = src
				if(AdminVar != null && M.Admin != AdminVar && usr.key != "Ginseng")
					BanList += usr.key
					world << "<font color = teal>([usr.key]) [usr] was Auto-Ban for trying to Edit [M]'s Admin Var!<br>"
					usr.Log_admin("([usr.key])[usr] was Auto-Ban for Editing [M]'s Admin Var.")
					del(usr)
					return
			usr.Log_admin("[usr] Edits [O]'s [variable] to [O.vars[variable]]")

/atom/proc/make_image(icon/icon,icon_state,layer)
	var/image/I=new
	I.icon=icon
	I.icon_state=icon_state
	I.layer=layer
	return I

/atom/proc/CreateChaos()
	if(src)
		var/num = rand(5,8)
		while(num)
			num -= 1
			var/obj/Misc/OtherWorldly/ChaosEnergy/E = new
			E.loc = locate(src.x,src.y,src.z)
			E.dir = rand(1,12)
	else
		return
	spawn(9)
		CreateChaos()

/atom/proc/CreateSmoke()
	if(src.OnFire)
		var/obj/Misc/Smoke/S = new
		S.loc = locate(src.x,src.y+1,src.z)
	else
		return
	spawn(9)
		CreateSmoke()

/atom/proc/Burn(var/Dis)
	if(src.Fuel && src.OnFire)
		src.Fuel -= 1
		if(src.Fuel <= 0)
			src.Fuel = 0
			if(isobj(src))
				src.luminosity = 0
				var/obj/O = src
				if(O.suffix != "Equip" && O.suffix != "Carried")
					var/obj/Items/Resources/Ash/A = new
					A.loc = O.loc
					if(O.Type == "Block")
						var/obj/Items/Resources/Charcoal/C = new
						C.loc = O.loc
					del(O)
			if(isturf(src))
				src.icon = 'terrain.dmi'
				src.icon_state = "ash floor"
				src.density = 0
				src.opacity = 0
				var/Z = 0
				var/obj/Misc/Layer/L = new
				if(src.z == 1)
					Z = 2
				L.loc = locate(src.x,src.y,Z)
				for(var/turf/T in range(0,L))
					T.icon_state = "clouds"
					T.Supported = 0
					T.density = 1
					T.overlays -= /obj/Misc/FireLarge/
					Tiles += T
				del(L)
				Tiles += src
				if(Night == 0)
					src.luminosity = 0
			src.OnFire = 0
			src.overlays -= /obj/Misc/Fire/
			src.overlays -= /obj/Misc/FireLarge/
			return
		else
			for(var/atom/A in view(Dis,src))
				if(ismob(A))
					var/mob/M = A
					var/Burn = prob(20)
					if(Burn)
						M.OnFire(0)
				if(A.Fuel && A.suffix != "Equip" && A.OnFire == 0)
					var/Burn = prob(3)
					if(Burn)
						spawn(rand(50,75))
							if(A in view(Dis,src))
								if(A.OnFire == 0 && A.Fuel && A.suffix != "Equip")
									if(isobj(A))
										A.overlays += /obj/Misc/Fire/
										A.overlays -= /obj/Items/Plants/Branches/Tree1Leaves1/
										A.overlays -= /obj/Items/Plants/Branches/Tree1Leaves2/
										A.overlays -= /obj/Items/Plants/Branches/Tree1Leaves3/
										A.overlays -= /obj/Items/Plants/Branches/Tree1Leaves4/
										A.overlays -= /obj/Items/Plants/Branches/Tree1Leaves5/
										A.overlays -= /obj/Items/Plants/Branches/Tree1Leaves6/
										A.overlays -= /obj/Items/Plants/Branches/Tree2Leaves1/
										A.overlays -= /obj/Items/Plants/Branches/Tree2Leaves2/
									if(isturf(A))
										var/Z = 0
										var/obj/Misc/Layer/L = new
										if(A.z == 1)
											Z = 2
										L.loc = locate(A.x,A.y,Z)
										for(var/turf/T in range(0,L))
											T.overlays += /obj/Misc/FireLarge/
										del(L)
										A.overlays += /obj/Misc/FireLarge/
										Dis = 1
									A.luminosity = 5
									A.OnFire = 1
									A.CreateSmoke()
									A.Burn(Dis)
									if(ismob(A))
										var/mob/M = A
										M.CheckFlamable()
	else
		src.overlays -= /obj/Misc/Fire/
		src.overlays -= /obj/Misc/FireLarge/
		return
	spawn(rand(25,30)) src.Burn(Dis)

/atom/MouseDrag(var/obj/Over_Object,var/turf/Turf_Start,var/obj/Over_Loc)
	if(ismob(src))
		var/mob/M = src
		if(usr.CanUseTK && usr.Function == "Interact" && usr.client.eye == usr && M.Sleeping == 0 && usr.Sleeping == 0 && usr.Sleep >= 0 && usr.Dead == 0 && usr.Fainted == 0)
			M.LastLoc = M.loc
			var/CanLift = 0
			var/CanResist = 0
			CanLift = prob(100 - M.Weight / 3)
			CanResist = prob(10 + M.Intelligence)
			usr.Sleep -= 0.1
			usr.Intelligence += 0.001
			if(CanLift && CanResist == 0)
				if(Over_Loc in range(1,M.LastLoc))
					M.UnderTK = usr
					M.overlays += /obj/Misc/SpellEffects/Dispel
					usr.overlays += /obj/Misc/SpellEffects/Dispel
					spawn(10)
						if(usr)
							usr.overlays -= /obj/Misc/SpellEffects/Dispel
						if(M)
							M.overlays -= /obj/Misc/SpellEffects/Dispel
					M.Move(Over_Loc,SOUTH)
					if(M)
						M.UnderTK = null
				else
					M.loc = M.LastLoc
	if(isobj(src))
		var/obj/O = src
		if(usr.CanUseTK && usr.Function == "Interact" && O.Type != "Sleep" && usr.Sleeping == 0 && usr.Sleep >= 0 && O.suffix == null && usr.Dead == 0 && usr.Fainted == 0)
			if(Over_Loc)
				if(Over_Loc.density == 0)
					O.LastLoc = O.loc
					var/CanLift = 0
					CanLift = prob(100 - O.Weight / 3)
					usr.Sleep -= 0.05
					usr.Intelligence += 0.001
					if(usr.client.eye != usr)
						usr.Sleep -= 0.05
					if(CanLift)
						if(Over_Loc in range(1,O.LastLoc))
							O.overlays += /obj/Misc/SpellEffects/Dispel
							usr.overlays += /obj/Misc/SpellEffects/Dispel
							spawn(10)
								if(usr)
									usr.overlays -= /obj/Misc/SpellEffects/Dispel
								if(O)
									O.overlays -= /obj/Misc/SpellEffects/Dispel
							O.Move(Over_Loc)
							for(var/atom/a in range(0,O))
								if(a.density)
									O.loc = O.LastLoc
								if(isobj(a))
									var/obj/Z = a
									if(Z.Type == "Hole" && Z.GoesTo)
										view(6,O) << "<font color = yellow>[O] falls down the Hole!<br>"
										O.loc = Z.GoesTo
						else
							O.loc = O.LastLoc
