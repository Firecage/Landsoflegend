/obj/HUD/Menus/Buildings
	icon = 'terrain.dmi'

/obj/HUD/Menus/Buildings/LargeBrickWall
	icon_state = "bulky brick wall"

/obj/HUD/Menus/Buildings/LargeBrickWall/Click()
	if(usr.Fainted)
		usr << "<font color =red>You have fainted and cant do that!<br>"
		return
	if(usr.Stunned)
		usr << "<font color =red>You are stunned and cant do that!<br>"
		return
	var/Arms = 1
	if(usr.LeftArm <= 25)
		Arms = 0
	if(usr.RightArm <= 25)
		Arms = 0
	if(Arms == 0)
		usr << "<font color =red>Your arms are too damaged!<br>"
		return
	if(usr.Dead == 0)
		if(usr.Job == null)
			var/Bricks = list()
			var/Num = 0
			var/Loc = usr.loc
			for(var/obj/Items/Resources/LargeBrick/P in usr)
				if(Num != 3)
					Num += 1
					Bricks += P
			if(Num == 3)
				view(usr) << "<font color=yellow>[usr] begins to construct a large brick wall from large bricks!<br>"
				usr.Job = "MakeBrickWall"
				usr.CanMove = 0
				var/Time = 350
				Time -= usr.MasonarySkill * 1.5
				Time -= usr.BuildingSkill * 1.5
				if(Time <= 75)
					Time = 75
				spawn(Time)
					if(usr)
						if(usr.loc == Loc)
							if(usr.Job == "MakeBrickWall")
								usr.Job = null
								usr.BuildingSkill += usr.BuildingSkillMulti
								usr.MasonarySkill += usr.MasonarySkillMulti
								usr.GainStats(3)
								usr << "<font color =green>You finish construction of a large brick wall!<br>"
								for(var/obj/I in Bricks)
									usr.Weight -= I.Weight
									del(I)
								for(var/turf/T in range(0,usr))
									T.Type = "Inside"
									T.icon_state = "bulky brick wall"
									T.density = 1
									T.opacity = 1
									T.Dura += 75
									T.AttachedKey = "[usr.key]"
									T.ManMade = 1
									T.Material = "Stone"
									T.Dura += usr.MasonarySkill
									T.Dura += usr.BuildingSkill
									T.desc = "Made by ([usr])[usr.name]"
									T.name = "Large Brick Wall"
									for(var/obj/Items/Misc/M in range(0,usr))
										if(M.loc != usr)
											if(M.density == 0 && M.suffix == null)
												M.loc = locate(0,0,0)
									for(var/obj/Items/Plants/P in range(0,usr))
										if(P.density == 0)
											P.loc = locate(0,0,0)
									Tiles += T
								usr.MovementCheck()
						else
							usr << "<font color=red>You moved from the position you were building at, you failed to construct a large brick wall!<br>"
							return
			else
				usr << "<font color =red>You need three large bricks to construct a large brick wall!<br>"
				return

/obj/HUD/Menus/Buildings/BrickWall
	icon_state = "brick wall"

