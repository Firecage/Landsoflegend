/obj/Items/Containers/Bowl
	icon = 'containers.dmi'
	icon_state = "bowl"
	Weight = 1
	WeightMax = 3
	Type = null //Can be Liquids, Solids, ect.
	Fuel = 10
	desc = "This is a bowl, it can be used to store liquid in."
	Material = "Wood"
	CanBeCrafted = 1

/obj/Items/Containers/Bowl/Click()
	if(usr.Job == null && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Type != "Block")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need One Wooden Block in order to create this item!<br>"
				return
			var/BlockNum = 0
			var/Blocks = list()
			for(var/obj/Items/Resources/Block/B in usr)
				if(BlockNum != 1)
					BlockNum += 1
					Blocks += B
			if(BlockNum != 1)
				usr << "<font color = red>You need One Wooden Block in order to create this item!<br>"
				return
			if(BlockNum == 1 && O.Type == "Block")
				var/LOC = usr.loc
				usr.Job = "CreateBowl"
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
				view(usr) << "<font color = yellow>[usr] begins to contruct the Block into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Blocks && usr.loc == LOC)
							BlockNum = 0
							Blocks = null
							Blocks = list()
							for(var/obj/Items/Resources/Block/B in usr)
								if(BlockNum != 1)
									BlockNum += 1
									Blocks += B
							if(BlockNum == 1 && O && usr.Job == "CreateBowl")
								var/Fail = prob(50 - usr.CarpentrySkill - usr.Agility / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									for(var/obj/I in Blocks)
										if(BlockNum != 0)
											BlockNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.CarpentrySkill += usr.CarpentrySkillMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.CarpentrySkill * 2
								W.suffix = null
								for(var/obj/I in Blocks)
									if(BlockNum != 0)
										BlockNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.CarpentrySkill += usr.CarpentrySkillMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
								return
							else
								usr << "<font color = red>One Block could not be found in your inventory, crafting failed!<br>"
								usr.MovementCheck()
								return
						else
							usr << "<font color = red>One Block could not be found in your inventory, or you moved while creating the item. Crafting failed!<br>"
							usr.MovementCheck()
							return
	if(usr.Function == "Interact")
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.ObjectType == "Berry" && src.Type == null)
				view(usr) << "<font color = yellow>[usr] crushes the [usr.Ref] into a [src].<br>"
				var/obj/Misc/ContainerOverlays/BowlOverlay/BO = new
				BO.layer = src.layer
				BO.Red = O.Red
				BO.Green = O.Green
				BO.Blue = O.Blue
				BO.icon += rgb(O.Red,O.Green,O.Blue)
				src.overlays += BO
				src.Type = "Dye/Ink/Food"
				src.ObjectTag = "Berry"
				src.Red = O.Red
				src.Green = O.Green
				src.Blue = O.Blue
				usr.Weight -= O.Weight
				del(O)
				if(usr.InvenUp)
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
				return
		if(usr.Ref == null)
			usr << "<font color=green>Double Click on Turf to empty or single Click another object to Interact!<br>"
			usr.Ref = src
			return
	if(usr.Function == "PickUp")
		if(src.suffix == "Carried" && src in usr)
			src.loc = usr.loc
			src.suffix = null
			src.layer = 4
			src.overlays = null
			usr.client.screen -= src
			usr.Weight -= src.Weight
			view() << "<b>[usr] drops [src]<br>"
			for(var/obj/HUD/Text/T in usr.client.screen)
				if(T.Type == "Weight")
					del(T)
			if(usr.InvenUp)
				usr.Text("Weight",usr,4,15,0,10,"Weight - [usr.Weight]/[usr.WeightMax]")
			usr.Delete("ScrollMiddle","BoxDelete")
			for(var/obj/Items/Resources/CampSite/CS in range(1,src))
				if(src.CookingFood == 1 && CS.OnFire && src.icon != 'Skeleton.dmi')
					src.Cook(src.loc,CS,usr,0,0)
					view(usr) << "<font color = yellow>[usr] places down a [src] to cook!<br>"
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
