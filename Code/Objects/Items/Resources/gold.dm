/obj/Items/Resources/GoldOre
	icon = 'materials.dmi'
	icon_state = "Gold ore"
	Weight = 20
	Type = "Ore"
	Material = "Gold"

/obj/Items/Resources/GoldOre/New()
	src.CraftPotential = rand(10,100)
	src.pixel_x = rand(-16,16)
	src.pixel_y = rand(-16,16)

/obj/Items/Resources/GoldOre/Click()
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
			for(var/obj/HUD/Text/T in usr.client.screen)
				if(T.Type == "Weight")
					del(T)
			if(usr.InvenUp)
				usr.Text("Weight",usr,4,15,0,10,"Weight - [usr.Weight]/[usr.WeightMax]")
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
