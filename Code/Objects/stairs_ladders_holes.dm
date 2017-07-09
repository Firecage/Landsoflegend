/obj/Misc/MetalLadderUp
	name = "Metal Ladder"
	icon = 'terrain.dmi'
	icon_state = "metal ladder"
	suffix = "Stuck"

/obj/Misc/MetalLadderUp/New()
	spawn(1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 1)
		if(src.z == 3)
			src.GoesTo = locate(src.x,src.y,src.z - 2)

/obj/Misc/MetalLadderUp/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			view(usr) << "<font color = yellow>[usr] climbs up [src]!<br>"
			usr.loc = src.GoesTo

/obj/Misc/SandStoneStairsUp
	name = "Stairs"
	icon = 'terrain.dmi'
	icon_state = "sand stairs up"
	suffix = "Stuck"

/obj/Misc/SandStoneStairsUp/New()
	spawn(1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 1)
		if(src.z == 3)
			src.GoesTo = locate(src.x,src.y,src.z - 2)

/obj/Misc/SandStoneStairsUp/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0
	if(usr.Function == "Combat" && src.suffix == "Stuck" && usr.Job == null)
		if(usr in range(1,src))
			if(usr.CantDoTask)
				usr << "<font color = red>Cant attack that for a while!<br>"
				return
			view(usr) << "<font color = red>[usr] begins an attempt at breaking the [src]!<br>"
			usr.Job = "SmashStair"
			usr.CanMove = 0
			usr.CantDoTask = 1
			spawn(150)
				if(usr)
					usr.CantDoTask = 0
			var/LOC = usr.loc
			var/Time = 300 - usr.Agility / 2
			if(Time <= 50)
				Time = 50
			spawn(Time)
				if(usr && src && usr.loc == LOC && usr.Job == "SmashStair" && src.suffix == "Stuck")
					var/DMG = usr.Strength
					var/Holding = 0
					if(usr.Weapon)
						Holding += 1
						var/obj/W = usr.Weapon
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon2 == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(usr.Weapon2)
						Holding += 2
						var/obj/W = usr.Weapon2
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(Holding == 2)
						DMG = DMG / 1.5
					usr.DetermineWeaponSkill()
					if(usr.CurrentSkillLevel)
						DMG = DMG + usr.CurrentSkillLevel / 4
					usr.Job = null
					usr.MovementCheck()
					var/WontDamage = 75 - DMG
					var/CantDamage = prob(WontDamage)
					if(DMG >= 0 && CantDamage != 1)
						src.Dura -= DMG
						if(src.Dura <= 0)
							range(src) << "<font color = red>[src] begins to crumble and fall away as [usr] smashes it!<br>"
							var/obj/Z = new
							if(src.z == 1)
								Z.loc = locate(src.x,src.y,2)
							if(src.z == 3)
								Z.loc = locate(src.x,src.y,1)
							for(var/obj/Misc/StairsDown/S in range(0,Z))
								var/obj/Misc/Hole/H = new
								H.loc = S.loc
								del(S)
							del(Z)
							del(src)
						else
							range(src) << "<font color = red>[src] makes a loud noise as [usr] damages it!<br>"
						return
					else
						range(src) << "<font color = red>[src] makes a loud noise as [usr] tried to damage it!<br>"
						return
				else
					if(usr)
						usr.MovementCheck()
			return

/obj/Misc/StairsUp
	name = "Stairs"
	icon = 'terrain.dmi'
	icon_state = "stairs up"
	suffix = "Stuck"
	Dura = 300

/obj/Misc/StairsUp/New()
	spawn(1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 1)
		if(src.z == 3)
			src.GoesTo = locate(src.x,src.y,src.z - 2)

