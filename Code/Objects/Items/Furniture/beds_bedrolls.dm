/obj/Items/Furniture/Misc/BedRoll
	icon = 'tools.dmi'
	icon_state = "bed roll"
	Weight = 5
	Fuel = 25
	Type = "Sleep"

/obj/Items/Furniture/Misc/BedRoll/Click()
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
		if(src.suffix)
			usr << "<font color = red>Drop this item first before using it!<br>"
			return
		if(src in range(1,usr))
			if(usr.Sleeping == 0)
				if(usr.Dead)
					return
				if(usr.Fainted)
					return
				if(usr.Stunned)
					return
				if(usr.Weapon)
					usr << "<font color = red>You wont be able to sleep with a [usr.Weapon] on!!<br>"
					return
				if(usr.Weapon2)
					usr << "<font color = red>You wont be able to sleep with a [usr.Weapon2] on!!<br>"
				for(var/obj/Items/Armour/A in usr)
					if(A.suffix == "Equip" && A.DefenceType == "Plate")
						usr << "<font color = red>You wont be able to sleep with Plate Armour on!<br>"
						return
				usr.ResetButtons()
				usr.Function = null
				usr.loc = src.loc
				usr.dir = SOUTH
				usr.CanMove = 0
				usr.Sleeping = 1
				usr.Pain = 0
				usr.overlays += /obj/Misc/Sleeping/
				usr.Sleeping()
				usr << "<font color=green>You climb into bed and fall fast asleep!<br>"
				return
			if(usr.Sleeping)
				if(usr.Fainted)
					return
				if(usr.Stunned)
					return
				var/Legs = 1
				if(usr.RightLeg == 0)
					if(usr.LeftLeg == 0)
						Legs = 0
				if(Legs)
					if(usr.Job == null)
						usr.CanMove = 1
				usr.Sleeping = 0
				usr.overlays -= /obj/Misc/Sleeping/
				usr << "<font color=green>You wake up and climb out of bed!<br>"
				return

	if(usr.Function == "Pull")
		if(src in range(1,usr))
			for(var/mob/M in range(0,src))
				if(M.Sleeping)
					usr << "<font color = red>Cant move a bed while someone is sleeping on it!<br>"
					return
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
		return
	if(usr.Function == "PickUp")
		if(src.suffix == "Carried" && src in usr)
			src.loc = usr.loc
			src.suffix = null
			src.layer = 4
			src.overlays = null
			src.icon_state = "bed roll"
			usr.client.screen -= src
			usr.Weight -= src.Weight
			view() << "<b>[usr] drops [src]<br>"
			for(var/obj/HUD/Text/T in usr.client.screen)
				if(T.Type == "Weight")
					del(T)
			if(usr.InvenUp)
				usr.Text("Weight",usr,4,15,0,10,"Weight - [usr.Weight]/[usr.WeightMax]")
			usr.Delete("ScrollMiddle","BoxDelete")
			return
		if(usr in range(1,src))
			for(var/mob/M in range(0,src))
				if(M.Sleeping)
					usr << "<font color = red>Cant move a bed while someone is sleeping on it!<br>"
					return
			if(src.suffix == null)
				if(usr.Weight <= usr.WeightMax)
					src.loc = usr
					src.icon_state = "bed rolled"
					src.suffix = "Carried"
					usr.Weight += src.Weight
					src.overlays+=image(/obj/HUD/C/)
					if(usr.InvenUp)
						usr.DeleteInventoryMenu()
						usr.CreateInventory()
					view() << "<b>[usr] picks up [src]<br>"
					return
				else
					usr << "<b>You cant carry too much weight!<br>"
					return
			else
				usr << "<b>You cant pick that item up!<br>"
				return

/obj/Items/Furniture/Misc/Bed
	icon = 'furniture.dmi'
	icon_state = "bed"
	Weight = 12
	Fuel = 50
	Material = "Wood"
	CanBeCrafted = 1
	Type = "Sleep"

/obj/Items/Furniture/Misc/Bed/Click()
	if(usr.Job == null && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Type != "Plank")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Three wooden Planks in order to create this item!<br>"
				return
			var/PlankNum = 0
			var/Planks = list()
			for(var/obj/Items/Resources/Plank/P in usr)
				if(PlankNum != 3)
					PlankNum += 1
					Planks += P
			if(PlankNum != 3)
				usr << "<font color = red>You need Three wooden Planks in order to create this item!<br>"
				return
			if(PlankNum == 3 && O.Type == "Plank")
				var/LOC = usr.loc
				usr.Job = "CreateBed"
				usr.CanMove = 0
				var/Time = 200 - usr.CarpentrySkill * 1.5 - usr.Agility / 2 - usr.Intelligence
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to contruct the Planks into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Planks && usr.loc == LOC)
							PlankNum = 0
							Planks = null
							Planks = list()
							for(var/obj/Items/Resources/Plank/P in usr)
								if(PlankNum != 3)
									PlankNum += 1
									Planks += P
							if(PlankNum == 3 && O && usr.Job == "CreateBed")
								var/Fail = prob(50 - usr.CarpentrySkill - usr.Agility / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									for(var/obj/I in Planks)
										if(PlankNum != 0)
											PlankNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.CarpentrySkill += usr.CarpentrySkillMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.CarpentrySkill * 2
								W.suffix = null
								for(var/obj/I in Planks)
									if(PlankNum != 0)
										PlankNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.CarpentrySkill += usr.CarpentrySkillMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
								return
							else
								usr << "<font color = red>Planks could not be found in your inventory, crafting failed!<br>"
								usr.MovementCheck()
								return
						else
							usr << "<font color = red>Planks could not be found in your inventory, or you moved while creating the item. Crafting failed!<br>"
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
			if(usr.Sleeping == 0)
				if(usr.Dead)
					return
				if(usr.Fainted)
					return
				if(usr.Stunned)
					return
				if(usr.Weapon)
					usr << "<font color = red>You wont be able to sleep with a [usr.Weapon] on!!<br>"
					return
				if(usr.Weapon2)
					usr << "<font color = red>You wont be able to sleep with a [usr.Weapon2] on!!<br>"
				for(var/obj/Items/Armour/A in usr)
					if(A.suffix == "Equip" && A.DefenceType == "Plate")
						usr << "<font color = red>You wont be able to sleep with Plate Armour on!<br>"
						return
				usr.ResetButtons()
				usr.Function = null
				usr.loc = src.loc
				usr.dir = SOUTH
				usr.CanMove = 0
				usr.Sleeping = 1
				usr.Pain = 0
				usr.overlays += /obj/Misc/Sleeping/
				usr.Sleeping()
				usr << "<font color=green>You climb into bed and fall fast asleep!<br>"
				return
			if(usr.Sleeping)
				if(usr.Fainted)
					return
				if(usr.Stunned)
					return
				var/Legs = 1
				if(usr.RightLeg == 0)
					if(usr.LeftLeg == 0)
						Legs = 0
				if(Legs)
					if(usr.Job == null)
						usr.CanMove = 1
				usr.Sleeping = 0
				usr.overlays -= /obj/Misc/Sleeping/
				usr << "<font color=green>You wake up and climb out of bed!<br>"
				return

	if(usr.Function == "Pull")
		for(var/mob/M in range(0,src))
			if(M.Sleeping)
				usr << "<font color = red>Cant move a bed while someone is sleeping on it!<br>"
				return
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
