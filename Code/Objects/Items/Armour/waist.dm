/obj/Items/Armour/Waist

/obj/Items/Armour/Waist/Click()
	if(usr.Function == "Interact" && usr.Ref == null)
		usr << "<font color=green>Click another object to interact with this one!<br>"
		usr.Ref = src
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
			if(usr.Race in src.CantRaces)
				usr << "<font color = red>Your race cant wear that item!<br>"
				return
			if(src.Dura <= 0)
				usr << "<font color = red>[src] is broken, you cant use that!<br>"
				return
			if(src in usr)
				if(usr.WWaist == null)
					src.layer = src.ItemLayer
					src.suffix = "Equip"
					src.overlays += image(/obj/HUD/E/)
					src.icon_state = src.EquipState
					usr.WWaist = src
					usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
					src.layer = 20
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					return
		if(src.suffix == "Equip")
			if(src in usr)
				if(usr.WWaist == src)
					src.layer = src.ItemLayer
					usr.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
					usr.WWaist = null
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
	if(usr.Function == "Interact")
		usr << "<font color=green>Click another object to interact with this one!<br>"
		usr.Ref = src
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

/obj/Items/Armour/Waist/SmallPlateBelt
	icon = 'equipment.dmi'
	icon_state = "small platebelt"
	EquipState = "small platebelt"
	CarryState = "small platebelt"
	DefenceType = "Plate"
	CantRaces = list("Giant","Cyclops","Ratling","Human","Alther","Frogman","Wolfman","Illithid")
	ItemLayer = 4.4
	Weight = 3
	CanBeCrafted = 1
	BaseMaterial = "Metal"

/obj/Items/Armour/Waist/SmallPlateBelt/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Waist/PriestBelt
	icon = 'equipment.dmi'
	icon_state = "priest belt"
	EquipState = "priest belt"
	CarryState = "inquisitor priest belt"
	Weight = 3
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite","Wolfman","Snakeman","Illithid")
	DefenceType = "Plate"
	Dura = 100
	ItemLayer = 4.6
	Defence = 3
	Delete = 1
	BaseMaterial = "Metal"

/obj/Items/Armour/Waist/New()
	src.icon_state = src.CarryState
	src.layer = 4
