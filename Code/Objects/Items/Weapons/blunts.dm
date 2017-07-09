/obj/Items/Weapons/Blunts
	ObjectType = "Blunt"

/obj/Items/Weapons/Blunts/Click()
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
						if(O && usr.Job == "Forge")
							if(O in usr)
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
											del(O)
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
										if(W.ObjectTag == "Weapon")
											usr.CraftWeapon(O,W)
										W.icon_state = W.CarryState
										usr.Weight -= O.Weight
										del(O)
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
						else
							usr.MovementCheck()
							return
		return
	if(usr.Function == "Interact" && usr.Ref)
		if(isobj(usr.Ref))
			var/obj/O = usr.Ref
			if(O.Material == "Stone")
				if(src.suffix != "Equip")
					usr << "<font color = red>Equip the Hammer before continuing!<br>"
					return
				if(src.Dura <= 1)
					usr << "<font color = red>The Hammer is Broken, you can not do this job!<br>"
					return
				usr.MovementCheck()
				if(usr.CanMove)
					usr.CreateMasonaryMenu(O)
				return
			if(O.Type == "Ingot")
				if(src.suffix != "Equip")
					usr << "<font color = red>Equip the Hammer before continuing!<br>"
					return
				if(src.Dura <= 1)
					usr << "<font color = red>The Hammer is broken!<br>"
					return
				var/NearForge = null
				var/NearAnvil = null
				for(var/obj/Items/Misc/StoneForge/F in range(1,usr))
					if(NearForge == null)
						if(F.Type == "Lit")
							NearForge = F
							break
						else
							usr << "<font color = red>The near by Forge is not lit!<br>"
				for(var/obj/Items/Misc/Anvil/A in range(1,usr))
					NearAnvil = A
				if(NearForge && NearAnvil && usr.Job == null)
					usr.MovementCheck()
					if(usr.CanMove)
						usr.CreateForgeMenu(O)
					return
				else
					usr << "<font color = red>Need to be near both a Forge and Anvil!<br>"
			else
				if(O.Dura <= 33 && O.Material)
					if(src.suffix != "Equip")
						usr << "<font color = red>Equip the Hammer before continuing!<br>"
						return
					if(src.Dura <= 1)
						usr << "<font color = red>The Hammer is broken!<br>"
						return
					var/CanRepair = 0
					if(O.ObjectTag == "Weapon")
						CanRepair = 1
					if(O.ObjectTag == "Armour")
						CanRepair = 1
					if(CanRepair)
						var/NearForge = null
						var/NearAnvil = null
						for(var/obj/Items/Misc/StoneForge/F in range(1,usr))
							if(NearForge == null)
								if(F.Type == "Lit")
									NearForge = F
									break
								else
									usr << "<font color = red>The near by Forge is not lit!<br>"
						for(var/obj/Items/Misc/Anvil/A in range(1,usr))
							NearAnvil = A
						if(NearForge && NearAnvil && usr.Job == null)
							view(usr) << "<font color = yellow>[usr] begins to repair the [O]!<br>"
							usr.Job = "Repair"
							var/LOC = usr.loc
							var/Time = 250 - usr.ForgingSkill * 2 + usr.Strength / 2
							spawn(Time)
								if(usr)
									if(O && usr.Job == "Repair" && usr.loc == LOC)
										if(O in usr)
											var/Fail = prob(50 - usr.ForgingSkill - usr.Strength / 2 - usr.Agility / 2)
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
														var/DMG = prob(50)
														if(DMG)
															DMG = "They damage it slightly"
														view(usr) << "<font color = yellow>[usr] fails at repairing the [O]! [DMG] Quality removed.<br>"
														if(usr.ForgingSkill <= usr.SkillCap && usr.ForgingSkill <= WorldSkillsCap)
															usr.ForgingSkill += usr.ForgingSkillMulti / 4
														usr.GainStats(3)
														if(DMG)
															if(O.ObjectTag == "Armour" && O.Defence >= 1)
																O.Defence -= rand(1,3)
															if(O.ObjectTag == "Weapon" && O.Quality >= 1)
																O.Quality -= rand(1,3)
														return
													O.Dura += usr.ForgingSkill * 2 + usr.Strength + 2
													if(usr.ForgingSkill <= usr.SkillCap && usr.ForgingSkill <= WorldSkillsCap)
														usr.ForgingSkill += usr.ForgingSkillMulti
													usr.GainStats(3)
													view(usr) << "<font color = yellow>[usr] finishes repairing the [O] !<br>"
													return
												else
													usr << "<font color = red>The Anvil was moved, or you moved away from it, repair failed!<br>"
													usr.MovementCheck()
													return
											else
												usr << "<font color = red>The Forge was moved, or you moved away from it, or the forge was not lit, repair failed!<br>"
												usr.MovementCheck()
												return
										else
											usr.MovementCheck()
											return
									else
										usr.MovementCheck()
										return
		return
	if(usr.Function == "Interact" && usr.Ref == null)
		if(src.Type == "Shovel")
			usr << "<font color=green>Double Click turf to dig!<br>"
		else
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
					if(usr.Weapon == null)
						if(usr.Weapon2)
							var/HasShield = 0
							if(istype(usr.Weapon2,/obj/Items/Armour/Shields/))
								HasShield = 1
							if(HasShield == 0)
								return
						if(usr.RightArm >= 25)
							src.layer = 5
							src.suffix = "Equip"
							src.overlays += image(/obj/HUD/E/)
							src.icon_state = src.EquipState
							usr.Weapon = src
							usr.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
							src.layer = 20
							usr.DeleteInventoryMenu()
							usr.CreateInventory()
							return
						else
							usr << "<font color =red>You cant do that with a damaged arm!<br>"
							return
				if(usr.CurrentHand == "Left")
					if(usr.Weapon2 == null)
						if(usr.Weapon)
							var/HasShield = 0
							if(istype(usr.Weapon,/obj/Items/Armour/Shields/))
								HasShield = 1
							if(HasShield == 0)
								return
						if(usr.LeftArm >= 25)
							src.layer = 5
							src.suffix = "Equip"
							src.overlays += image(/obj/HUD/E/)
							src.icon_state = "[src.EquipState] left"
							usr.Weapon2 = src
							usr.overlays+=image(src.icon,"[src.icon_state]",src.ItemLayer)
							src.layer = 20
							usr.DeleteInventoryMenu()
							usr.CreateInventory()
							return
						else
							usr << "<font color =red>You cant do that with a damaged arm!<br>"
							return
		if(src.suffix == "Equip")
			if(src in usr)
				if(usr.Weapon == src && usr.CurrentHand == "Right")
					src.layer = 5
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
					src.layer = 5
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
			for(var/obj/Items/W in usr.CreateList)
				if(W.EquipState == src.EquipState && W.Material == src.Material)
					Known = 1
			if(Known == 0)
				if(src.CanBeCrafted)
					if(src.BaseMaterial == "Metal")
						var/Mats = list("Iron","Copper","Silver")
						for(var/M in Mats)
							var/obj/W = new src.type()
							W.Material = "[M]"
							W.CarryState = "[M] [W.icon_state]"
							W.EquipState = "[M] [W.EquipState] equip"
							W.icon_state = W.CarryState
							W.layer = 100
							usr.CreateList += W
					else
						var/obj/W = new src.type()
						W.Material = src.Material
						W.icon_state = src.CarryState
						W.EquipState = src.EquipState
						W.CarryState = src.CarryState
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
			src.overlays = null
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

