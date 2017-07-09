/obj/Items/Armour/Shields
	Type = "Shield"

/obj/Items/Armour/Shields/Click()
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
					if(IngotNum == 1)
						break
				if(IngotNum != 1)
					usr << "<font color = red>You need one Ingot of the same Material to forge this item!<br>"
					return
				IngotNum = 0
				usr.Job = "Forge"
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
				view(usr) << "<font color = yellow>[usr] begins to forge the [O] into a [O.Material] [src] !<br>"
				spawn(Time)
					if(usr)
						if(Ingots)
							for(var/obj/I in Ingots)
								if(I in usr)
									IngotNum += 1
									if(IngotNum == 1)
										break
						if(IngotNum == 1 && usr.Job == "Forge")
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
											if(IngotNum != 1)
												IngotNum += 1
												usr.Weight -= I.Weight
												del(I)
										if(usr.ForgingSkill <= usr.SkillCap && usr.ForgingSkill <= WorldSkillsCap)
											usr.ForgingSkill += usr.ForgingSkillMulti / 2
										usr.GainStats(2)
										return
									var/obj/W = new src.type(usr.loc)
									W.icon = src.icon
									W.EquipState = src.EquipState
									W.CarryState = src.CarryState
									W.Material = O.Material
									W.name = "[W.Material] [W.name]"
									if(W.ObjectTag == "Armour")
										usr.CraftArmour(O,W)
									W.icon_state = W.CarryState
									IngotNum = 0
									for(var/obj/I in Ingots)
										if(IngotNum != 1)
											IngotNum += 1
											usr.Weight -= I.Weight
											del(I)
									if(usr.ForgingSkill <= usr.SkillCap && usr.ForgingSkill <= WorldSkillsCap)
										usr.ForgingSkill += usr.ForgingSkillMulti
									usr.GainStats(2)
									view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
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
			if(src in usr)
				if(src.Dura <= 0)
					usr << "<font color = red>[src] is broken, you cant use that!<br>"
					return
				if(usr.CurrentHand == "Right")
					if(usr.RightArm <= 25)
						usr << "<font color = red>Your right arm is damaged!<br>"
						return
					if(usr.Weapon2)
						var/obj/W = usr.Weapon2
						if(W.ObjectType == "Ranged")
							usr << "<font color = red>You can not equip anything else while using a two handed weapon!<br>"
							return
					if(usr.Weapon == null)
						src.layer = src.ItemLayer
						src.suffix = "Equip"
						src.overlays += image(/obj/HUD/E/)
						src.icon_state = "[src.CarryState] equip"
						usr.Weapon = src
						usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
						src.layer = 20
						usr.DeleteInventoryMenu()
						usr.CreateInventory()
						return
				if(usr.CurrentHand == "Left")
					if(usr.LeftArm <= 25)
						usr << "<font color = red>Your left arm is damaged!<br>"
						return
					if(usr.Weapon)
						var/obj/W = usr.Weapon
						if(W.ObjectType == "Ranged")
							usr << "<font color = red>You can not equip anything else while using a two handed weapon!<br>"
							return
					if(usr.Weapon2 == null)
						src.layer = src.ItemLayer
						src.suffix = "Equip"
						src.overlays += image(/obj/HUD/E/)
						src.icon_state = "[src.CarryState] equip left"
						usr.Weapon2 = src
						usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
						src.layer = 20
						usr.DeleteInventoryMenu()
						usr.CreateInventory()
						return
		if(src.suffix == "Equip")
			if(src in usr)
				if(usr.Weapon == src && usr.CurrentHand == "Right")
					src.layer = src.ItemLayer
					usr.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
					usr.Weapon = null
					src.suffix = "Carried"
					src.overlays-=image(/obj/HUD/E/)
					src.overlays+=image(/obj/HUD/C/)
					src.icon_state = src.CarryState
					src.layer = 20
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					return
				if(usr.Weapon2 == src && usr.CurrentHand == "Left")
					src.layer = src.ItemLayer
					usr.overlays-=image(src.icon,"[src.icon_state]",src.ItemLayer)
					usr.Weapon2 = null
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
		if(src in usr)
			var/Known = 0
			for(var/obj/Items/A in usr.CreateList)
				if(A.EquipState == src.EquipState && A.Material == src.Material)
					Known = 1
			if(Known == 0)
				if(src.CanBeCrafted)
					if(src.BaseMaterial == "Metal")
						var/Mats = list("Iron","Gold","Copper")
						for(var/M in Mats)
							var/obj/A = new src.type()
							A.Material = "[M]"
							A.CarryState = "[M] [A.icon_state]"
							A.EquipState = "[M] [A.EquipState] equip"
							A.icon_state = A.CarryState
							A.layer = 100
							usr.CreateList += A
					else
						var/obj/A = new src.type()
						A.Material = src.Material
						A.icon_state = src.CarryState
						A.EquipState = src.EquipState
						A.CarryState = src.CarryState
						A.layer = 100
						usr.CreateList += A
					usr << "<font color = blue>You take a good look at the [src] and decide that, if needed, you could create one!<br>"
				else
					usr << "<font color = red>You take a good look at the [src] but have no idea how to create one...<br>"
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

/obj/Items/Armour/Shields/WoodenBuckler
	icon = 'shields.dmi'
	icon_state = "wooden buckler equip"
	EquipState = "wooden buckler equip"
	CarryState = "wooden buckler"
	DefenceType = "Chain"
	Weight = 3
	Dura = 100
	ItemLayer = 5
	Defence = 3
	Fuel = 50

/obj/Items/Armour/Shields/WoodenBuckler/New()
	src.icon_state = src.CarryState
	src.layer = 4
	src.RandomItemQuality()

/obj/Items/Armour/Shields/Shield
	icon = 'shields.dmi'
	icon_state = "shield"
	EquipState = "shield"
	CarryState = "shield"
	DefenceType = "Plate"
	ItemLayer = 5
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 7

/obj/Items/Armour/Shields/Shield/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Shields/Torch
	icon = 'tools.dmi'
	icon_state = "torch equip"
	EquipState = "torch equip"
	CarryState = "torch"
	Weight = 2
	Fuel = 25
	Dura = 500
	Type = "Torch"
	ItemLayer = 5

/obj/Items/Armour/Shields/Torch/New()
	src.icon_state = src.CarryState
	src.layer = 4