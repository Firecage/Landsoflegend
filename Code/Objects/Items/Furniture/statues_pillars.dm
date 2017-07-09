/obj/Items/Furniture/Misc/Statues

/obj/Items/Furniture/Misc/Statues/StatueBase
	icon = 'misc.dmi'
	icon_state = "statue base"
	Weight = 70
	density = 1
	suffix = "Stuck"

/obj/Items/Furniture/Misc/Statues/StatueKing
	icon = 'misc.dmi'
	icon_state = "statue king"
	Weight = 70
	density = 1
	suffix = "Stuck"

/obj/Items/Furniture/Misc/Statues/StatueHero
	icon = 'misc.dmi'
	icon_state = "statue hero"
	Weight = 70
	density = 1
	suffix = "Stuck"

/obj/Items/Furniture/Pillars
	suffix = "Stuck"

/obj/Items/Furniture/Pillars/SmallPillar1
	name = "Pillar"
	icon = 'misc.dmi'
	icon_state = "p small1"
	Material = "Stone"
	CanBeCrafted = 1
	opacity = 1

/obj/Items/Furniture/Pillars/SmallPillar1/Click()
	if(usr.Job == null && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Type != "LargeBrick")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Three Large Bricks in order to create this item!<br>"
				return
			var/BrickNum = 0
			var/Bricks = list()
			for(var/obj/Items/Resources/LargeBrick/B in usr)
				if(BrickNum != 3)
					BrickNum += 1
					Bricks += B
			if(BrickNum != 3)
				usr << "<font color = red>You need Three Large Bricks in order to create this item!<br>"
				return
			if(BrickNum == 5 && O.Type == "LargeBrick")
				var/LOC = usr.loc
				usr.Job = "CreateStonePillar"
				usr.CanMove = 0
				var/Time = 200 - usr.MasonarySkill * 1.5 - usr.Strength / 2 - usr.Intelligence
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to contruct the Large Bricks into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Bricks && usr.loc == LOC)
							BrickNum = 0
							Bricks = null
							Bricks = list()
							for(var/obj/Items/Resources/LargeBrick/B in usr)
								if(BrickNum != 3)
									BrickNum += 1
									Bricks += B
							if(BrickNum == 3 && O && usr.Job == "CreateStonePillar")
								var/Fail = prob(50 - usr.MasonarySkill - usr.Strength / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									for(var/obj/I in Bricks)
										if(BrickNum != 0)
											BrickNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.MasonarySkill += usr.MasonarySkillMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.MasonarySkill * 2
								W.suffix = null
								for(var/obj/I in Bricks)
									if(BrickNum != 0)
										BrickNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.MasonarySkill += usr.MasonarySkillMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
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
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		if(src in range(1,usr))
			var/Known = 0
			for(var/obj/Items/F in usr.CreateList)
				if(F.type == src.type)
					Known = 1
			if(Known == 0)
				if(src.CanBeCrafted)
					var/obj/W = new src.type()
					W.layer = 100
					usr.CreateList += W
					usr << "<font color = blue>You take a good look at the [src] and decide that, if needed, you could create one!<br>"
				else
					usr << "<font color = red>You take a good look at the [src] but have no idea how to create one...<br>"
		return

/obj/Items/Furniture/Pillars/SmallPillar2
	name = "Pillar"
	icon = 'misc.dmi'
	icon_state = "p small2"
	Material = "Stone"
	CanBeCrafted = 1
	opacity = 1

/obj/Items/Furniture/Pillars/SmallPillar2/Click()
	if(usr.Job == null && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Type != "LargeBrick")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Three Large Bricks in order to create this item!<br>"
				return
			var/BrickNum = 0
			var/Bricks = list()
			for(var/obj/Items/Resources/LargeBrick/B in usr)
				if(BrickNum != 3)
					BrickNum += 1
					Bricks += B
			if(BrickNum != 3)
				usr << "<font color = red>You need Three Large Bricks in order to create this item!<br>"
				return
			if(BrickNum == 5 && O.Type == "LargeBrick")
				var/LOC = usr.loc
				usr.Job = "CreateStonePillar"
				usr.CanMove = 0
				var/Time = 200 - usr.MasonarySkill * 1.5 - usr.Strength / 2 - usr.Intelligence
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to contruct the Large Bricks into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Bricks && usr.loc == LOC)
							BrickNum = 0
							Bricks = null
							Bricks = list()
							for(var/obj/Items/Resources/LargeBrick/B in usr)
								if(BrickNum != 3)
									BrickNum += 1
									Bricks += B
							if(BrickNum == 3 && O && usr.Job == "CreateStonePillar")
								var/Fail = prob(50 - usr.MasonarySkill - usr.Strength / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									for(var/obj/I in Bricks)
										if(BrickNum != 0)
											BrickNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.MasonarySkill += usr.MasonarySkillMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.MasonarySkill * 2
								W.suffix = null
								for(var/obj/I in Bricks)
									if(BrickNum != 0)
										BrickNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.MasonarySkill += usr.MasonarySkillMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
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
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		if(src in range(1,usr))
			var/Known = 0
			for(var/obj/Items/F in usr.CreateList)
				if(F.type == src.type)
					Known = 1
			if(Known == 0)
				if(src.CanBeCrafted)
					var/obj/W = new src.type()
					W.layer = 100
					usr.CreateList += W
					usr << "<font color = blue>You take a good look at the [src] and decide that, if needed, you could create one!<br>"
				else
					usr << "<font color = red>You take a good look at the [src] but have no idea how to create one...<br>"
		return

/obj/Items/Furniture/Pillars/LargePillar
	suffix = "Stuck"

/obj/Items/Furniture/Pillars/LargePillar/LargePillarBottom
	name = "Stone Pillar"
	icon = 'misc.dmi'
	icon_state = "P Bottom"
	Material = "Stone"
	CanBeCrafted = 1
	density = 1
	opacity = 1

/obj/Items/Furniture/Pillars/LargePillar/LargePillarBottom/New()
	src.overlays += /obj/Items/Furniture/Pillars/LargePillar/LPM/
	src.overlays += /obj/Items/Furniture/Pillars/LargePillar/LPT/

/obj/Items/Furniture/Pillars/LargePillar/LargePillarBottom/Click()
	if(usr.Job == null && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Type != "LargeBrick")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Five Large Bricks in order to create this item!<br>"
				return
			var/BrickNum = 0
			var/Bricks = list()
			for(var/obj/Items/Resources/LargeBrick/B in usr)
				if(BrickNum != 5)
					BrickNum += 1
					Bricks += B
			if(BrickNum != 5)
				usr << "<font color = red>You need Five Large Bricks in order to create this item!<br>"
				return
			if(BrickNum == 5 && O.Type == "LargeBrick")
				var/LOC = usr.loc
				usr.Job = "CreateStoneCoffin"
				usr.CanMove = 0
				var/Time = 200 - usr.MasonarySkill * 1.5 - usr.Strength / 2 - usr.Intelligence
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to contruct the Large Bricks into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Bricks && usr.loc == LOC)
							BrickNum = 0
							Bricks = null
							Bricks = list()
							for(var/obj/Items/Resources/LargeBrick/B in usr)
								if(BrickNum != 5)
									BrickNum += 1
									Bricks += B
							if(BrickNum == 5 && O && usr.Job == "CreateStoneCoffin")
								var/Fail = prob(50 - usr.MasonarySkill - usr.Strength / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									for(var/obj/I in Bricks)
										if(BrickNum != 0)
											BrickNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.MasonarySkill += usr.MasonarySkillMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.MasonarySkill * 2
								W.suffix = null
								for(var/obj/I in Bricks)
									if(BrickNum != 0)
										BrickNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.MasonarySkill += usr.MasonarySkillMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
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
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		if(src in range(1,usr))
			var/Known = 0
			for(var/obj/Items/F in usr.CreateList)
				if(F.type == src.type)
					Known = 1
			if(Known == 0)
				if(src.CanBeCrafted)
					var/obj/W = new src.type()
					W.layer = 100
					usr.CreateList += W
					usr << "<font color = blue>You take a good look at the [src] and decide that, if needed, you could create one!<br>"
				else
					usr << "<font color = red>You take a good look at the [src] but have no idea how to create one...<br>"
		return

/obj/Items/Furniture/Pillars/LargePillar/LPM
	name = "Stone Pillar"
	icon = 'misc.dmi'
	icon_state = "P Middle"
	layer = 8
	pixel_y = 32

/obj/Items/Furniture/Pillars/LargePillar/LargePillarBroken
	name = "Stone Pillar"
	icon = 'misc.dmi'
	icon_state = "P broken"
	layer = 8

/obj/Items/Furniture/Pillars/LargePillar/LargePillarBroken2
	name = "Stone Pillar"
	icon = 'misc.dmi'
	icon_state = "P ground"
	density = 1

/obj/Items/Furniture/Pillars/LargePillar/LPT
	name = "Stone Pillar"
	icon = 'misc.dmi'
	icon_state = "P Top"
	layer = 8
	pixel_y = 64
