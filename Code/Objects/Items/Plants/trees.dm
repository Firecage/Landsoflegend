/obj/Items/Plants/DeadTree2
	name = "Tree"
	icon_state = "trunk2"
	density = 1
	Type = "Tree"
	Fuel = 100
	opacity = 1
	desc = "This is a small tree, it can be cut down or stripped of leaves using various tools.<br>"

/obj/Items/Plants/DeadTree2/Click()
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		return
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.density)
				if(usr.Weapon)
					var/obj/W = usr.Weapon
					if(W.Type == "Hatchet")
						if(usr.Job == null)
							if(src.icon_state == "small stump")
								view(usr) << "<font color = yellow>[usr] hacks a large notch in the side of the stump!<br>"
								src.density = 0
								src.Rot()
								usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti / 3
								usr.GainStats(2.5)
								return
			if(src.opacity == 0)
				return
			if(usr.Weapon)
				var/obj/W = null
				var/CanDo = 0
				if(usr.Weapon)
					W = usr.Weapon
					if(W.Type == "Hatchet")
						CanDo = 1
					else
						W = null
				if(usr.Weapon2 && W == null)
					W = usr.Weapon2
					if(W.Type == "Hatchet")
						CanDo = 1
					else
						W = null
				if(CanDo && W)
					if(usr.Job == null)
						if(W.Dura <= 1)
							usr << "<font color = red>The [W] is Broken, you can not do this job!<br>"
							return
						view(usr) << "<font color=yellow>[usr] begins to chop away at the tree!<br>"
						W.Dura -= rand(0.5,1)
						usr.CheckWeaponDura(W)
						usr.Job = "CutTree"
						usr.CanMove = 0
						var/Time = 300 - usr.WoodCuttingSkill * 2
						if(Time <= 50)
							Time = 50
						spawn(Time)
							if(src)
								if(usr)
									if(src in range(1,usr))
										if(usr.Job == "CutTree" && src.opacity)
											usr.Job = null
											src.icon_state = "small stump"
											src.overlays = null
											src.opacity = 0
											for(var/turf/T in range(0,src))
												Tiles += T
											usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti
											usr.GainStats(3)
											var/obj/Items/Resources/FelledTree2/T = new
											var/DIR = rand(1,2)
											if(DIR == 1)
												T.loc = locate(src.x+1,src.y,src.z)
											if(DIR == 2)
												T.loc = locate(src.x-1,src.y,src.z)
											for(var/mob/M in range(0,T))
												var/WontHit = 0
												WontHit += M.Agility * 2
												if(M == usr)
													WontHit += usr.WoodCuttingSkill
												var/Misses = prob(WontHit)
												if(Misses)
													view(M) << "<font color = red>[M] dodges the falling Tree!<br>"
												else
													view(M) << "<font color = red>The tree falls on [M]!<br>"
													M.Skull -= 20
													M.Blood -= 30
													M.Bleed()
											usr.MovementCheck()

/obj/Items/Plants/DeadTree2/New()
	spawn(10)
		if(src.icon_state == "trunk2")
			src.overlays += /obj/Items/Plants/Branches/Tree2Branch1/
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)

/obj/Items/Plants/Tree2
	name = "Tree"
	icon_state = "trunk2"
	density = 1
	Type = "Tree"
	Fuel = 100
	opacity = 1
	desc = "This is a small tree, it can be cut down or stripped of leaves using various tools.<br>"

/obj/Items/Plants/Tree2/Click()
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		return
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.density)
				if(usr.Weapon)
					var/obj/W = usr.Weapon
					if(W.Type == "Hatchet")
						if(usr.Job == null)
							if(src.icon_state == "small stump")
								view(usr) << "<font color = yellow>[usr] hacks a large notch in the side of the stump!<br>"
								src.density = 0
								src.Rot()
								usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti / 3
								usr.GainStats(2.5)
								return
			if(src.opacity == 0)
				return
			var/obj/W = null
			var/CanDo = 0
			if(usr.Weapon)
				W = usr.Weapon
				if(W.Type == "Hatchet")
					CanDo = 1
				else
					W = null
			if(usr.Weapon2 && W == null)
				W = usr.Weapon2
				if(W.Type == "Hatchet")
					CanDo = 1
				else
					W = null
			if(CanDo && W)
				if(usr.Job == null)
					if(W.Dura <= 1)
						usr << "<font color = red>The [W] is Broken, you can not do this job!<br>"
						return
					view(usr) << "<font color=yellow>[usr] begins to chop away at the tree!<br>"
					W.Dura -= rand(0.5,1)
					usr.CheckWeaponDura(W)
					usr.Job = "CutTree"
					usr.CanMove = 0
					var/Time = 300 - usr.WoodCuttingSkill * 2
					if(Time <= 50)
						Time = 50
					spawn(Time)
						if(src && usr)
							if(src in range(1,usr))
								if(usr.Job == "CutTree" && src.opacity)
									usr.Job = null
									src.icon_state = "small stump"
									src.overlays = null
									src.opacity = 0
									for(var/turf/T in range(0,src))
										Tiles += T
									usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti
									usr.GainStats(3)
									var/obj/Items/Resources/FelledTree2/T = new
									var/DIR = rand(1,2)
									if(DIR == 1)
										T.loc = locate(src.x+1,src.y,src.z)
									if(DIR == 2)
										T.loc = locate(src.x-1,src.y,src.z)
									for(var/mob/M in range(0,T))
										var/WontHit = 0
										WontHit += M.Agility * 2
										if(M == usr)
											WontHit += usr.WoodCuttingSkill
										var/Misses = prob(WontHit)
										if(Misses)
											view(M) << "<font color = red>[M] dodges the falling Tree!<br>"
										else
											view(M) << "<font color = red>The tree falls on [M]!<br>"
											M.Skull -= 20
											M.Blood -= 30
											M.Bleed()
									usr.MovementCheck()

