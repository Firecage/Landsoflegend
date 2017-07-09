/obj/Items/Foods

/obj/Items/Foods/Click()
	if(usr.Dead == 0)
		if(usr.Function == "Interact")
			if(src in usr)
				if(src.ObjectType == "Berry")
					usr << "<font color = teal>Click a container you wish to add the Berry Juice to!<br>"
					usr.Ref = src
					return
		if(usr.Function == "Eat")
			if(src in usr)
				if(usr.Hunger <= src.Type)
					usr.Hunger += src.Type
				else
					usr << "<font color = green>You eat the [src], but you will need somthing a little better in order to sate your hunger!<br>"
					usr.Hunger += src.Type / 10
				if(usr.Hunger >= 100)
					usr.Hunger = 100
				view(usr) << "<font color =yellow>[usr] eats [src]!<br>"
				if(src.icon_state == "brain" && usr.Race == "Illithid")
					usr << "<font color = teal>You gain some Intelligence!<br>"
					if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
						usr.Intelligence += 0.2
				if(src.icon_state == "shroom")
					var/H = prob(15)
					if(H)
						usr << "<font color = purple>Y<font color = red>o<font color = yellow>u  <font color = red>F<font color = green>e<font color = yellow>e<font color = teal>l  <font color = blue>F<font color = yellow>u<font color = purple>n<font color = red>n<font color = green>y<br>"
						for(var/obj/HUD/GUI/ScreenOverlay/SO in usr.client.screen)
							SO.icon_state = "sick screen"
						usr.High(20)
				if(src.CookingFood == 1 && usr.CanEatRawMeats == 0)
					var/AlreadyIll = 0
					if("Ill" in usr.Afflictions)
						AlreadyIll = 1
					if(AlreadyIll == 0)
						usr.Afflictions += "Ill"
						usr.Illness(30)
				if(src.CookingFood == 1 && usr.CanEatRawMeats == 1)
					var/AlreadyIll = 0
					if("Ill" in usr.Afflictions)
						AlreadyIll = 1
					if(AlreadyIll == 0)
						var/GetsIll = prob(50)
						if(GetsIll)
							usr.Afflictions += "Ill"
							usr.Illness(20)
				usr.Weight -= src.Weight
				del(src)
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
				for(var/obj/Items/Resources/CampSite/CS in range(1,src))
					if(src.CookingFood == 1 && CS.OnFire && src.icon != 'Skeleton.dmi')
						src.Cook(src.loc,CS,usr,0,0)
						view(usr) << "<font color = yellow>[usr] places down a [src] to cook!<br>"
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

/obj/Items/Foods/Cake
	icon = 'food.dmi'
	icon_state = "cake"
	Type = 50
	Weight = 2

/obj/Items/Foods/Bread
	icon = 'food.dmi'
	icon_state = "bread"
	Type = 60
	Weight = 3

/obj/Items/Foods/FishFilet
	icon = 'food.dmi'
	icon_state = "filet"
	Type = 40
	Weight = 8
	CookingFood = 1

/obj/Items/Foods/Brain
	icon = 'food.dmi'
	icon_state = "brain"
	CookedState = "brain"
	Type = 33
	Weight = 3
	CookingFood = 1

/obj/Items/Foods/Kidney
	icon = 'food.dmi'
	icon_state = "kidney"
	CookedState = "kidney"
	Type = 10
	Weight = 1
	CookingFood = 1

/obj/Items/Foods/Spleen
	icon = 'food.dmi'
	icon_state = "spleen"
	CookedState = "spleen"
	Type = 15
	Weight = 1
	CookingFood = 1

/obj/Items/Foods/Intestines
	icon = 'food.dmi'
	icon_state = "intestines"
	CookedState = "intestines"
	Type = 33
	Weight = 3
	CookingFood = 1

/obj/Items/Foods/Heart
	icon = 'food.dmi'
	icon_state = "heart"
	CookedState = "heart"
	Type = 25
	Weight = 2
	CookingFood = 1

/obj/Items/Foods/RawMeat
	icon = 'food.dmi'
	icon_state = "meat2"
	CookedState = "cooked meat2"
	Type = 50
	Weight = 10
	CookingFood = 1

/obj/Items/Foods/RawMeatChunck
	icon = 'food.dmi'
	icon_state = "meat"
	CookedState = "cooked meat"
	Type = 50
	Weight = 10
	CookingFood = 1

/obj/Items/Foods/BlueBerries
	icon = 'food.dmi'
	icon_state = "blue berries"
	ObjectType = "Berry"
	Type = 12
	Weight = 1
	Red = 0
	Green = 0
	Blue = 200

/obj/Items/Foods/RedBerries
	icon = 'food.dmi'
	icon_state = "red berries"
	ObjectType = "Berry"
	Type = 12
	Weight = 1
	Red = 200
	Green = 0
	Blue = 0

/obj/Items/Foods/Mushroom
	icon = 'plants.dmi'
	icon_state = "shroom"
	Type = 24
	Weight = 1

/obj/Items/Foods/Mushroom/New()
	spawn(10)
		for(var/turf/T in locate(src.x,src.y,src.z))
			if(T.icon_state != "grass")
				if(T.icon_state != "ash floor")
					if(T.icon_state != "dirt")
						if(T.icon_state != "dirt road")
							del(src)
