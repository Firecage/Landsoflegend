/obj/Items/Armour/Chest

/obj/Items/Armour/Chest/Click()
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
					if(IngotNum == 2)
						break
				if(IngotNum != 2)
					usr << "<font color = red>You need two Ingot of the same Material to forge this item!<br>"
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
									if(IngotNum == 2)
										break
						if(IngotNum == 2 && usr.Job == "Forge")
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
											if(IngotNum != 2)
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
										if(IngotNum != 2)
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
				if(usr.Race in src.CantRaces)
					usr << "<font color = red>Your race cant wear that item!<br>"
					return
				if(src.Dura <= 0)
					usr << "<font color = red>[src] is broken, you cant use that!<br>"
					return
				if(usr.WChest == null)
					src.layer = src.ItemLayer
					src.suffix = "Equip"
					src.overlays += image(/obj/HUD/E/)
					src.icon_state = src.EquipState
					usr.WChest = src
					usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
					src.layer = 20
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
					return
		if(src.suffix == "Equip")
			if(src in usr)
				if(usr.WChest == src)
					src.layer = src.ItemLayer
					usr.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
					usr.WChest = null
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

/obj/Items/Armour/Chest/KingsRobe
	icon = 'clothes.dmi'
	icon_state = "kings robe"
	EquipState = "kings robe"
	CarryState = "folded kings robe"
	DefenceType = "Cloth"
	Weight = 1
	Dura = 100
	Fuel = 50
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite")
	ItemLayer = 4.5
	Defence = 1

/obj/Items/Armour/Chest/KingsRobe/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/Robe
	icon = 'clothes.dmi'
	icon_state = "robe"
	EquipState = "robe"
	CarryState = "folded cloth"
	DefenceType = "Cloth"
	Weight = 1
	Dura = 100
	Fuel = 50
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite")
	ItemLayer = 4.5
	Defence = 1

/obj/Items/Armour/Chest/Robe/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/WitchHunterTrenchCoat
	icon = 'clothes.dmi'
	icon_state = "witch hunter trench"
	EquipState = "witch hunter trench"
	CarryState = "folded trench"
	DefenceType = "Cloth"
	Weight = 1
	Dura = 100
	Fuel = 50
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite")
	ItemLayer = 4.5
	Defence = 1

/obj/Items/Armour/Chest/WitchHunterTrenchCoat/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/DesertRobe
	icon = 'clothes.dmi'
	icon_state = "desert robe"
	EquipState = "desert robe"
	CarryState = "folded desert robe"
	DefenceType = "Cloth"
	Weight = 1
	Dura = 100
	Fuel = 50
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite")
	ItemLayer = 4.5
	Defence = 1

/obj/Items/Armour/Chest/DesertRobe/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/PriestRobe
	icon = 'clothes.dmi'
	icon_state = "priest robe"
	EquipState = "priest robe"
	CarryState = "folded priest robe"
	DefenceType = "Cloth"
	Weight = 1
	Dura = 100
	Fuel = 50
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite")
	ItemLayer = 4.5
	Defence = 1

/obj/Items/Armour/Chest/PriestRobe/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/ChainShirt
	icon = 'equipment.dmi'
	icon_state = "chainshirt"
	EquipState = "chainshirt"
	CarryState = "folded chain"
	DefenceType = "Chain"
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite")
	ItemLayer = 4.3
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 5

/obj/Items/Armour/Chest/ChainShirt/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/GiantChainShirt
	icon = 'equipment.dmi'
	icon_state = "giant chainshirt"
	EquipState = "giant chainshirt"
	CarryState = "folded chain"
	DefenceType = "Chain"
	CantRaces = list("Human","Alther","Ratling","Frogman","Stahlite","Wolfman","Snakeman")
	ItemLayer = 4.3
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 7

/obj/Items/Armour/Chest/GiantChainShirt/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/RatChainShirt
	icon = 'equipment.dmi'
	icon_state = "rat chainshirt"
	EquipState = "rat chainshirt"
	CarryState = "folded chain"
	DefenceType = "Chain"
	CantRaces = list("Giant","Cyclops","Stahlite","Human","Alther","Frogman","Wolfman","Snakeman","Illithid")
	ItemLayer = 4.3
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 3

/obj/Items/Armour/Chest/RatChainShirt/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/Chest/SmallChainShirt
	icon = 'equipment.dmi'
	icon_state = "small chainshirt"
	EquipState = "small chainshirt"
	CarryState = "folded chain"
	DefenceType = "Chain"
	CantRaces = list("Giant","Cyclops","Ratling","Human","Alther","Frogman","Wolfman","Snakeman","Illithid")
	ItemLayer = 4.3
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 4

/obj/Items/Armour/Chest/SmallChainShirt/New()
	src.icon_state = src.CarryState
	src.layer = 4
