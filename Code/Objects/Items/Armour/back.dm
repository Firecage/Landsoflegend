/obj/Items/Armour/Back

/obj/Items/Armour/Back/Click()
	if(usr.Function == "Interact")
		if(usr.Dead == 0)
			if(src.suffix)
				var/obj/I = null
				for(var/obj/Items/Ammo/A in src)
					I = A
					break
				if(I)
					I.loc = usr
					usr.Weight -= src.Weight
					src.Weight -= I.Weight
					usr.Weight += src.Weight
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
				if(usr.WBack == null)
					src.layer = src.ItemLayer
					src.suffix = "Equip"
					src.overlays += image(/obj/HUD/E/)
					src.icon_state = src.EquipState
					usr.WBack = src
					usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
					src.layer = 20
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					if(src.Type == "Conceals")
						usr.OrginalName = usr.name
						usr.name = "Unknown"
						usr.StoredFaction = usr.Faction
						usr.Faction = "None"
					return
		if(src.suffix == "Equip")
			if(src in usr)
				if(usr.WBack == src)
					src.layer = src.ItemLayer
					usr.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
					usr.WBack = null
					src.suffix = "Carried"
					src.overlays-=image(/obj/HUD/E/)
					src.overlays+=image(/obj/HUD/C/)
					src.icon_state = src.CarryState
					src.layer = 20
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					if(usr.OrginalName)
						usr.name = usr.OrginalName
						usr.OrginalName = null
					if(usr.StoredFaction)
						usr.Faction = usr.StoredFaction
						usr.StoredFaction = null
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

/obj/Items/Armour/Back/SmallClothCloak
	icon = 'clothes.dmi'
	icon_state = "small cloak equip"
	EquipState = "small cloak equip"
	CarryState = "folded cloth"
	DefenceType = "Cloth"
	Type = "Conceals"
	Weight = 1
	CantRaces = list("Giant","Cyclops","Human","Frogman","Alther","Wolfman","Snakeman","Illithid")
	Dura = 100
	ItemLayer = 4.9
	Defence = 1

/obj/Items/Armour/Back/SmallClothCloak/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Back/ClothCloak
	icon = 'clothes.dmi'
	icon_state = "cloak equip"
	EquipState = "cloak equip"
	CarryState = "folded cloth"
	DefenceType = "Cloth"
	Type = "Conceals"
	Weight = 2
	CantRaces = list("Giant","Cyclops")
	Dura = 100
	ItemLayer = 4.9
	Defence = 1

/obj/Items/Armour/Back/ClothCloak/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Back/SmallClothCape
	icon = 'clothes.dmi'
	icon_state = "small cape equip"
	EquipState = "small cape equip"
	CarryState = "folded cloth"
	DefenceType = "Cloth"
	Weight = 1
	CantRaces = list("Stahlite","Giant","Cyclops","Human","Frogman","Alther","Wolfman","Snakeman","Illithid")
	Dura = 100
	Fuel = 50
	ItemLayer = 4.9
	Defence = 1

/obj/Items/Armour/Back/SmallClothCape/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Back/ClothCape
	icon = 'clothes.dmi'
	icon_state = "cape equip"
	EquipState = "cape equip"
	CarryState = "folded cloth"
	DefenceType = "Cloth"
	Weight = 1
	CantRaces = list("Giant","Cyclops","Stahlite")
	Dura = 100
	Fuel = 50
	ItemLayer = 4.9
	Defence = 1

/obj/Items/Armour/Back/ClothCape/New()
	src.icon_state = src.CarryState
	src.layer = 4