/obj/Misc/StairsUp/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0
	if(usr.Function == "Combat" && src.suffix == "Stuck" && usr.Job == null)
		if(usr in range(1,src))
			if(usr.CantDoTask)
				usr << "<font color = red>Cant attack that for a while!<br>"
				return
			view(usr) << "<font color = red>[usr] begins an attempt at breaking the [src]!<br>"
			usr.Job = "SmashStair"
			usr.CanMove = 0
			usr.CantDoTask = 1
			spawn(150)
				if(usr)
					usr.CantDoTask = 0
			var/LOC = usr.loc
			var/Time = 300 - usr.Agility / 2
			if(Time <= 50)
				Time = 50
			spawn(Time)
				if(usr && src && usr.loc == LOC && usr.Job == "SmashStair" && src.suffix == "Stuck")
					var/DMG = usr.Strength
					var/Holding = 0
					if(usr.Weapon)
						Holding += 1
						var/obj/W = usr.Weapon
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon2 == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(usr.Weapon2)
						Holding += 2
						var/obj/W = usr.Weapon2
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(Holding == 2)
						DMG = DMG / 1.5
					usr.DetermineWeaponSkill()
					if(usr.CurrentSkillLevel)
						DMG = DMG + usr.CurrentSkillLevel / 4
					usr.Job = null
					usr.MovementCheck()
					var/WontDamage = 75 - DMG
					var/CantDamage = prob(WontDamage)
					if(DMG >= 0 && CantDamage != 1)
						src.Dura -= DMG
						if(src.Dura <= 0)
							range(src) << "<font color = red>[src] begins to crumble and fall away as [usr] smashes it!<br>"
							var/obj/Z = new
							if(src.z == 1)
								Z.loc = locate(src.x,src.y,2)
							if(src.z == 3)
								Z.loc = locate(src.x,src.y,1)
							for(var/obj/Misc/StairsDown/S in range(0,Z))
								var/obj/Misc/Hole/H = new
								H.loc = S.loc
								del(S)
							del(Z)
							del(src)
						else
							range(src) << "<font color = red>[src] makes a loud noise as [usr] damages it!<br>"
						return
					else
						range(src) << "<font color = red>[src] makes a loud noise as [usr] tried to damage it!<br>"
						return
				else
					if(usr)
						usr.MovementCheck()
			return

/obj/Misc/SewerGrate
	name = "Sewer Grate"
	icon = 'terrain.dmi'
	icon_state = "sewer entrance"
	Type = "Sewer"
	suffix = "Stuck"

/obj/Misc/SewerGrate/New()
	spawn(1)
		if(src.z == 2)
			src.GoesTo = locate(src.x,src.y,src.z - 1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 2)

/obj/Misc/SewerGrate/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			view(usr) << "<font color = yellow>[usr] lifts up the [src] and climbs down!<br>"
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0

/obj/Misc/HoleUp
	name = "Hole"
	icon = 'terrain.dmi'
	icon_state = "hole2"
	suffix = "Stuck"

/obj/Misc/HoleUp/New()
	spawn(1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 1)
		if(src.z == 3)
			src.GoesTo = locate(src.x,src.y,src.z - 2)

/obj/Misc/HoleUp/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			usr.loc = src.GoesTo

/obj/Misc/HoleDown
	name = "Hole"
	icon = 'terrain.dmi'
	icon_state = "hole"
	suffix = "Stuck"

/obj/Misc/HoleDown/New()
	spawn(1)
		if(src.z == 2)
			src.GoesTo = locate(src.x,src.y,src.z - 1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 2)

/obj/Misc/HoleDown/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0

/obj/Misc/Hole
	name = "Hole"
	icon = 'Hole.dmi'
	icon_state = "hole"
	suffix = "Stuck"
	density = 1
	Type = "Hole"

/obj/Misc/Hole/New()
	spawn(1)
		if(src.z == 2)
			src.GoesTo = locate(src.x,src.y,src.z - 1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 2)

