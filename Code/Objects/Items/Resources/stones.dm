/obj/Items/Resources/Brick
	icon = 'materials.dmi'
	icon_state = "brick"
	Weight = 10
	Material = "Stone"
	Type = "SmallBrick"

/obj/Items/Resources/Brick/New()
	src.pixel_x = rand(-16,16)
	src.pixel_y = rand(-16,16)

/obj/Items/Resources/Brick/Click()
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		if(src.suffix == null)
			if(src in range(1,usr))
				var/obj/W = null
				var/CanDo = 0
				if(usr.Weapon)
					W = usr.Weapon
					if(W.Type == "Hammer")
						CanDo = 1
					else
						W = null
				if(usr.Weapon2 && W == null)
					W = usr.Weapon2
					if(W.Type == "Hammer")
						CanDo = 1
					else
						W = null
				if(CanDo && W)
					if(usr.Job == null)
						if(W.Dura <= 1)
							usr << "<font color = red>The [W] is Broken, you can not do this job!<br>"
							return
						view(usr) << "<font color=yellow>[usr] begins to hammer the brick into stone shards!<br>"
						W.Dura -= rand(0.5,1)
						usr.CheckWeaponDura(W)
						usr.Job = "MakeShards"
						usr.CanMove = 0
						var/Time = 150 - usr.MasonarySkill * 2
						if(Time <= 20)
							Time = 20
						spawn(Time)
							if(src && usr)
								if(src in range(1,usr))
									if(usr.Job == "MakeShards")
										usr.Job = null
										usr.MasonarySkill += usr.MasonarySkillMulti
										var/Shards = 2
										while(Shards)
											var/obj/Items/Resources/StoneShard/SS = new
											SS.loc = src.loc
											Shards -= 1
										usr.MovementCheck()
										del(src)
								else
									usr << "<font color = red>The brick was moved, job failed!<br>"
									usr.MovementCheck()
							else
								if(usr)
									usr << "<font color = red>The brick was moved, job failed!<br>"
									usr.MovementCheck()
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

	if(usr.Function == "PickUp")
		if(src.suffix == "Carried" && src in usr)
			src.overlays = null
			src.loc = usr.loc
			src.suffix = null
			src.layer = 4
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
		usr << "<font color=green>Click another object to interact with this one!<br>"
		usr.Ref = src
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

/obj/Items/Resources/LargeBrick
	icon = 'materials.dmi'
	icon_state = "large brick"
	Material = "Stone"
	Type = "LargeBrick"
	Weight = 40

/obj/Items/Resources/LargeBrick/New()
	src.pixel_x = rand(-16,16)
	src.pixel_y = rand(-16,16)

/obj/Items/Resources/LargeBrick/Click()
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
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		if(src.suffix == null)
			if(src in range(1,usr))
				var/obj/W = null
				var/CanDo = 0
				if(usr.Weapon)
					W = usr.Weapon
					if(W.Type == "Hammer")
						CanDo = 1
					else
						W = null
				if(usr.Weapon2 && W == null)
					W = usr.Weapon2
					if(W.Type == "Hammer")
						CanDo = 1
					else
						W = null
				if(CanDo && W)
					if(usr.Job == null)
						if(W.Dura <= 1)
							usr << "<font color = red>The [W] is Broken, you can not do this job!<br>"
							return
						view(usr) << "<font color=yellow>[usr] begins to hammer the large brick into smaller bricks!<br>"
						W.Dura -= rand(0.5,1)
						usr.CheckWeaponDura(W)
						usr.Job = "MakeBricks"
						usr.CanMove = 0
						var/Time = 150 - usr.MasonarySkill * 2
						if(Time <= 20)
							Time = 20
						spawn(Time)
							if(src && usr)
								if(src in range(1,usr))
									if(usr.Job == "MakeBricks")
										usr.Job = null
										view(usr) << "<font color=yellow>[usr] finishes hammering the large brick into smaller bricks!<br>"
										usr.MasonarySkill += usr.MasonarySkillMulti
										var/Bricks = 4
										var/ExtraBrick = prob(usr.MasonarySkill)
										if(ExtraBrick)
											Bricks += rand(1,4)
										while(Bricks)
											var/obj/Items/Resources/Brick/B = new
											B.loc = src.loc
											Bricks -= 1
										usr.MovementCheck()
										del(src)
								else
									usr << "<font color = red>The large brick was moved, job failed!<br>"
									usr.MovementCheck()
							else
								if(usr)
									usr << "<font color = red>The [src] was moved, job failed!<br>"
									usr.MovementCheck()
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

/obj/Items/Resources/StoneShard
	icon = 'materials.dmi'
	icon_state = "stone shard"
	Weight = 3

/obj/Items/Resources/StoneShard/New()
	src.pixel_x = rand(-16,16)
	src.pixel_y = rand(-16,16)