/obj/HUD/Menus/Buildings/BrickWall/Click()
	if(usr.Fainted)
		usr << "<font color =red>You have fainted and cant do that!<br>"
		return
	if(usr.Stunned)
		usr << "<font color =red>You are stunned and cant do that!<br>"
		return
	var/Arms = 1
	if(usr.LeftArm <= 25)
		Arms = 0
	if(usr.RightArm <= 25)
		Arms = 0
	if(Arms == 0)
		usr << "<font color =red>Your arms are too damaged!<br>"
		return
	if(usr.Dead == 0)
		if(usr.Job == null)
			var/Bricks = list()
			var/Num = 0
			var/Loc = usr.loc
			for(var/obj/Items/Resources/Brick/P in usr)
				if(Num != 4)
					Num += 1
					Bricks += P
			if(Num == 4)
				view(usr) << "<font color=yellow>[usr] begins to construct a brick wall from bricks!<br>"
				usr.Job = "MakeBrickWall"
				usr.CanMove = 0
				var/Time = 300
				Time -= usr.MasonarySkill * 1.5
				Time -= usr.BuildingSkill * 1.5
				if(Time <= 75)
					Time = 75
				spawn(Time)
					if(usr)
						if(usr.loc == Loc)
							if(usr.Job == "MakeBrickWall")
								usr.Job = null
								usr.BuildingSkill += usr.BuildingSkillMulti
								usr.MasonarySkill += usr.MasonarySkillMulti
								usr.GainStats(3)
								usr << "<font color =green>You finish construction of a brick wall!<br>"
								for(var/obj/I in Bricks)
									usr.Weight -= I.Weight
									del(I)
								for(var/turf/T in range(0,usr))
									T.Type = "Inside"
									T.icon_state = "brick wall"
									T.density = 1
									T.opacity = 1
									T.Dura += 50
									T.AttachedKey = "[usr.key]"
									T.ManMade = 1
									T.Material = "Stone"
									T.Dura += usr.MasonarySkill
									T.Dura += usr.BuildingSkill
									T.desc = "Made by ([usr])[usr.name]"
									T.name = "Brick Wall"
									for(var/obj/Items/Misc/M in range(0,usr))
										if(M.loc != usr)
											if(M.density == 0 && M.suffix == null)
												M.loc = locate(0,0,0)
									for(var/obj/Items/Plants/P in range(0,usr))
										if(P.density == 0)
											P.loc = locate(0,0,0)
									Tiles += T
								usr.MovementCheck()
						else
							usr << "<font color=red>You moved from the position you were building at, you failed to construct a brick wall!<br>"
							return
			else
				usr << "<font color =red>You need four bricks to construct a brick wall!<br>"
				return

/obj/HUD/Menus/Buildings/StoneStairs
	icon_state = "stairs up"

/obj/HUD/Menus/Buildings/StoneStairs/Click()
	if(usr.Fainted)
		usr << "<font color =red>You have fainted and cant do that!<br>"
		return
	if(usr.Stunned)
		usr << "<font color =red>You are stunned and cant do that!<br>"
		return
	var/Arms = 1
	if(usr.LeftArm <= 25)
		Arms = 0
	if(usr.RightArm <= 25)
		Arms = 0
	if(Arms == 0)
		usr << "<font color =red>Your arms are too damaged!<br>"
		return
	if(usr.Dead == 0 && usr.z != 2)
		if(usr.Job == null)
			var/Bricks = list()
			var/Num = 0
			var/Loc = usr.loc
			for(var/obj/Items/Resources/LargeBrick/P in usr)
				if(Num != 4)
					Num += 1
					Bricks += P
			if(Num == 4)
				var/CanEnter = 0
				var/obj/Q = new
				var/Z
				if(usr.z == 1)
					Z = 2
				if(usr.z == 3)
					Z = 1
				Q.loc = locate(usr.x,usr.y,Z)
				for(var/turf/T2 in range(0,Q))
					if(T2.Dura == 0 && T2.density == 0)
						CanEnter = 1
					if(T2.icon_state == "clouds" && usr.z == 1)
						CanEnter = 1
				if(Q.x <= 20 && Q.y <= 20 && Q.z == 2)
					CanEnter = 0
				del(Q)
				if(CanEnter)
					view(usr) << "<font color=yellow>[usr] begins to construct a stairs from large bricks!<br>"
					usr.Job = "MakeStoneStair"
					usr.CanMove = 0
					var/Time = 300
					Time -= usr.MasonarySkill
					Time -= usr.BuildingSkill
					if(Time <= 75)
						Time = 75
					spawn(Time)
						if(usr)
							if(usr.loc == Loc)
								if(usr.Job == "MakeStoneStair")
									usr.Job = null
									usr.BuildingSkill += usr.BuildingSkillMulti
									usr.MasonarySkill += usr.MasonarySkillMulti
									usr.GainStats(3)
									usr << "<font color =green>You finish construction of a stairs!<br>"
									for(var/obj/I in Bricks)
										usr.Weight -= I.Weight
										del(I)
									var/obj/Misc/StairsUp/S = new
									S.loc = usr.loc
									S.Dura += usr.BuildingSkill
									S.Dura += usr.MasonarySkill
									var/obj/Q2 = new
									Q2.loc = locate(usr.x,usr.y,Z)
									for(var/turf/T3 in range(0,Q2))
										var/obj/Misc/StairsDown/S2 = new
										S2.loc = Q2.loc
										S2.Dura += usr.BuildingSkill
										S2.Dura += usr.MasonarySkill
										Tiles += T3
										for(var/obj/Misc/Hole/H in range(0,S2))
											del(H)
									del(Q2)
									for(var/turf/T in range(0,usr))
										Tiles += T
									usr.MovementCheck()
							else
								usr << "<font color=red>You moved from the position you were building at, you failed to construct a stone slab!<br>"
								return
				else
					usr << "<font color =red>Something above stops you from creating a stairs!<br>"
					return
			else
				usr << "<font color =red>You need four large brick to construct a stairs!<br>"
				return