/obj/Misc/Hole/Click()
	if(src in range(1,usr))
		if(usr.Dead)
			if(src in range(1,usr))
				usr.loc = src.GoesTo
		if(usr.Function == "Interact" && usr.Job == null)
			if(usr.Ref)
				var/obj/O = usr.Ref
				if(O.Type != "Shovel")
					if(O.Type != "LargeBrick")
						usr.DeleteInventoryMenu()
						if(usr.InvenUp)
							usr.InvenUp = 0
						usr.ResetButtons()
						usr << "<font color = red>You need Four Large Bricks in order to create stone stairs!<br>"
						return
					var/BrickNum = 0
					var/Bricks = list()
					for(var/obj/Items/Resources/LargeBrick/B in usr)
						if(BrickNum != 4)
							BrickNum += 1
							Bricks += B
					if(BrickNum != 4)
						usr << "<font color = red>You need Four Large Bricks in order to create stone stairs!<br>"
						return
					if(BrickNum == 4 && O.Type == "LargeBrick")
						var/LOC = usr.loc
						usr.Job = "CreateStoneStair"
						usr.CanMove = 0
						var/Time = 300 - usr.MasonarySkill * 1.5 - usr.Strength / 2 - usr.Intelligence
						if(Time <= 50)
							Time = 50
						usr.DeleteInventoryMenu()
						if(usr.InvenUp)
							usr.InvenUp = 0
						usr.ResetButtons()
						for(var/obj/HUD/B in usr.client.screen)
							if(B.Type == "Inventory")
								B.icon_state = "inv off"
						view(usr) << "<font color = yellow>[usr] begins to contruct the Large Bricks into a stone stairs!<br>"
						spawn(Time)
							if(usr)
								if(Bricks && usr.loc == LOC)
									BrickNum = 0
									Bricks = null
									Bricks = list()
									for(var/obj/Items/Resources/LargeBrick/B in usr)
										if(BrickNum != 4)
											BrickNum += 1
											Bricks += B
									if(BrickNum == 4 && O && usr.Job == "CreateStoneStair")
										var/Fail = prob(50 - usr.MasonarySkill - usr.Strength / 4 - usr.Intelligence / 2)
										usr.Job = null
										usr.MovementCheck()
										if(Fail)
											view(usr) << "<font color = yellow>[usr] fails at crafting a stone stairs!<br>"
											for(var/obj/I in Bricks)
												if(BrickNum != 0)
													BrickNum -= 1
													usr.Weight -= I.Weight
													del(I)
											usr.MasonarySkill += usr.MasonarySkillMulti / 2
											usr.BuildingSkill += usr.BuildingSkillMulti / 2
											usr.GainStats(3,"Yes")
											return
										var/obj/Misc/StairsDown/S = new
										S.loc = src.loc
										S.Dura += usr.BuildingSkill
										S.Dura += usr.MasonarySkill
										var/obj/X = new
										if(S.z == 1)
											X.loc = locate(S.x,S.y,3)
										if(S.z == 2)
											X.loc = locate(S.x,S.y,1)
										var/CanPlace = 1
										for(var/obj/Q in X.loc)
											if(Q.GoesTo)
												CanPlace = 0
										if(CanPlace)
											var/obj/Misc/StairsUp/D = new
											D.loc = X.loc
										del(X)
										for(var/obj/I in Bricks)
											if(BrickNum != 0)
												BrickNum -= 1
												usr.Weight -= I.Weight
												del(I)
										usr.MasonarySkill += usr.MasonarySkillMulti
										usr.BuildingSkill += usr.BuildingSkillMulti
										usr.GainStats(2,"Yes")
										view(usr) << "<font color = yellow>[usr] finishes creating a stone stairs!<br>"
										del(src)
										return
									else
										usr << "<font color = red>Large Bricks could not be found in your inventory, crafting failed!<br>"
										usr.Job = null
										usr.MovementCheck()
										return
								else
									usr << "<font color = red>Large Bricks could not be found in your inventory, or you moved while creating the item. Crafting failed!<br>"
									usr.Job = null
									usr.MovementCheck()
									return
						return
		if(usr.Function == "Interact")
			switch(alert("Climb down Hole or Fill in?",,"Cancel","Climb Down","Fill"))
				if("Climb Down")
					if(src in range(1,usr))
						if(usr.Fainted == 0 && usr.Stunned == 0)
							view(6,usr) << "<font color = yellow>[usr] climbs down the Hole carefully.<br>"
							usr.loc = src.GoesTo
						return
				if("Fill")
					if(usr.Job == "Fill")
						return
					var/obj/O = null
					if(usr.Ref)
						O = usr.Ref
					var/Dig = 0
					if(O)
						if(O.Type == "Shovel")
							Dig = 1
					if(usr.Race == "Ratling")
						Dig = 1
					if(Dig)
						if(src in range(1,usr))
							view() << "<font color=yellow>[usr] begins to fill in the Hole!<br>"
							usr.Job = "Fill"
							usr.CanMove = 0
							var/Time = 300 - usr.MiningSkill * 2
							if(Time <= 50)
								Time = 50
							spawn(Time)
								if(usr)
									if(src in range(1,usr))
										if(usr.Job == "Fill" && usr.CantDoTask == 0)
											usr.Job = null
											usr.MiningSkill += usr.MiningSkillMulti / 2
											usr.GainStats(3)
											view() << "<font color=yellow>[usr] finishes filling in the Hole!<br>"
											usr.MovementCheck()
											if(O)
												O.Dura -= rand(0.5,1)
												usr.CheckWeaponDura(O)
											usr.CheckHole(src,"Fill")
											del(src)
					else
						usr << "<font color = red>You'll need to Interact with a Shovel to fill this Hole in!<br>"
						return