/obj/Items/Plants/Tree2/New()
	spawn(10)
		if(src.icon_state == "trunk2")
			src.overlays += /obj/Items/Plants/Branches/Tree2Branch1/
			src.overlays += /obj/Items/Plants/Branches/Tree2Leaves1/
			src.overlays += /obj/Items/Plants/Branches/Tree2Leaves2/
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)

/obj/Items/Plants/BurntTree2
	name = "Tree"
	icon_state = "burnt2"
	density = 1
	Type = "Tree"
	Fuel = 0
	opacity = 1

/obj/Items/Plants/BurntTree2/New()
	spawn(10)
		if(src.icon_state == "burnt2")
			src.overlays += /obj/Items/Plants/Branches/BurntTree2Branch1/
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)

/obj/Items/Plants/BurntTree1
	name = "Tree"
	icon_state = "burnt1"
	density = 1
	opacity = 1
	Type = "Tree"
	Fuel = 0

/obj/Items/Plants/BurntTree1/New()
	spawn(10)
		if(src.icon_state == "burnt1")
			src.overlays += /obj/Items/Plants/Branches/BurntTree1Branch1/
			src.overlays += /obj/Items/Plants/Branches/BurntTree1Branch2/
			src.overlays += /obj/Items/Plants/Branches/BurntTree1Branch3/
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)

/obj/Items/Plants/DeadTree1
	name = "Tree"
	icon_state = "trunk1"
	density = 1
	opacity = 1
	Type = "Tree"
	Fuel = 100
	desc = "This is a tree, it can be cut down or stripped of leaves using various tools.<br>"

/obj/Items/Plants/DeadTree1/Click()
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		return
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.density)
				if(usr.Weapon)
					var/obj/W = usr.Weapon
					if(W.Type == "Hatchet")
						if(usr.Job == null)
							if(src.icon_state == "big stump")
								view(usr) << "<font color = yellow>[usr] hacks a large notch in the side of the stump, soon it will rot and fall apart.<br>"
								src.density = 0
								src.Rot()
								usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti / 3
								usr.GainStats(2.5)
								return
			if(src.opacity == 0)
				return
			if(usr.Weapon)
				var/obj/W = null
				var/CanDo = 0
				if(usr.Weapon)
					W = usr.Weapon
					if(W.Type == "Hatchet")
						CanDo = 1
					else
						W = null
				if(usr.Weapon2 && W == null)
					W = usr.Weapon2
					if(W.Type == "Hatchet")
						CanDo = 1
					else
						W = null
				if(CanDo && W)
					if(usr.Job == null)
						if(W.Dura <= 1)
							usr << "<font color = red>The [W] is Broken, you can not do this job!<br>"
							return
						view(usr) << "<font color=yellow>[usr] begins to chop away at the tree!<br>"
						W.Dura -= rand(0.5,1)
						usr.CheckWeaponDura(W)
						usr.Job = "CutTree"
						usr.CanMove = 0
						var/Time = 300 - usr.WoodCuttingSkill * 2
						if(Time <= 50)
							Time = 50
						spawn(Time)
							if(src && usr)
								if(src in range(1,usr))
									if(usr.Job == "CutTree" && src.opacity)
										usr.Job = null
										src.icon_state = "big stump"
										src.overlays = null
										for(var/turf/T in range(0,src))
											Tiles += T
										src.opacity = 0
										usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti
										usr.GainStats(3)
										var/obj/Items/Resources/FelledTree/T = new
										var/DIR = rand(1,2)
										if(DIR == 1)
											T.loc = locate(src.x+1,src.y,src.z)
										if(DIR == 2)
											T.loc = locate(src.x-1,src.y,src.z)
										for(var/mob/M in range(0,T))
											var/WontHit = 0
											WontHit += M.Agility * 2
											if(M == usr)
												WontHit += usr.WoodCuttingSkill
											var/Misses = prob(WontHit)
											if(Misses)
												view(M) << "<font color = red>[M] dodges the falling Tree!<br>"
											else
												view(M) << "<font color = red>The tree falls on [M]!<br>"
												M.Skull -= 30
												M.Blood -= 40
												M.Bleed()
										usr.MovementCheck()

