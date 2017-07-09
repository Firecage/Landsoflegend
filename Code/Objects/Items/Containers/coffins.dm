/obj/Items/Containers/SandStoneCoffin
	icon = 'misc.dmi'
	icon_state = "sand coffin"
	Weight = 20
	suffix = "Stuck"
	WeightMax = 100
	density = 1
	desc = "This is a stone coffin, it can be used to store items in or dead bodies."
	Material = "SandStone"

/obj/Items/Containers/SandStoneCoffin/New()
	spawn(1)
		src.TreasureChest()

/obj/Items/Containers/SandStoneCoffin/Click()
	if(usr.Function == "Transfer")
		if(usr.Container)
			var/obj/C = usr.Container
			if(src.suffix == "Carried")
				if(src in C)
					if(C in range(1,usr))
						if(usr.Weight <= usr.WeightMax)
							src.loc = usr
							usr.Weight += src.Weight
							C.Weight -= src.Weight
							usr << "You moved [src] from [C] to your inventory!<br>"
							usr.DeleteInventoryMenu()
							if(usr.InvenUp)
								usr.CreateInventory()
							usr.CreateContainerContents(C)
							return
						else
							usr << "<b>You are carrying enough already!<br>"
							return
		if(src.suffix == "Carried")
			if(src in usr)
				if(usr.Container)
					var/obj/C = usr.Container
					if(C in range(1,usr))
						if(C.Weight <= C.WeightMax)
							usr.Weight -= src.Weight
							C.Weight += src.Weight
							src.loc = C
							usr << "You moved [src] from your inventory to [C]!<br>"
							usr.DeleteInventoryMenu()
							if(usr.InvenUp)
								usr.CreateInventory()
							usr.CreateContainerContents(C)
							return
						else
							usr << "<b>[C] is carrying enough already!<br>"
							return
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.Locked == 0)
				if(src.OpenState)
					src.icon_state = src.OpenState
				if(usr.InvenUp)
					usr.CreateInventory()
				usr.CreateContainerContents(src)
				usr.Container = src
				usr << "<b>You open [src]!<br>"
				return
			else
				usr << "<b>[src] is locked, you need to find a key or smash it open!<br>"
				return

/obj/Items/Containers/StoneCoffin
	icon = 'misc.dmi'
	icon_state = "stone coffin"
	Weight = 20
	WeightMax = 100
	OpenState = "stone coffin open"
	density = 1
	suffix = "Stuck"
	ClosedState = "stone coffin"
	desc = "This is a stone coffin, it can be used to store items in or dead bodies."
	Type = "Coffin"
	Material = "Stone"
	CanBeCrafted = 1

/obj/Items/Containers/StoneCoffin/New()
	spawn(1)
		src.TreasureChest()

/obj/Items/Containers/StoneCoffin/Click()
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
			if(BrickNum == 3 && O.Type == "LargeBrick")
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
								if(BrickNum != 3)
									BrickNum += 1
									Bricks += B
							if(BrickNum == 3 && O && usr.Job == "CreateStoneCoffin")
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
	if(usr.Function == "Transfer")
		if(usr.Container)
			var/obj/C = usr.Container
			if(src.suffix == "Carried")
				if(src in C)
					if(C in range(1,usr))
						if(usr.Weight <= usr.WeightMax)
							src.loc = usr
							usr.Weight += src.Weight
							C.Weight -= src.Weight
							usr << "You moved [src] from [C] to your inventory!<br>"
							usr.DeleteInventoryMenu()
							if(usr.InvenUp)
								usr.CreateInventory()
							usr.CreateContainerContents(C)
							return
						else
							usr << "<b>You are carrying enough already!<br>"
							return
		if(src.suffix == "Carried")
			if(src in usr)
				if(usr.Container)
					var/obj/C = usr.Container
					if(C in range(1,usr))
						if(C.Weight <= C.WeightMax)
							usr.Weight -= src.Weight
							C.Weight += src.Weight
							src.loc = C
							usr << "You moved [src] from your inventory to [C]!<br>"
							usr.DeleteInventoryMenu()
							if(usr.InvenUp)
								usr.CreateInventory()
							usr.CreateContainerContents(C)
							return
						else
							usr << "<b>[C] is carrying enough already!<br>"
							return
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.Locked == 0)
				if(src.OpenState)
					src.icon_state = src.OpenState
				if(usr.InvenUp)
					usr.CreateInventory()
				usr.CreateContainerContents(src)
				usr.Container = src
				usr << "<b>You open [src]!<br>"
				return
			else
				usr << "<b>[src] is locked, you need to find a key or smash it open!<br>"
				return
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
					if(usr.Dead == 0)
						view(usr) << "<b>[usr] starts pulling [src]<br>"
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

