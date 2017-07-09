/obj/Items/Furniture/Misc/SignPost
	icon = 'tools.dmi'
	icon_state = "sign2"
	Weight = 5
	Fuel = 25
	density = 1
	Material = "Wood"
	CanBeCrafted = 1
	Type = "Stuck"
	suffix = "Stuck"

/obj/Items/Furniture/Misc/SignPost/Click()
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
				usr.Job = "CreateSign"
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
							if(PlankNum == 3 && O && usr.Job == "CreateSign")
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
								W.Type = "NotStuck"
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
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(src.Type == "Stuck")
				if(usr.Dead == 0 && usr.Fainted == 0 && usr.Stunned == 0 && usr.Job == null && usr.CanMove)
					var/HasArms = 1
					if(usr.LeftArm <= 20)
						if(usr.RightArm <= 20)
							HasArms = 0
					if(HasArms)
						view(usr) << "<font color = yellow>[usr] pull the sign post loose!<br>"
						src.Type = "NotStuck"
						src.suffix = null
						return
					else
						usr << "<font color = red>You cant do that with hurt arms!<br>"
						return
		if(src.Type == "NotStuck" && src in usr)
			var/N=input("What do you want written on this sign?")as text
			if(N == null)
				return
			else
				src.desc = N
				src.name = N
			return
		if(src.Type == "NotStuck" && src.suffix == null)
			if(usr.Dead == 0 && usr.Fainted == 0 && usr.Stunned == 0 && usr.Job == null && usr.CanMove)
				var/HasArms = 1
				if(usr.LeftArm <= 20)
					if(usr.RightArm <= 20)
						HasArms = 0
				if(HasArms)
					view(usr) << "<font color = yellow>[usr] pushes the sign post into the ground firmly!<br>"
					src.Type = "Stuck"
					src.suffix = "Stuck"
					return
				else
					usr << "<font color = red>You cant do that with hurt arms!<br>"
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