/obj/Items/Plants/DeadTree1/New()
	spawn(10)
		if(src.icon_state == "trunk1")
			src.overlays += /obj/Items/Plants/Branches/Tree1Branch1/
			src.overlays += /obj/Items/Plants/Branches/Tree1Branch2/
			src.overlays += /obj/Items/Plants/Branches/Tree1Branch3/
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)

/obj/Items/Plants/Tree1
	name = "Tree"
	icon_state = "trunk1"
	density = 1
	opacity = 1
	Type = "Tree"
	Fuel = 100
	desc = "This is a tree, it can be cut down or stripped of leaves using various tools.<br>"

/obj/Items/Plants/Tree1/Click()
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		return
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.density)
				if(usr.Weapon)
					var/obj/W = usr.Weapon
					if(W.Type == "Hatchet")
						if(usr.Job == null)
							if(src.icon_state == "big stump")
								view(usr) << "<font color = yellow>[usr] hacks a large notch in the side of the stump, soon it will rot and fall apart.<br>"
								src.density = 0
								src.Rot()
								usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti / 3
								usr.GainStats(2.5)
								return
			if(src.opacity == 0)
				return
			var/obj/W = null
			var/CanDo = 0
			if(usr.Weapon)
				W = usr.Weapon
				if(W.Type == "Hatchet")
					CanDo = 1
				else
					W = null
			if(usr.Weapon2 && W == null)
				W = usr.Weapon2
				if(W.Type == "Hatchet")
					CanDo = 1
				else
					W = null
			if(CanDo && W)
				if(usr.Job == null)
					if(W.Dura <= 1)
						usr << "<font color = red>The [W] is Broken, you can not do this job!<br>"
						return
					view(usr) << "<font color=yellow>[usr] begins to chop away at the tree!<br>"
					W.Dura -= rand(0.5,1)
					usr.CheckWeaponDura(W)
					usr.Job = "CutTree"
					usr.CanMove = 0
					var/Time = 300 - usr.WoodCuttingSkill * 2
					if(Time <= 50)
						Time = 50
					spawn(Time)
						if(src && usr)
							if(src in range(1,usr))
								if(usr.Job == "CutTree" && src.opacity)
									usr.Job = null
									src.icon_state = "big stump"
									src.overlays = null
									src.opacity = 0
									for(var/turf/T in range(0,src))
										Tiles += T
									usr.WoodCuttingSkill += usr.WoodCuttingSkillMulti
									usr.GainStats(3)
									var/obj/Items/Resources/FelledTree/T = new
									var/DIR = rand(1,2)
									if(DIR == 1)
										T.loc = locate(src.x+1,src.y,src.z)
									if(DIR == 2)
										T.loc = locate(src.x-1,src.y,src.z)
									for(var/mob/M in range(0,T))
										var/WontHit = 0
										WontHit += M.Agility * 2
										if(M == usr)
											WontHit += usr.WoodCuttingSkill
										var/Misses = prob(WontHit)
										if(Misses)
											view(M) << "<font color = red>[M] dodges the falling Tree!<br>"
										else
											view(M) << "<font color = red>The tree falls on [M]!<br>"
											M.Skull -= 40
											M.Blood -= 50
											M.Bleed()
									usr.MovementCheck()

/obj/Items/Plants/Tree1/New()
	spawn(10)
		if(src.icon_state == "trunk1")
			src.overlays += /obj/Items/Plants/Branches/Tree1Branch1/
			src.overlays += /obj/Items/Plants/Branches/Tree1Branch2/
			src.overlays += /obj/Items/Plants/Branches/Tree1Branch3/
			src.overlays += /obj/Items/Plants/Branches/Tree1Leaves1/
			src.overlays += /obj/Items/Plants/Branches/Tree1Leaves2/
			src.overlays += /obj/Items/Plants/Branches/Tree1Leaves3/
			src.overlays += /obj/Items/Plants/Branches/Tree1Leaves4/
			src.overlays += /obj/Items/Plants/Branches/Tree1Leaves5/
			src.overlays += /obj/Items/Plants/Branches/Tree1Leaves6/
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T in Tiles)
				del(src)