/obj/HUD/Menus/Buildings/StoneSlab
	icon_state = "slab stone floor"

/obj/HUD/Menus/Buildings/StoneSlab/Click()
	if(usr.Fainted)
		usr << "<font color =red>You have fainted and cant do that!<br>"
		return
	if(usr.Stunned)
		usr << "<font color =red>You are stunned and cant do that!<br>"
		return
	var/Arms = 1
	if(usr.LeftArm <= 25)
		Arms = 0
	if(usr.RightArm <= 25)
		Arms = 0
	if(Arms == 0)
		usr << "<font color =red>Your arms are too damaged!<br>"
		return
	if(usr.Dead == 0)
		if(usr.Job == null)
			var/Bricks = list()
			var/Num = 0
			var/Loc = usr.loc
			for(var/obj/Items/Resources/LargeBrick/P in usr)
				if(Num != 1)
					Num += 1
					Bricks += P
			if(Num == 1)
				view(usr) << "<font color=yellow>[usr] begins to construct a stone slab from a large brick!<br>"
				usr.Job = "MakeStoneSlab"
				usr.CanMove = 0
				var/Time = 300
				Time -= usr.MasonarySkill * 1.5
				Time -= usr.BuildingSkill * 1.5
				if(Time <= 75)
					Time = 75
				spawn(Time)
					if(usr)
						if(usr.loc == Loc)
							if(usr.Job == "MakeStoneSlab")
								usr.Job = null
								usr.BuildingSkill += usr.BuildingSkillMulti
								usr.MasonarySkill += usr.MasonarySkillMulti
								usr.GainStats(3)
								usr << "<font color =green>You finish construction of a stone slab!<br>"
								for(var/obj/I in Bricks)
									usr.Weight -= I.Weight
									del(I)
								for(var/turf/T in range(0,usr))
									T.icon_state = "slab stone floor"
									T.name = "Stone Slab"
									T.Type = "Inside"
									T.density = 0
									T.AttachedKey = "[usr.key]"
									T.ManMade = 1
									T.Material = "Stone"
									T.desc = "Made by ([usr])[usr.name]"
									T.opacity = 0
									for(var/obj/Items/Misc/M in range(0,usr))
										if(M.loc != usr)
											if(M.density == 0 && M.suffix == null)
												M.loc = locate(0,0,0)
									for(var/obj/Items/Plants/P in range(0,usr))
										if(P.density == 0)
											P.loc = locate(0,0,0)
									Tiles += T
								usr.MovementCheck()
						else
							usr << "<font color=red>You moved from the position you were building at, you failed to construct a stone slab!<br>"
							return
			else
				usr << "<font color =red>You need one large brick to construct a stone slab!<br>"
				return

/obj/HUD/Menus/Buildings/WoodenWall
	icon_state = "wood wall"

