/obj/Items/Furniture/Doors/IronGate
	icon_state = "gate"
	density = 1
	suffix = "Stuck"
	Weight = 30
	Dura = 300
	Fuel = 0
	CanBeCrafted = 1
	Material = "Iron"

/obj/Items/Furniture/Doors/IronGate/Click()
	if(usr.Function == "Interact" && usr.Ref)
		if(usr in range(1,src))
			if(isobj(usr.Ref))
				var/obj/O = usr.Ref
				if(O.Type == "Hammer")
					var/HasArms = 1
					if(usr.LeftArm <= 20)
						if(usr.RightArm <= 20)
							HasArms = 0
					if(HasArms == 0)
						usr << "<font color = red>Your Arms are far too damaged!<br>"
						return
					if(src.density == 0)
						usr << "<font color = red>You need to shut the gate first before trying to Repair it!<br>"
						return
					if(O != usr.Weapon)
						usr << "<font color = red>Equip the Hammer first!<br>"
						return
					var/list/menu = new()
					menu += "Repair Gate"
					menu += "Cancel"
					var/Result = input(usr,"Choose an Area of the Gate to repair.", "Choose", null) in menu
					if (Result == "Cancel")
						return
					if(Result == "Repair Gate")
						var/HasIngot = 0
						for(var/obj/Items/Resources/Ingot/I in usr)
							if(I.Material == "Iron")
								HasIngot = 1
								break
						var/CanRepair = 1
						for(var/mob/M in range(1,src))
							if(M != usr)
								CanRepair = 0
						if(HasIngot == 0)
							usr << "<font color = red>You will need one Iron Ingot to Repair this gate!<br>"
							return
						if(CanRepair == 0)
							usr << "<font color = red>Cant Repair with others near!<br>"
							return
						if(src.Dura >= usr.ForgingSkill * 2 + 300)
							usr << "<font color = red>This gate is beyond your skill to repair!<br>"
							return
						var/LOC = usr.loc
						usr.Job = "Repair Gate"
						usr.Ref = null
						usr.CanMove = 0
						var/Time = 600 - usr.Agility - usr.Intelligence
						if(Time <= 50)
							Time = 50
						usr.DeleteInventoryMenu()
						if(usr.InvenUp)
							usr.InvenUp = 0
						usr.ResetButtons()
						for(var/obj/HUD/B in usr.client.screen)
							if(B.Type == "Inventory")
								B.icon_state = "inv off"
						range(src) << "<font color = yellow>[usr] begins to Repair [src]!<br>"
						spawn(Time)
							if(usr)
								if(src && O && usr.loc == LOC)
									if(usr.Job == "Repair Gate" && usr.CantDoTask == 0)
										HasIngot = 0
										for(var/obj/Items/Resources/Ingot/I in usr)
											usr.Weight -= I.Weight
											del(I)
											HasIngot = 1
											break
										var/Fail = prob(50 - usr.Agility / 2 - usr.Intelligence / 2)
										usr.Job = null
										usr.MovementCheck()
										if(HasIngot == 0)
											usr << "<font color = red>Iron Ingot was moved, crafting stopped!<br>"
											return
										if(Fail)
											range(src) << "<font color = yellow>[usr] fails at Repairing the [src]!<br>"
											return
										if(src.Dura <= usr.ForgingSkill * 2 + 301)
											src.Dura = usr.ForgingSkill * 2 + 301
										range(src) << "<font color = yellow>[usr] finishes Repairing the [src]!<br>"
										return
						return
	if(usr.Job == null && src in usr.CreateList )
		var/obj/NearForge = null
		var/obj/NearAnvil = null
		for(var/obj/Items/Misc/StoneForge/F in range(1,usr))
			if(NearForge == null)
				if(F.Type == "Lit")
					NearForge = F
					break
				else
					usr << "<font color = red>The near by Forge is not lit!<br>"
		for(var/obj/Items/Misc/Anvil/A in range(1,usr))
			NearAnvil = A
		if(usr.Ref && NearForge && NearAnvil)
			var/obj/O = usr.Ref
			if(O.Type == "Ingot")
				var/Ingots = list()
				Ingots += O
				for(var/obj/Items/Resources/Ingot/I in usr)
					if(I != O && I.Material == O.Material)
						Ingots += I
				var/IngotNum = 0
				for(var/obj/I in Ingots)
					IngotNum += 1
					if(IngotNum == 4)
						break
				if(IngotNum != 4)
					usr << "<font color = red>You need five Ingots of the same Material to forge this item!<br>"
					return
				IngotNum = 0
				usr.Job = "Metal Gate"
				usr.CanMove = 0
				var/Time = 200 - usr.ForgingSkill * 2 - usr.Strength / 2
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to forge the [O] into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Ingots)
							for(var/obj/I in Ingots)
								if(I in usr)
									IngotNum += 1
									if(IngotNum == 4)
										break
						if(IngotNum == 4 && usr.Job == "Metal Gate")
							var/Fail = prob(50 - usr.ForgingSkill - usr.Strength / 4 - usr.Agility / 4)
							var/NF = 0
							var/NA = 0
							for(var/obj/Items/Misc/StoneForge/F in range(1,usr))
								if(F.Type == "Lit")
									NF = 1
							for(var/obj/Items/Misc/Anvil/A in range(1,usr))
								NA = 1
							if(NF)
								if(NA)
									usr.Job = null
									usr.MovementCheck()
									if(Fail)
										view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
										usr.Weight -= O.Weight
										IngotNum = 0
										var/MakeMess = prob(50)
										if(MakeMess)
											for(var/obj/I in Ingots)
												var/obj/Items/Resources/Scrap/M = new
												M.Material = I.Material
												M.icon_state = "[M.Material] scrap"
												M.name = "[M.Material] scrap"
												M.Weight = I.Weight
												M.CraftPotential = I.CraftPotential / 2
												M.loc = usr.loc
												usr << "<font color = red>You create a [M] !<br>"
												break
										for(var/obj/I in Ingots)
											if(IngotNum != 4)
												IngotNum += 1
												usr.Weight -= I.Weight
												del(I)
										if(usr.ForgingSkill <= usr.SkillCap && usr.ForgingSkill <= WorldSkillsCap)
											usr.ForgingSkill += usr.ForgingSkillMulti / 2
										usr.GainStats(2)
										return
									var/obj/W = new src.type(usr.loc)
									W.Material = O.Material
									W.suffix = null
									IngotNum = 0
									for(var/obj/I in Ingots)
										if(IngotNum != 4)
											IngotNum += 1
											usr.Weight -= I.Weight
											del(I)
									if(usr.ForgingSkill <= usr.SkillCap && usr.ForgingSkill <= WorldSkillsCap)
										usr.ForgingSkill += usr.ForgingSkillMulti
									usr.GainStats(2)
									view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
									usr << "<font color = teal>The gate is now laying flat on the floor, in order to make it dense, you must Click Interact then Click the gate while its in your Inventory.<br>"
									return
								else
									usr << "<font color = red>The Anvil was moved, or you moved away from it, forgeing failed!<br>"
									usr.MovementCheck()
									return
							else
								usr << "<font color = red>The Forge was moved, or you moved away from it, or the forge was not lit, forgeing failed!<br>"
								usr.MovementCheck()
								return
						else
							usr.MovementCheck()
							return
	if(usr.Function == "Interact" && src.suffix == "Carried")
		var/CanPlace = 1
		for(var/obj/Items/Furniture/Doors/IronGate/G in range(0,usr))
			CanPlace = 1
		if(CanPlace)
			usr << "<font color = green>You place the [src] down and secure it!<br>"
			src.suffix = "Stuck"
			src.density = 1
			src.loc = usr.loc
			usr.Weight -= src.Weight
			src.overlays = null
			if(usr.InvenUp)
				usr.DeleteInventoryMenu()
				usr.CreateInventory()
			return
	if(usr.Function == "Combat" && src.suffix == "Stuck" && usr.Job == null && src.density)
		if(usr in range(1,src))
			var/list/menu = new()
			menu += "Attack Gate"
			menu += "Cancel"
			var/Result = input(usr,"Choose an Area of the gate to attack.", "Choose", null) in menu
			if (Result == "Cancel")
				return
			if (Result == "Attack Gate")
				if(usr.CantDoTask)
					usr << "<font color = red>Cant attack that for a while!<br>"
					return
				view(usr) << "<font color = red>[usr] begins an attempt at breaking the [src] down!<br>"
				usr.Job = "SmashGate"
				usr.CanMove = 0
				usr.CantDoTask = 1
				spawn(150)
					if(usr)
						usr.CantDoTask = 0
				var/LOC = usr.loc
				var/Time = 150 - usr.Agility / 2
				if(Time <= 10)
					Time = 10
				spawn(Time)
					if(usr && src && usr.loc == LOC && usr.Job == "SmashGate" && src.density && src.suffix == "Stuck")
						var/DMG = usr.Strength
						var/Holding = 0
						if(usr.Weapon)
							Holding += 1
							var/obj/W = usr.Weapon
							if(W.ObjectTag == "Weapon")
								DMG += W.Weight / 2
								W.Dura -= rand(0.1,2)
								if(W.ObjectType == "Blunt")
									DMG += 10
								if(W.TwoHander && usr.Weapon2 == null)
									DMG += W.Weight / 2
								usr.CheckWeaponDura(W)
						if(usr.Weapon2)
							Holding += 2
							var/obj/W = usr.Weapon2
							if(W.ObjectTag == "Weapon")
								DMG += W.Weight / 2
								W.Dura -= rand(0.1,2)
								if(W.ObjectType == "Blunt")
									DMG += 10
								if(W.TwoHander && usr.Weapon == null)
									DMG += W.Weight / 2
								usr.CheckWeaponDura(W)
						if(Holding == 2)
							DMG = DMG / 1.5
						usr.DetermineWeaponSkill()
						if(usr.CurrentSkillLevel)
							DMG = DMG + usr.CurrentSkillLevel / 4
						usr.Job = null
						usr.MovementCheck()
						var/WontDamage = 75 - usr.Strength
						var/CantDamage = prob(WontDamage)
						if(DMG >= 0 && CantDamage != 1)
							src.Dura -= DMG
							if(src.Dura <= 0)
								usr.Log_player("<font color = red><b>([usr.key])[usr]-[usr.x],[usr.y],[usr.z]-smashes a [src] open<br>")
								range(src) << "<font color = red>[src] makes a thunderous noise as it bends and crinkles as [usr] attacks it!<br>"
								del(src)
							else
								range(src) << "<font color = red>[src] makes a loud metallic noise as [usr] damages it!<br>"
							return
						else
							range(src) << "<font color = red>[src] makes a loud metallic noise as [usr] tried to damage it!<br>"
							return
					else
						if(usr)
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
		usr << "<font color=teal>[src.desc]<br>"
		if(src in range(1,usr))
			var/Known = 0
			for(var/obj/Items/F in usr.CreateList)
				if(F.type == src.type)
					Known = 1
			if(Known == 0)
				if(src.CanBeCrafted)
					var/obj/W = new src.type()
					W.layer = 100
					W.suffix = "None"
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
	if(usr.Function == "Interact")
		var/CanOpen = 0
		if(usr in range(1,src))
			CanOpen = 1
		if(usr.CanUseTK)
			CanOpen = 1
		if(CanOpen)
			if(src.Locked == 0)
				if(src.density)
					if(src.Type != "Busy")
						src.GateFunctions("Open")
						view(5) << 'MetalGate.wav'
						if(usr.CanUseTK)
							var/obj/Misc/SpellEffects/Dispel/D = new
							src.overlays += D
							var/obj/Misc/SpellEffects/Dispel/D2 = new
							usr.overlays += D2
							spawn(10)
								if(usr)
									usr.overlays -= D2
									del(D2)
								if(src)
									src.overlays -= D
									del(D)
					return
				if(src.density == 0)
					if(src.Type != "Busy")
						src.GateFunctions("Close")
						view(5) << 'MetalGate.wav'
						if(usr.CanUseTK)
							var/obj/Misc/SpellEffects/Dispel/D = new
							src.overlays += D
							var/obj/Misc/SpellEffects/Dispel/D2 = new
							usr.overlays += D2
							spawn(10)
								if(usr)
									usr.overlays -= D2
									del(D2)
								if(src)
									src.overlays -= D
									del(D)
					return
			else
				usr << "<font color = red>This gate is locked!<br>"
				return

/obj/Items/Furniture/Doors/WoodenGate
	icon = 'tools.dmi'
	icon_state = "gate"
	density = 1
	suffix = "Stuck"
	Weight = 10
	Fuel = 50
	Material = "Wood"

/obj/Items/Furniture/Doors/WoodenGate/Click()
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
	if(usr.Function == "Interact")
		if(usr in range(1,src))
			if(usr.Dead)
				return
			if(src.density)
				src.density = 0
				src.icon_state = "gate open"
				view(5) << 'WoodDoor.wav'
				return
			if(src.density == 0)
				src.density = 1
				src.icon_state = "gate"
				view(5) << 'WoodDoor.wav'
				return