/obj/Misc/SandStoneStairsDown
	name = "Stairs"
	icon = 'terrain.dmi'
	icon_state = "sand stairs down"
	suffix = "Stuck"

/obj/Misc/SandStoneStairsDown/New()
	spawn(1)
		if(src.z == 2)
			src.GoesTo = locate(src.x,src.y,src.z - 1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 2)

/obj/Misc/SandStoneStairsDown/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0
	if(usr.Function == "Combat" && src.suffix == "Stuck" && usr.Job == null)
		if(usr in range(1,src))
			if(usr.CantDoTask)
				usr << "<font color = red>Cant attack that for a while!<br>"
				return
			view(usr) << "<font color = red>[usr] begins an attempt at breaking the [src]!<br>"
			usr.Job = "SmashStair"
			usr.CanMove = 0
			usr.CantDoTask = 1
			spawn(150)
				if(usr)
					usr.CantDoTask = 0
			var/LOC = usr.loc
			var/Time = 300 - usr.Agility / 2
			if(Time <= 50)
				Time = 50
			spawn(Time)
				if(usr && src && usr.loc == LOC && usr.Job == "SmashStair" && src.suffix == "Stuck")
					var/DMG = usr.Strength
					var/Holding = 0
					if(usr.Weapon)
						Holding += 1
						var/obj/W = usr.Weapon
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon2 == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(usr.Weapon2)
						Holding += 2
						var/obj/W = usr.Weapon2
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(Holding == 2)
						DMG = DMG / 1.5
					usr.DetermineWeaponSkill()
					if(usr.CurrentSkillLevel)
						DMG = DMG + usr.CurrentSkillLevel / 4
					usr.Job = null
					usr.MovementCheck()
					var/WontDamage = 75 - DMG
					var/CantDamage = prob(WontDamage)
					if(DMG >= 0 && CantDamage != 1)
						src.Dura -= DMG
						if(src.Dura <= 0)
							range(src) << "<font color = red>[src] begins to crumble and fall away as [usr] smashes it!<br>"
							var/obj/Z = new
							if(src.z == 1)
								Z.loc = locate(src.x,src.y,2)
							if(src.z == 3)
								Z.loc = locate(src.x,src.y,1)
							for(var/obj/Misc/StairsDown/S in range(0,Z))
								var/obj/Misc/Hole/H = new
								H.loc = S.loc
								del(S)
							del(Z)
							del(src)
						else
							range(src) << "<font color = red>[src] makes a loud noise as [usr] damages it!<br>"
						return
					else
						range(src) << "<font color = red>[src] makes a loud noise as [usr] tried to damage it!<br>"
						return
				else
					if(usr)
						usr.MovementCheck()
			return

