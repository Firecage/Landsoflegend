/obj/Items/Misc/StoneForge
	icon = 'tools.dmi'
	icon_state = "forge"
	density = 1
	Type = "Not Lit"
	suffix = "Stuck"
	Material = "Stone"
	CanBeCrafted = 1

/obj/Items/Misc/StoneForge/Click()
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		if(src.Type == "Lit")
			if(src in range(1,usr))
				if(usr.Ref)
					var/obj/R = usr.Ref
					if(R.Type == "Ore" && R in usr)
						if(usr.Job == null)
							view(usr) << "<font color=yellow>[usr] places the [R] into the [src] and begins to smelt it into an ingot!!<br>"
							usr.Job = "MakeIngot"
							usr.CanMove = 0
							var/Time = 200 - usr.SmeltingSkill * 2
							if(Time <= 50)
								Time = 50
							spawn(Time)
								if(src && usr)
									if(src in range(1,usr))
										if(usr.Job == "MakeIngot")
											usr.Job = null
											R.loc = src
											usr.Weight -= R.Weight
											var/WontFail = prob(usr.SmeltingSkill + 30)
											if(src.Type != "Lit")
												WontFail = 0
											if(WontFail)
												if(usr.SmeltingSkill <= usr.SkillCap && usr.SmeltingSkill <= WorldSkillsCap)
													usr.SmeltingSkill += usr.SmeltingSkillMulti
												var/obj/Items/Resources/Ingot/I = new
												I.Material = R.Material
												I.icon_state = "[I.Material] ingot"
												I.name = "[I.Material] ingot"
												I.Weight = R.Weight - 2
												I.CraftPotential = R.CraftPotential
												I.loc = usr.loc
												usr << "<font color = yellow>You sucessfully create an [I] !<br>"
											else
												usr << "<font color = red>You fail to create an ingot!<br>"
												if(usr.SmeltingSkill <= usr.SkillCap && usr.SmeltingSkill <= WorldSkillsCap)
													usr.SmeltingSkill += usr.SmeltingSkillMulti / 2
												var/MakeMess = prob(50)
												if(MakeMess)
													var/obj/Items/Resources/Scrap/I = new
													I.Material = R.Material
													I.icon_state = "[I.Material] scrap"
													I.name = "[I.Material] scrap"
													I.Weight = R.Weight
													I.CraftPotential = R.CraftPotential / 2
													I.loc = usr.loc
													usr << "<font color = red>You create a [I] !<br>"
											usr.MovementCheck()
											del(R)
									else
										usr << "<font color = red>The forge was moved, job failed!<br>"
										usr.MovementCheck()
								else
									if(usr)
										usr << "<font color = red>The [src] was moved, job failed!<br>"
										usr.MovementCheck()
	if(usr.Job == null && src in usr.CreateList )
		if(usr.Ref)
			var/obj/O = usr.Ref
			if(O.Type != "SmallBrick")
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				usr << "<font color = red>You need Eight Small Bricks in order to create this item!<br>"
				return
			var/BrickNum = 0
			var/Bricks = list()
			for(var/obj/Items/Resources/Brick/B in usr)
				if(BrickNum != 8)
					BrickNum += 1
					Bricks += B
			if(BrickNum != 8)
				usr << "<font color = red>You need Eight Small Bricks in order to create this item!<br>"
				return
			if(BrickNum == 8 && O.Type == "SmallBrick")
				var/LOC = usr.loc
				usr.Job = "CreateForge"
				usr.CanMove = 0
				var/Time = 200 - usr.MasonarySkill * 1.5 - usr.Strength / 2 - usr.Intelligence
				if(Time <= 50)
					Time = 50
				usr.DeleteInventoryMenu()
				if(usr.InvenUp)
					usr.InvenUp = 0
				usr.ResetButtons()
				for(var/obj/HUD/B in usr.client.screen)
					if(B.Type == "Inventory")
						B.icon_state = "inv off"
				view(usr) << "<font color = yellow>[usr] begins to contruct the Small Bricks into a [src] !<br>"
				spawn(Time)
					if(usr)
						if(Bricks && usr.loc == LOC)
							BrickNum = 0
							Bricks = null
							Bricks = list()
							for(var/obj/Items/Resources/Brick/B in usr)
								if(BrickNum != 8)
									BrickNum += 1
									Bricks += B
							if(BrickNum == 8 && O && usr.Job == "CreateForge")
								var/Fail = prob(50 - usr.MasonarySkill - usr.Strength / 4 - usr.Intelligence / 2)
								usr.Job = null
								usr.MovementCheck()
								if(Fail)
									view(usr) << "<font color = yellow>[usr] fails at crafting a [src] !<br>"
									for(var/obj/I in Bricks)
										if(BrickNum != 0)
											BrickNum -= 1
											usr.Weight -= I.Weight
											del(I)
									usr.MasonarySkill += usr.MasonarySkillMulti / 2
									usr.GainStats(3,"Yes")
									return
								var/obj/W = new src.type(usr.loc)
								W.Material = O.Material
								W.Dura += usr.MasonarySkill * 2
								W.suffix = null
								for(var/obj/I in Bricks)
									if(BrickNum != 0)
										BrickNum -= 1
										usr.Weight -= I.Weight
										del(I)
								usr.MasonarySkill += usr.MasonarySkillMulti
								usr.GainStats(2,"Yes")
								view(usr) << "<font color = yellow>[usr] finishes creating the [W] !<br>"
								return
							else
								usr << "<font color = red>Small Bricks could not be found in your inventory, crafting failed!<br>"
								usr.MovementCheck()
								return
						else
							usr << "<font color = red>Small Bricks could not be found in your inventory, or you moved while creating the item. Crafting failed!<br>"
							usr.MovementCheck()
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
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		if(src.Type == "Lit")
			if(usr.Weapon)
				if(src in range(1,usr))
					var/obj/I = usr.Weapon
					if(I.Type == "Torch")
						view(usr) << "<font color = yellow>[usr] lights their [I] in the [src]!<br>"
						usr.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
						I.CarryState = "torch lit"
						I.EquipState = "torch lit equip"
						I.icon_state = I.EquipState
						I.Type = "Torch Lit"
						I.LightProc(usr)
						usr.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
						return
			if(usr.Weapon2)
				if(src in range(1,usr))
					var/obj/I = usr.Weapon2
					if(I.Type == "Torch")
						view(usr) << "<font color = yellow>[usr] lights their [I] in the [src]!<br>"
						usr.overlays-=image(I.icon,"[I.icon_state] left",I.ItemLayer)
						I.CarryState = "torch lit"
						I.EquipState = "torch lit equip left"
						I.icon_state = I.EquipState
						I.Type = "Torch Lit"
						I.LightProc(usr)
						usr.overlays+=image(I.icon,"[I.icon_state]",I.ItemLayer)
						return
		if(src in range(1,usr))
			if(usr.Ref == null)
				if(usr.Weapon)
					var/obj/I = usr.Weapon
					if(I.Type == "Torch Lit")
						if(src.Type != "Lit")
							var/Burn = 0
							for(var/obj/Items/Resources/Coal/C in src)
								Burn += 2000
								del(C)
							for(var/obj/Items/Resources/Charcoal/Ch in src)
								Burn += 500
								del(Ch)
							if(Burn >= 1)
								src.ForgeBurn(Burn)
								src.icon_state = "forge lit"
								src.Type = "Lit"
								src.desc = "This Stone Forge seems to be burning away nicely<br>"
							view(usr) << "<font color = yellow>[usr] places their [I] into the [src]!<br>"
					return
				if(usr.Weapon2)
					var/obj/I = usr.Weapon2
					if(I.Type == "Torch Lit")
						if(src.Type != "Lit")
							var/Burn = 0
							for(var/obj/Items/Resources/Coal/C in src)
								Burn += 2000
								del(C)
							for(var/obj/Items/Resources/Charcoal/Ch in src)
								Burn += 500
								del(Ch)
							if(Burn >= 1)
								src.ForgeBurn(Burn)
								src.icon_state = "forge lit"
								src.Type = "Lit"
								src.desc = "This Stone Forge seems to be burning away nicely<br>"
							view(usr) << "<font color = yellow>[usr] places their [I] into the [src]!<br>"
					return
			if(usr.Ref)
				var/obj/I = usr.Ref
				var/CanBurn = 0
				if(I.icon_state == "charcoal")
					CanBurn = 1
				if(I.icon_state == "Coal")
					CanBurn = 1
				if(CanBurn)
					view(usr) << "<font color = yellow>[usr] throws [I] into the [src]!<br>"
					I.loc = src
					usr.Weight -= I.Weight
					usr.Ref = null
					if(usr.InvenUp)
						usr.DeleteInventoryMenu()
						usr.CreateInventory()
					return


/obj/Items/Misc/Anvil
	icon = 'tools.dmi'
	icon_state = "anvil"
	Weight = 50
	density = 1
	suffix = "Stuck"
	CanBeCrafted = 1
	Material = "Iron"

/obj/Items/Misc/Anvil/Click()
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
					if(IngotNum == 5)
						break
				if(IngotNum != 5)
					usr << "<font color = red>You need five Ingots of the same Material to forge this item!<br>"
					return
				IngotNum = 0
				usr.Job = "Anvil"
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
									if(IngotNum == 5)
										break
						if(IngotNum == 5 && usr.Job == "Anvil")
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
											if(IngotNum != 5)
												IngotNum += 1
												usr.Weight -= I.Weight
												del(I)
										if(usr.ForgingSkill <= usr.SkillCap && usr.ForgingSkill <= WorldSkillsCap)
											usr.ForgingSkill += usr.ForgingSkillMulti / 2
										usr.GainStats(2)
										return
									var/obj/W = new src.type(usr.loc)
									W.Material = O.Material
									W.name = "[W.Material] [W.name]"
									W.suffix = null
									IngotNum = 0
									for(var/obj/I in Ingots)
										if(IngotNum != 5)
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
