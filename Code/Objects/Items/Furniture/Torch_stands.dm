/obj/Items/Furniture/Misc/TorchStand
	icon = 'tools.dmi'
	icon_state = "torch stand"
	name = "Torch Stand"
	Weight = 8
	BaseMaterial = "Metal"

/obj/Items/Furniture/Misc/TorchStand/New()
	if(src.dir == NORTH)
		src.pixel_y = 32
	if(src.dir == SOUTH)
		src.pixel_y = -32
	if(src.dir == EAST)
		src.pixel_x = 32
	if(src.dir == WEST)
		src.pixel_x = -32

/obj/Items/Furniture/Misc/TorchStand/Click()
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
										W.Material = O.Material
										W.name = "[W.Material] [W.name]"
										W.icon_state = "[W.Material] [W.icon_state]"
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
	if(usr.Function == "Examine")
		usr << "<font color=teal>[src.desc]"
		var/Known = 0
		for(var/obj/Items/W in usr.CreateList)
			if(W.type == src.type)
				Known = 1
		if(Known == 0)
			if(src.CanBeCrafted)
				if(src.BaseMaterial == "Metal")
					var/Mats = list("Iron","Copper","Gold","Silver")
					for(var/M in Mats)
						var/obj/Items/Furniture/Misc/TorchStand/S = new
						S.Material = "[M]"
						S.icon_state = "[M] [S.icon_state]"
						S.layer = 100
						usr.CreateList += S
				usr << "<font color = blue>You take a good look at the [src] and decide that, if needed, you could create one!<br>"
			else
				usr << "<font color = red>You take a good look at the [src] but have no idea how to create one...<br>"
		return

/obj/Items/Furniture/Misc/WallTorch
	icon = 'tools.dmi'
	icon_state = "torch stand lit"
	name = "Wall Torch"
	suffix = "Stuck"
	Weight = 4
	luminosity = 5
	BaseMaterial = "Metal"
	Material = "Iron"
	Fuel = 35

/obj/Items/Furniture/Misc/WallTorch/New()
	if(src.dir == NORTH)
		src.pixel_y = 32
	if(src.dir == SOUTH)
		src.pixel_y = -32
	if(src.dir == EAST)
		src.pixel_x = 32
	if(src.dir == WEST)
		src.pixel_x = -32

/obj/Items/Furniture/Misc/WallTorch/Click()
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		if(usr.Weapon)
			if(src in range(1,usr))
				var/obj/I = usr.Weapon
				if(I.Type == "Torch")
					view(usr) << "<font color = yellow>[usr] lights their [I] on the [src]!<br>"
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
					view(usr) << "<font color = yellow>[usr] lights their [I] on the [src]!<br>"
					usr.overlays-=image(I.icon,"[I.icon_state] left",I.ItemLayer)
					usr.overlays-=image(I.icon,"[I.icon_state]",I.ItemLayer)
					I.CarryState = "torch lit"
					I.EquipState = "torch lit equip left"
					I.icon_state = I.EquipState
					I.Type = "Torch Lit"
					I.LightProc(usr)
					usr.overlays+=image(I.icon,"[I.icon_state]",I.ItemLayer)
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
		var/Known = 0
		for(var/obj/Items/Furniture/Misc/TorchStand/W in usr.CreateList)
			Known = 1
		if(Known == 0)
			var/Mats = list("Iron","Copper","Gold","Silver")
			for(var/M in Mats)
				var/obj/Items/Furniture/Misc/TorchStand/S = new
				S.Material = "[M]"
				S.icon_state = "[M] torch stand"
				S.layer = 100
				usr.CreateList += S
			usr << "<font color = blue>You take a good look at the [src] and decide that, if needed, you could create one!<br>"
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

/obj/Items/Furniture/Misc/TempleCandle
	icon = 'misc.dmi'
	icon_state = "temple candle lit"
	Weight = 5
	luminosity = 3

/obj/Items/Furniture/Misc/TempleCandle/Click()
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		if(usr.Weapon)
			if(src in range(1,usr))
				var/obj/I = usr.Weapon
				if(I.Type == "Torch")
					view(usr) << "<font color = yellow>[usr] lights their [I] on the [src]!<br>"
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
					view(usr) << "<font color = yellow>[usr] lights their [I] on the [src]!<br>"
					usr.overlays-=image(I.icon,"[I.icon_state] left",I.ItemLayer)
					I.CarryState = "torch lit"
					I.EquipState = "torch lit equip left"
					I.icon_state = I.EquipState
					I.Type = "Torch Lit"
					I.LightProc(usr)
					usr.overlays+=image(I.icon,"[I.icon_state]",I.ItemLayer)
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