/obj/Items/Weapons/Blunts/InquisitorsMaul
	icon = 'weapons.dmi'
	icon_state = "inquisitor maul2"
	EquipState = "inquisitor maul2"
	CarryState = "inquisitor maul"
	DamageType = "Blunt"
	Weight = 25
	Type = "Hammer"
	Dura = 100
	ItemLayer = 7
	Quality = 18
	TwoHander = 1
	Delete = 1
	Material = "Silver"

/obj/Items/Weapons/Blunts/InquisitorsMaul/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Weapons/Blunts/InquisitorsStaff
	icon = 'weapons.dmi'
	icon_state = "inquisitor staff2"
	EquipState = "inquisitor staff2"
	CarryState = "inquisitor staff"
	DamageType = "Blunt"
	Weight = 15
	ItemLayer = 7
	Dura = 100
	Quality = 15
	Delete = 1
	TwoHander = 1
	Material = "Silver"

/obj/Items/Weapons/Blunts/InquisitorsStaff/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Weapons/Blunts/Hammer
	icon = 'tools.dmi'
	icon_state = "hammer"
	EquipState = "hammer"
	CarryState = "hammer"
	DamageType = "Blunt"
	Type = "Hammer"
	CanBeCrafted = 1
	Quality = 5
	Weight = 5
	BaseMaterial = "Metal"

/obj/Items/Weapons/Blunts/Hammer/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Weapons/Blunts/Shovel
	icon = 'tools.dmi'
	icon_state = "shovel"
	EquipState = "shovel"
	CarryState = "shovel"
	DamageType = "Blunt"
	Type = "Shovel"
	CanBeCrafted = 1
	TwoHander = 1
	Weight = 4
	BaseMaterial = "Metal"

/obj/Items/Weapons/Blunts/Shovel/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Weapons/Blunts/Mace2
	name = "Mace"
	icon = 'weapons.dmi'
	icon_state = "mace2"
	EquipState = "mace2"
	CarryState = "mace2"
	DamageType = "Blunt"
	CanBeCrafted = 1
	Weight = 6
	BaseMaterial = "Metal"
/obj/Items/Weapons/Blunts/Mace2/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Weapons/Blunts/Mace
	icon = 'weapons.dmi'
	icon_state = "mace"
	EquipState = "mace"
	CarryState = "mace"
	DamageType = "Blunt"
	CanBeCrafted = 1
	Weight = 6
	BaseMaterial = "Metal"

/obj/Items/Weapons/Blunts/Mace/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Weapons/Blunts/Maul
	icon = 'weapons.dmi'
	icon_state = "maul"
	EquipState = "maul"
	CarryState = "maul"
	DamageType = "Blunt"
	CanBeCrafted = 1
	TwoHander = 1
	BaseMaterial = "Metal"
	Weight = 8

/obj/Items/Weapons/Blunts/Maul/New()
	src.icon_state = src.CarryState
	src.layer = 4

/obj/Items/Weapons/Blunts/Maul2
	name = "Maul"
	icon = 'weapons.dmi'
	icon_state = "maul2"
	EquipState = "maul2"
	CarryState = "maul2"
	DamageType = "Blunt"
	CanBeCrafted = 1
	TwoHander = 1
	Weight = 8
	BaseMaterial = "Metal"

/obj/Items/Weapons/Blunts/Maul2/New()
		src.icon_state = src.CarryState
		src.layer = 4