/obj/Items/Resources/StoneShard/Click()
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
	if(usr.Function == "Interact")
		if(src in usr)
			usr << "<font color=green>Click another object to interact with this one!<br>"
			usr.Function = "StoneShard"
			usr.Ref = src
			return
	if(usr.Function == "StoneShard")
		if(usr.Ref != src)
			usr << "<font color=green>You scratch the two Stone Shards together and create sparks!<br>"
			for(var/obj/Items/Misc/StoneForge/S in range(1,usr))
				if(S.Type != "Lit")
					var/Burn = 0
					for(var/obj/Items/Resources/Coal/C in S)
						Burn += 2000
					for(var/obj/Items/Resources/Charcoal/Ch in S)
						Burn += 500
					if(Burn >= 1)
						for(var/obj/Items/Resources/Coal/C in S)
							del(C)
						for(var/obj/Items/Resources/Charcoal/Ch in S)
							del(Ch)
						S.ForgeBurn(Burn)
						S.icon_state = "forge lit"
						S.Type = "Lit"
						S.desc = "This Stone Forge seems to be burning away nicely<br>"
						view(usr) << "<font color = yellow>[usr] lights the [S] using two [src]!<br>"
						return
			for(var/obj/Items/Resources/CampSite/C in range(1,usr))
				var/Succeed = prob(15)
				if(Succeed)
					if(C.icon_state != "campfire")
						if(C.Fuel)
							view(C) << "<font color=yellow>[C] sets on fire!<br>"
							C.icon_state = "campfire"
							C.OnFire = 1
							C.luminosity = 5
							C.CreateSmoke()
							C.Burn(0)
							usr.Ref = null
							usr.Function = null
							for(var/obj/Items/Foods/F in range(1,C))
								if(F.CookingFood == 1 && C.OnFire)
									F.Cook(F.loc,C,usr,0,0)
									view(6,F) << "<font color = yellow>The near by [F] begins to cook!<br>"
							for(var/turf/T in range(1,src))
								if(T.Material == "Wood")
									for(var/mob/M in Players)
										if(M.Admin)
											M << "<font color = teal><b>([usr.key])[usr] has lit a camp site on fire next to a wooden wall/floor at [usr.x],[usr.y],[usr.z]!<br>"
											usr.Log_player("<font color = red><b>([usr.key])[usr] lights a camp site on fire near wooden floor/wall at [usr.x],[usr.y],[usr.z]</font><br>")
	if(usr.Ref)
		var/obj/I = usr.Ref
		if(I.Material == "iron")
			usr << "<font color=green>You scratch the Iron Ore and the Stone Shard together and create sparks!<br>"
			for(var/obj/Items/Resources/CampSite/C in range(1,usr))
				if(C.icon_state != "campfire")
					if(C.Fuel)
						C.icon_state = "campfire"
						C.OnFire = 1
						view(C) << "<font color=yellow>[C] sets on fire!<br>"
						C.luminosity = 5
						C.CreateSmoke()
						C.Burn(0)
						usr.Ref = null
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
	if(usr.Function == "PickUp")
		if(src.suffix == "Carried" && src in usr)
			src.overlays = null
			src.loc = usr.loc
			src.suffix = null
			src.layer = 4
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

/obj/Items/Resources/Stone
	icon = 'materials.dmi'
	icon_state = "stone"

/obj/Items/Resources/Stone/Click()
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
	if(usr.Function == "Interact")
		if(usr.Fainted)
			usr << "<font color =red>You have fainted and cant do that!<br>"
			return
		if(usr.Stunned)
			usr << "<font color =red>You are stunned and cant do that!<br>"
			return
		if(src.suffix == null)
			if(src in range(1,usr))
				var/obj/W = null
				var/CanDo = 0
				if(usr.Weapon)
					W = usr.Weapon
					if(W.Type == "Hammer")
						CanDo = 1
					else
						W = null
				if(usr.Weapon2 && W == null)
					W = usr.Weapon2
					if(W.Type == "Hammer")
						CanDo = 1
					else
						W = null
				if(CanDo && W)
					if(usr.Job == null)
						if(W.Dura <= 1)
							usr << "<font color = red>The [W] is Broken, you can not do this job!<br>"
							return
						view(usr) << "<font color=yellow>[usr] begins to hammer the stone into a large brick!<br>"
						W.Dura -= rand(0.5,1)
						usr.CheckWeaponDura(W)
						usr.Job = "MakeBrick"
						usr.CanMove = 0
						var/Time = 150 - usr.MasonarySkill * 2
						if(Time <= 20)
							Time = 20
						spawn(Time)
							if(usr && src)
								if(src in range(1,usr))
									if(usr.Job == "MakeBrick")
										usr.Job = null
										view(usr) << "<font color=yellow>[usr] finishes hammering the stone into a large brick!<br>"
										usr.MasonarySkill += usr.MasonarySkillMulti
										var/Bricks = 1
										var/ExtraBrick = prob(usr.MasonarySkill)
										if(ExtraBrick)
											Bricks += 1
										while(Bricks)
											var/obj/Items/Resources/LargeBrick/B = new
											B.loc = src.loc
											Bricks -= 1
										usr.MovementCheck()
										del(src)
								else
									usr << "<font color = red>The stone was moved, job failed!<br>"
									usr.MovementCheck()
							else
								if(usr)
									usr << "<font color = red>The [src] was moved, job failed!<br>"
									usr.MovementCheck()
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