/obj/Misc/StairsDown
	name = "Stairs"
	icon = 'terrain.dmi'
	icon_state = "stairs down"
	suffix = "Stuck"
	Dura = 300

/obj/Misc/StairsDown/New()
	spawn(1)
		if(src.z == 2)
			src.GoesTo = locate(src.x,src.y,src.z - 1)
		if(src.z == 1)
			src.GoesTo = locate(src.x,src.y,src.z + 2)

/obj/Misc/StairsDown/Click()
	if(usr.Dead)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
	if(usr.Function == "Interact" && usr.Fainted == 0)
		if(src in range(1,usr))
			usr.loc = src.GoesTo
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0
	if(usr.Function == "Combat" && src.suffix == "Stuck" && usr.Job == null)
		if(usr in range(1,src))
			if(usr.CantDoTask)
				usr << "<font color = red>Cant attack that for a while!<br>"
				return
			view(usr) << "<font color = red>[usr] begins an attempt at breaking the [src]!<br>"
			usr.Job = "SmashStair"
			usr.CanMove = 0
			usr.CantDoTask = 1
			spawn(150)
				if(usr)
					usr.CantDoTask = 0
			var/LOC = usr.loc
			var/Time = 300 - usr.Agility / 2
			if(Time <= 50)
				Time = 50
			spawn(Time)
				if(usr && src && usr.loc == LOC && usr.Job == "SmashStair" && src.suffix == "Stuck")
					var/DMG = usr.Strength
					var/Holding = 0
					if(usr.Weapon)
						Holding += 1
						var/obj/W = usr.Weapon
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon2 == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(usr.Weapon2)
						Holding += 2
						var/obj/W = usr.Weapon2
						if(W.ObjectTag == "Weapon")
							DMG += W.Weight / 2
							DMG += rand(W.Dura / 2,W.Dura)
							W.Dura -= rand(0.1,2)
							if(W.ObjectType == "Blunt")
								DMG += 10
							if(W.TwoHander && usr.Weapon == null)
								DMG += W.Weight / 2
							usr.CheckWeaponDura(W)
					if(Holding == 2)
						DMG = DMG / 1.5
					usr.DetermineWeaponSkill()
					if(usr.CurrentSkillLevel)
						DMG = DMG + usr.CurrentSkillLevel / 4
					usr.Job = null
					usr.MovementCheck()
					var/WontDamage = 75 - DMG
					var/CantDamage = prob(WontDamage)
					if(DMG >= 0 && CantDamage != 1)
						src.Dura -= DMG
						if(src.Dura <= 0)
							range(src) << "<font color = red>[src] begins to crumble and fall away as [usr] smashes it!<br>"
							var/obj/Z = new
							if(src.z == 1)
								Z.loc = locate(src.x,src.y,3)
							if(src.z == 3)
								Z.loc = locate(src.x,src.y,2)
							for(var/obj/Misc/StairsUp/S in range(0,Z))
								del(S)
							var/obj/Misc/Hole/H = new
							H.loc = src.loc
							del(Z)
							del(src)
						else
							range(src) << "<font color = red>[src] makes a loud noise as [usr] damages it!<br>"
						return
					else
						range(src) << "<font color = red>[src] makes a loud noise as [usr] tried to damage it!<br>"
						return
				else
					if(usr)
						usr.MovementCheck()
			return