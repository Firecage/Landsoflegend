/obj/Items/Furniture/Misc/TrainingDummy
	icon = 'tools.dmi'
	icon_state = "training doll"
	Weight = 6
	Fuel = 40
	density = 1
	Material = "Wood"
	CanBeCrafted = 1
	Dura = 200
	Type = "CanHit"

/obj/Items/Furniture/Misc/TrainingDummy/Click()
	if(usr.Job == null && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Type != "Block")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Two wooden Blocks in order to create this item!<br>"
				return
			var/BlockNum = 0
			var/Blocks = list()
			for(var/obj/Items/Resources/Block/P in usr)
				if(BlockNum != 2)
					BlockNum += 1
					Blocks += P
			if(BlockNum != 2)
				usr << "<font color = red>You need Two wooden Blocks in order to create this item!<br>"
				return
			if(BlockNum == 2 && O.Type == "Block")
				var/LOC = usr.loc
				usr.Job = "CreateDummy"
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
				view(usr) << "<font color = yellow>[usr] begins to contruct the Blocks into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Blocks && usr.loc == LOC)
							BlockNum = 0
							Blocks = null
							Blocks = list()
							for(var/obj/Items/Resources/Block/P in usr)
								if(BlockNum != 2)
									BlockNum += 1
									Blocks += P
							if(BlockNum == 2 && O && usr.Job == "CreateDummy")
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
								W.Dura += usr.CarpentrySkill * 4
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
								usr << "<font color = red>Blocks could not be found in your inventory, crafting failed!<br>"
								usr.MovementCheck()
								return
						else
							usr << "<font color = red>Blocks could not be found in your inventory, or you moved while creating the item. Crafting failed!<br>"
							usr.MovementCheck()
							return
	if(src in range(1,usr))
		if(usr.Function == "Interact" && usr.Ref && usr.Job == null && usr.Fainted == 0 && usr.Stunned == 0)
			var/obj/O = usr.Ref
			if(O.Type == "Saw" && O.Dura >= 1)
				if(O.suffix != "Equip")
					usr << "<font color = red>Equip the Saw first!<br>"
					return
				usr.Job = "Fix"
				var/Loc = usr.loc
				var/Time = 300 - usr.CarpentrySkill * 2
				if(Time <= 25)
					Time = 25
				view(usr) << "<font color = yellow>[usr] begins to fix [src] using their [O]!<br>"
				spawn(Time)
					if(usr && src && usr.loc == Loc && usr.Job == "Fix" && src.Dura <= 1 && usr.Dead == 0)
						view(usr) << "<font color = yellow>[usr] finishes fixing [src] with their [O]!<br>"
						if(usr.CarpentrySkill == 0)
							usr.CarpentrySkill = 0.1
						src.Dura += usr.CarpentrySkill * 4 + 2
						src.icon_state = "training doll"
						src.Type = "CanHit"
						usr.Job = null
						usr.CarpentrySkill += usr.CarpentrySkillMulti
						O.Dura -= rand(1,2)
						usr.CheckWeaponDura(O)
						return
					else
						usr << "<font color = red>You failed to fix [src]!<br>"
						usr.Job = null
						usr.CarpentrySkill += usr.CarpentrySkillMulti / 2
						return
		if(usr.Function == "Combat" && src.Type == "CanHit" && usr.Dead == 0 && usr.Fainted == 0 && usr.Job == null && usr.Stunned == 0)
			if(src.Dura >= 1)
				usr.DetermineWeaponSkill()
				view(usr) << "<font color = yellow>[usr] hits the [src]!<br>"
				var/DMG = usr.Strength / 2 + usr.CurrentSkillLevel
				src.Dura -= DMG
				if(usr.CurrentSkillLevel <= 20)
					if(usr.CurrentSkill == "Sword")
						usr.SwordSkill += usr.SwordSkillMulti / 2
					if(usr.CurrentSkill == "Axe")
						usr.AxeSkill += usr.AxeSkillMulti / 2
					if(usr.CurrentSkill == "Spear")
						usr.SpearSkill += usr.SpearSkillMulti / 2
					if(usr.CurrentSkill == "Blunt")
						usr.BluntSkill += usr.BluntSkillMulti / 2
					if(usr.CurrentSkill == "Dagger")
						usr.DaggerSkill += usr.DaggerSkillMulti / 2
					if(usr.CurrentSkill == "Unarmed")
						usr.UnarmedSkill += usr.UnarmedSkillMulti / 2
				else
					usr << "<font color = red>You will not gain from training off this, your skills are too high!<br>"
				src.Type = "CantHit"
				if(src.Dura <= 1)
					src.icon_state = "broken training doll"
					src.Dura = 0
				spawn(100)
					if(src && src.Dura >= 1)
						src.Type = "CanHit"
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