/obj/HUD/Menus/Buildings/WoodenWall/Click()
	if(usr.Fainted)
		usr << "<font color =red>You have fainted and cant do that!<br>"
		return
	if(usr.Stunned)
		usr << "<font color =red>You are stunned and cant do that!<br>"
		return
	var/Arms = 1
	if(usr.LeftArm <= 25)
		Arms = 0
	if(usr.RightArm <= 25)
		Arms = 0
	if(Arms == 0)
		usr << "<font color =red>Your arms are too damaged!<br>"
		return
	if(usr.Dead == 0)
		if(usr.Job == null)
			var/Planks = list()
			var/Num = 0
			var/Loc = usr.loc
			for(var/obj/Items/Resources/Plank/P in usr)
				if(Num != 3)
					Num += 1
					Planks += P
			if(Num == 3)
				view(usr) << "<font color=yellow>[usr] begins to construct a wooden wall from planks!<br>"
				usr.Job = "MakeWoodWall"
				usr.CanMove = 0
				var/Time = 300
				Time -= usr.CarpentrySkill * 1.5
				Time -= usr.BuildingSkill * 1.5
				if(Time <= 75)
					Time = 75
				spawn(Time)
					if(usr)
						if(usr.loc == Loc)
							if(usr.Job == "MakeWoodWall")
								usr.Job = null
								usr.BuildingSkill += usr.BuildingSkillMulti
								usr.CarpentrySkill += usr.CarpentrySkillMulti
								usr.GainStats(2.5)
								usr << "<font color =green>You finish construction of a wooden wall!<br>"
								for(var/obj/I in Planks)
									usr.Weight -= I.Weight
									del(I)
								for(var/turf/T in range(0,usr))
									T.icon_state = "wood wall"
									T.density = 1
									T.opacity = 1
									T.Dura += 25
									T.Fuel = 100
									T.AttachedKey = "[usr.key]"
									T.ManMade = 1
									T.Type = "Inside"
									T.Material = "Wood"
									T.desc = "Made by ([usr])[usr.name]"
									T.Dura += usr.CarpentrySkill
									T.Dura += usr.BuildingSkill
									T.name = "Wooden Wall"
									for(var/obj/Items/Misc/M in range(0,usr))
										if(M.loc != usr)
											if(M.density == 0 && M.suffix == null)
												M.loc = locate(0,0,0)
									for(var/obj/Items/Plants/P in range(0,usr))
										if(P.density == 0)
											P.loc = locate(0,0,0)
									Tiles += T
								usr.MovementCheck()
						else
							usr << "<font color=red>You moved from the position you were building at, you failed to construct a wooden wall!<br>"
							return
			else
				usr << "<font color =red>You need three planks to construct a wall!<br>"
				return

/obj/HUD/Menus/Buildings/WoodenFloor
	icon_state = "wood floor"

/obj/HUD/Menus/Buildings/WoodenFloor/Click()
	if(usr.Fainted)
		usr << "<font color =red>You have fainted and cant do that!<br>"
		return
	if(usr.Stunned)
		usr << "<font color =red>You are stunned and cant do that!<br>"
		return
	var/Arms = 1
	if(usr.LeftArm <= 25)
		Arms = 0
	if(usr.RightArm <= 25)
		Arms = 0
	if(Arms == 0)
		usr << "<font color =red>Your arms are too damaged!<br>"
		return
	if(usr.Dead == 0)
		if(usr.Job == null)
			var/Planks = list()
			var/Num = 0
			var/Loc = usr.loc
			for(var/obj/Items/Resources/Plank/P in usr)
				if(Num != 3)
					Num += 1
					Planks += P
			if(Num == 3)
				view(usr) << "<font color=yellow>[usr] begins to construct a wooden floor from planks!<br>"
				usr.Job = "MakeWoodFloor"
				usr.CanMove = 0
				var/Time = 300
				Time -= usr.CarpentrySkill * 1.5
				Time -= usr.BuildingSkill * 1.5
				if(Time <= 75)
					Time = 75
				spawn(Time)
					if(usr)
						if(usr.loc == Loc)
							if(usr.Job == "MakeWoodFloor")
								usr.Job = null
								usr.BuildingSkill += usr.BuildingSkillMulti
								usr.CarpentrySkill += usr.CarpentrySkillMulti
								usr.GainStats(2.5)
								usr << "<font color =green>You finish construction of a wooden floor!<br>"
								for(var/obj/I in Planks)
									usr.Weight -= I.Weight
									del(I)
								for(var/turf/T in range(0,usr))
									T.icon_state = "wood floor"
									T.density = 0
									T.opacity = 0
									T.Fuel = 100
									T.AttachedKey = "[usr.key]"
									T.ManMade = 1
									T.Material = "Wood"
									T.Type = "Inside"
									T.desc = "Made by ([usr])[usr.name]"
									T.name = "Wooden Floor"
									for(var/obj/Items/Misc/M in range(0,usr))
										if(M.loc != usr)
											if(M.density == 0 && M.suffix == null)
												M.loc = locate(0,0,0)
									for(var/obj/Items/Plants/P in range(0,usr))
										if(P.density == 0)
											P.loc = locate(0,0,0)
									Tiles += T
								usr.MovementCheck()
						else
							usr << "<font color=red>You moved from the position you were building at, you failed to construct a wooden floor!<br>"
							return
			else
				usr << "<font color =red>You need three planks to construct a wooden floor!<br>"
				return
