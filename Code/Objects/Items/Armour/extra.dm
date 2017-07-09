/obj/Items/Armour/Extra

/obj/Items/Armour/Extra/Click()
	if(usr.Job == null && src.Material == "Leather" && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Material != "Leather")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Four Dry Leather Hides in order to create this item!<br>"
				return
			var/LeatherNum = 0
			var/Leathers = list()
			for(var/obj/Items/Resources/Skin/S in usr)
				if(S.Type == "Dry" && LeatherNum != 2)
					LeatherNum += 1
					Leathers += S
			if(LeatherNum != 2)
				usr << "<font color = red>You need Four Dry Leather Hides in order to create this item!<br>"
				return
			if(LeatherNum == 2 && O.Material == "Leather")
				var/LOC = usr.loc
				usr.Job = "MakeLeatherItem"
				usr.CanMove = 0
				var/Time = 200 - usr.LeatherCraftSkill * 1.5 - usr.Agility / 2 - usr.Intelligence / 2
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to contruct the Dry Leather Hides into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Leathers && usr.loc == LOC)
							if(LeatherNum == 2 && O && usr.Job == "MakeLeatherItem")
								var/Fail = prob(50 - usr.LeatherCraftSkill - usr.Agility / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									var/obj/Items/Resources/Skin/S = new
									S.icon_state = "Dry Leather Scrap"
									S.name = "[O.name] Scrap"
									S.CraftPotential = O.CraftPotential / 2
									S.Weight = S.Weight / 2
									S.loc = usr.loc
									S.Type = "Dry"
									for(var/obj/I in Leathers)
										if(LeatherNum != 0)
											LeatherNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.LeatherCraftSkill += usr.LeatherCraftSkillMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.LeatherCraftSkill * 2
								W.Defence += usr.LeatherCraftSkill / 3
								W.suffix = null
								W.density = 0
								W.opacity = 0
								if(W.ObjectTag == "Armour")
									usr.CraftLeatherArmour(O,W)
								for(var/obj/I in Leathers)
									if(LeatherNum != 0)
										LeatherNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.LeatherCraftSkill += usr.LeatherCraftSkillMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
								return
							else
								usr << "<font color = red>Dry Leather Hides could not be found in your inventory, crafting failed!<br>"
								usr.Job = null
								usr.MovementCheck()
								return
						else
							usr << "<font color = red>Dry Leather Hides could not be found in your inventory, or you moved while creating the item. Crafting failed!<br>"
							usr.Job = null
							usr.MovementCheck()
							return
	if(usr.Function == "Interact")
		if(usr.Dead == 0)
			if(src.suffix)
				var/obj/I
				for(var/obj/Items/Ammo/A in src)
					I = A
					break
				if(I)
					I.loc = usr
					src.Weight -= I.Weight
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					usr << "<font color = green>You pull a [I] from your Quiver!<br>"
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
	if(usr.Function == "Equip")
		if(src.suffix == "Carried")
			if(src in usr)
				if(usr.Race in src.CantRaces)
					usr << "<font color = red>Your race cant wear that item!<br>"
					return
				if(src.Dura <= 0)
					usr << "<font color = red>[src] is broken, you cant use that!<br>"
					return
				if(usr.WExtra == null)
					src.layer = src.ItemLayer
					src.suffix = "Equip"
					src.overlays += image(/obj/HUD/E/)
					src.icon_state = src.EquipState
					usr.WExtra = src
					usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
					src.layer = 20
					src.icon_state = src.CarryState
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					return
		if(src.suffix == "Equip")
			if(src in usr)
				if(usr.WExtra == src)
					src.icon_state = src.EquipState
					src.layer = src.ItemLayer
					usr.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
					usr.WExtra = null
					src.suffix = "Carried"
					src.overlays-=image(/obj/HUD/E/)
					src.overlays+=image(/obj/HUD/C/)
					src.icon_state = src.CarryState
					src.layer = 20
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					return
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		return
	if(usr.Function == "PickUp")
		if(src.suffix == "Carried" && src in usr)
			src.overlays = null
			src.loc = usr.loc
			src.suffix = null
			src.layer = 4
			usr.client.screen -= src
			usr.Weight -= src.Weight
			view() << "<b>[usr] drops [src]<br>"
			usr.DeleteInventoryMenu()
			usr.CreateInventory()
			usr.Delete("ScrollMiddle","BoxDelete")
			return
		if(usr in range(1,src))
			if(src.suffix == null)
				if(usr.Weight <= usr.WeightMax)
					src.loc = usr
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

/obj/Items/Armour/Extra/LeatherQuiver
	icon = 'equipment.dmi'
	icon_state = "quiver equip"
	EquipState = "quiver equip"
	CarryState = "quiver"
	DefenceType = "Leather"
	Type = "Quiver"
	ItemLayer = 5
	CanBeCrafted = 1
	Material = "Leather"
	Dura = 100

/obj/Items/Armour/Extra/LeatherQuiver/New()
	src.icon_state = src.CarryState
	src.layer = 4
