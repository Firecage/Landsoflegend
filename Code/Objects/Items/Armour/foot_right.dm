/obj/Items/Armour/RightFoot

/obj/Items/Armour/RightFoot/Click()
	if(usr.Job == null && src.Material == "Bone" && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Material != "Bone")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Two piles of Bones in order to create this item!<br>"
				return
			var/BoneNum = 0
			var/Bones = list()
			for(var/obj/Items/Misc/Bones/B in usr)
				if(BoneNum != 2)
					BoneNum += 1
					Bones += B
			if(BoneNum != 2)
				usr << "<font color = red>You need Two piles of Bones in order to create this item!<br>"
				return
			if(BoneNum == 2 && O.Material == "Bone")
				var/LOC = usr.loc
				usr.Job = "MakeBoneItem"
				usr.CanMove = 0
				var/Time = 200 - usr.BoneCraftSkill * 1.5 - usr.Agility / 2 - usr.Intelligence / 2
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to contruct the Bone piles into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Bones && usr.loc == LOC)
							if(BoneNum == 2 && O && usr.Job == "MakeBoneItem")
								var/Fail = prob(50 - usr.BoneCraftSkill - usr.Agility / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									for(var/obj/I in Bones)
										if(BoneNum != 0)
											BoneNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.BoneCraftSkill += usr.BoneCraftMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.BoneCraftSkill * 2
								W.Defence += usr.BoneCraftSkill / 3
								W.suffix = null
								W.density = 0
								W.opacity = 0
								if(W.ObjectTag == "Armour")
									usr.CraftBoneArmour(O,W)
								for(var/obj/I in Bones)
									if(BoneNum != 0)
										BoneNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.BoneCraftSkill += usr.BoneCraftMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
								return
							else
								usr << "<font color = red>Bone piles could not be found in your inventory, crafting failed!<br>"
								usr.Job = null
								usr.MovementCheck()
								return
						else
							usr << "<font color = red>Bone piles could not be found in your inventory, or you moved while creating the item. Crafting failed!<br>"
							usr.Job = null
							usr.MovementCheck()
							return
	if(usr.Job == null && src.Material == "Leather" && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Material != "Leather")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Two Dry Leather Hides in order to create this item!<br>"
				return
			var/LeatherNum = 0
			var/Leathers = list()
			for(var/obj/Items/Resources/Skin/S in usr)
				if(S.Type == "Dry" && LeatherNum != 2)
					LeatherNum += 1
					Leathers += S
			if(LeatherNum != 2)
				usr << "<font color = red>You need Two Dry Leather Hides in order to create this item!<br>"
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
				if(usr.RightLeg)
					if(usr.WRightFoot == null)
						src.layer = src.ItemLayer
						src.suffix = "Equip"
						src.overlays += image(/obj/HUD/E/)
						src.icon_state = src.EquipState
						usr.WRightFoot = src
						usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
						src.layer = 20
						usr.DeleteInventoryMenu()
						usr.CreateInventory()
						return
		if(src.suffix == "Equip")
			if(src in usr)
				if(usr.WRightFoot == src)
					src.layer = src.ItemLayer
					usr.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
					usr.WRightFoot = null
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

/obj/Items/Armour/RightFoot/BoneBootRight
	icon = 'equipment.dmi'
	icon_state = "right bone boot"
	EquipState = "right bone boot"
	CarryState = "right bone boot"
	DefenceType = "Chain"
	Weight = 1
	Dura = 100
	ItemLayer = 4.6
	CantRaces = list("Giant","Cyclops","Human","Frogman","Alther","Stahlite","Wolfman","Snakeman","Illithid")
	Defence = 3
	Dura = 100
	Material = "Bone"
	CanBeCrafted = 1

/obj/Items/Armour/RightFoot/BoneBootRight/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/RightFoot/LeatherBootRight
	icon = 'equipment.dmi'
	icon_state = "leather boot right2"
	EquipState = "leather boot right2"
	CarryState = "leather boot right"
	DefenceType = "Leather"
	Material = "Leather"
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite","Snakeman")
	ItemLayer = 4.6
	Defence = 3
	CanBeCrafted = 1
	Dura = 100
	Fuel = 75
	Weight = 1

/obj/Items/Armour/RightFoot/LeatherBootRight/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/RightFoot/PriestsRightBoot
	icon = 'equipment.dmi'
	icon_state = "priest boot R"
	EquipState = "priest boot R"
	CarryState = "inquisitor priest boot R"
	DefenceType = "Plate"
	Weight = 8
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite","Wolfman","Snakeman","Illithid")
	Dura = 100
	ItemLayer = 4.6
	Defence = 20
	Delete = 1
	BaseMaterial = "Metal"

/obj/Items/Armour/RightFoot/PriestsRightBoot/New()
	src.icon_state = src.CarryState
	src.layer = 4
	src.RandomItemQuality()

/obj/Items/Armour/RightFoot/InquisitorsRightBoot
	icon = 'equipment.dmi'
	icon_state = "inquisitor right boot"
	EquipState = "inquisitor right boot"
	CarryState = "inquisitor boots right"
	DefenceType = "Plate"
	Weight = 8
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite","Wolfman","Snakeman","Illithid")
	Dura = 100
	ItemLayer = 4.6
	Defence = 20
	Delete = 1
	BaseMaterial = "Metal"

/obj/Items/Armour/RightFoot/InquisitorsRightBoot/New()
	src.icon_state = src.CarryState
	src.layer = 4
	src.RandomItemQuality()

/obj/Items/Armour/RightFoot/GiantChainBootRight
	icon = 'equipment.dmi'
	icon_state = "giant chainright boot"
	EquipState = "giant chainright boot"
	CarryState = "folded chain"
	DefenceType = "Chain"
	CantRaces = list("Stahlite","Ratling","Human","Alther","Frogman","Wolfman","Snakeman","Illithid")
	ItemLayer = 4.6
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 6

/obj/Items/Armour/RightFoot/GiantChainBootRight/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/RightFoot/GiantPlateBootRight
	icon = 'equipment.dmi'
	icon_state = "giant plateboot right"
	EquipState = "giant plateboot right"
	CarryState = "giant plateboot right"
	DefenceType = "Plate"
	CantRaces = list("Stahlite","Ratling","Human","Alther","Frogman","Wolfman","Snakeman","Illithid")
	ItemLayer = 4.6
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 7

/obj/Items/Armour/RightFoot/GiantPlateBootRight/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/RightFoot/SmallPlateBootRight
	icon = 'equipment.dmi'
	icon_state = "small plateboot right"
	EquipState = "small plateboot right"
	CarryState = "small plateboot right"
	DefenceType = "Plate"
	CantRaces = list("Giant","Cyclops","Ratling","Human","Alther","Frogman","Wolfman","Snakeman","Illithid")
	ItemLayer = 4.6
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 3

/obj/Items/Armour/RightFoot/SmallPlateBootRight/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/RightFoot/RatPlateBootRight
	icon = 'equipment.dmi'
	icon_state = "rat plateboot right"
	EquipState = "rat plateboot right"
	CarryState = "rat plateboot right"
	DefenceType = "Plate"
	CantRaces = list("Giant","Cyclops","Human","Frogman","Alther","Stahlite","Wolfman","Snakeman","Illithid")
	ItemLayer = 4.6
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 3

/obj/Items/Armour/RightFoot/RatPlateBootRight/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Armour/RightFoot/PlateBootRight
	icon = 'equipment.dmi'
	icon_state = "plateboot right"
	EquipState = "plateboot right"
	CarryState = "plateboot right"
	DefenceType = "Plate"
	CantRaces = list("Giant","Cyclops","Ratling","Stahlite","Snakeman","Illithid")
	ItemLayer = 4.6
	CanBeCrafted = 1
	BaseMaterial = "Metal"
	Weight = 5

/obj/Items/Armour/RightFoot/PlateBootRight/New()
	src.icon_state = src.CarryState
	src.layer = 4
