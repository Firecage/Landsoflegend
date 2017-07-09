/obj/Items/Books_Scrolls
	icon = 'books.dmi'

/obj/Items/Books_Scrolls/WantedPoster
	icon_state = "wanted poster"
	Fuel = 30

/obj/Items/Books_Scrolls/WantedPoster/Click()
	if(usr.Function == "Examine")
		usr << "[src.desc]"

/obj/Items/Books_Scrolls/Parchment
	icon_state = "scroll"

/obj/Items/Books_Scrolls/World_Map
	icon_state = "scroll"

/obj/Items/Books_Scrolls/World_Map/Click()
	if(usr.Function == "Interact" && src.suffix)
		usr << browse(file("World.bmp"))
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

/obj/Items/Books_Scrolls/Book_of_Order
	Fuel = 30
	icon_state = "order book"
	desc = "This book is very powerful, it uses Astral Magic to Revive the fallen. To use it, just click Interact, then click the book, while standing over a body. The Human Priests think that their God of Order created it, but in fact, it was once an ordinary book, which was blessed by Human Priests. Because their faith in their God was so stern, Astral Magic was called forth and bound to the book, and so, it is considered Holy to the Human Empire. There is only One of these books in exsistance, its basically like the Orginal Bibal in terms of how Rare it is."

/obj/Items/Books_Scrolls/Book_of_Order/Click()
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
	if(usr.Function == "Interact" && src.suffix)
		if(usr.Fainted)
			return
		if(usr.Sleeping)
			return
		for(var/obj/Items/Body/B in range(0,usr))
			var/mob/HasOwner = null
			if(B.Owner)
				if(ismob(B.Owner))
					HasOwner = B.Owner
				else
					for(var/mob/M in Players)
						if(M.name == B.Owner)
							HasOwner = M
				if(HasOwner && HasOwner.CanBeRevived)
					view(usr) << "<font color = yellow>[usr] opens their Book of Order, and begins to use its Healing Magics that are written within to revive [B].<br>"
					if(usr.AstralMagic <= 20)
						usr.AstralMagic += usr.MagicPotentcy / 100
						if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
							usr.Intelligence += usr.IntelligenceMulti / 3
							var/Harm = prob(10)
							if(Harm)
								if(usr.LeftArm)
									usr.LeftArm -= rand(1,20)
									if(usr.LeftArm <= 1)
										usr.LeftArm = 1
									usr.Pain += rand(5,15)
								if(usr.RightArm)
									usr.RightArm -= rand(1,20)
									if(usr.RightArm <= 1)
										usr.RightArm = 1
									usr.Pain += rand(5,15)
								if(usr.RightLeg)
									usr.RightLeg -= rand(1,20)
									if(usr.RightLeg <= 1)
										usr.RightLeg = 1
									usr.Pain += rand(5,15)
								if(usr.LeftLeg)
									usr.LeftLeg -= rand(1,20)
									if(usr.LeftLeg <= 1)
										usr.LeftLeg = 1
									usr.Pain += rand(5,15)
								var/Num = rand(50)
								while(Num)
									Num -= 1
									var/obj/Misc/SpellEffects/Dispel/D = new
									D.loc = usr.loc
									D.MoveRand()
									spawn(50)
										if(D)
											del(D)
								usr.overlays += /obj/Misc/SpellEffects/Dispel/
								spawn(50)
									if(usr)
										usr.overlays -= /obj/Misc/SpellEffects/Dispel/
								view(6,usr) << "<font color = purple>[usr]'s body is wreaked with leathal Magical energies due to lack in skill with Astral Magic.<br>"
					else
						if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
							usr.Intelligence += usr.IntelligenceMulti / 6
					HasOwner.GoodRevive(B)
					HasOwner.Heal()
					if(HasOwner.client == null)
						HasOwner.PickUpObjects()
					del(B)
					if(HasOwner.Age >= HasOwner.DieAge)
						HasOwner.CanBeRevived -= 1
		return
	if(usr.Function == "Examine")
		usr << "<font color = teal>[src.desc]<br>"
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
			for(var/mob/M in Players)
				if(M.Admin)
					M << "<font color = teal><b>([usr.key])[usr] drops [src] at [src.x],[src.y],[src.z].<br>"
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
					for(var/mob/M in Players)
						if(M.Admin)
							M << "<font color = teal><b>([usr.key])[usr] picks up [src] at [src.x],[src.y],[src.z].<br>"
					return
				else
					usr << "<b>You cant carry too much weight!<br>"
					return
			else
				usr << "<b>You cant pick that item up!<br>"
				return

/obj/Items/Books_Scrolls/Book
	Fuel = 30
	icon_state = "plain book"
	desc = "A Plain and Empty Book."

/obj/Items/Books_Scrolls/Book/Click()
	if(usr.Function == "Interact" && usr.Fainted == 0 && usr.Stunned == 0 && src in usr)
		var/HasArms = 1
		if(usr.LeftArm <= 20 && usr.RightArm <= 20)
			HasArms = 0
		if(HasArms == 0)
			usr << "<font color = red>Your arms are either far too damaged, or missing!<br>"
			return
		if(usr.UsingBook == null)
			usr.UsingBook = src
			usr.Book()
			view() << "<font color = yellow>[usr] opens a book.<br>"
			return
		if(usr.UsingBook)
			usr.Delete("Book")
			for(var/obj/Misc/Spells/S in usr.client.screen)
				usr.client.screen -= S
			for(var/obj/Misc/SpellText/T in usr.client.screen)
				usr.client.screen -= T
			usr.UsingBook = null
			view() << "<font color = yellow>[usr] closes a book.<br>"
			return
	if(usr.Function == "Examine")
		usr << "<font color = teal>[src.desc]<br>"
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

/obj/Items/Books_Scrolls/Book_of_Necromancy
	Fuel = 30
	icon_state = "necromancy book"
	desc = "This book is very old and powerful. It can be used to either revive a pile of lifeless bones and a skull, to form a skeleton. Or it can be used to revive someone into a Zombie. To use it, just click Interact, then click the book, while standing over one of these things. This book once belonged to the first ever Lich, named Zarthor. It was a Human once, and once it had learned all it could from the God of Death, it wrote these secrets within this book. Its cover is created from the Hide of Demons, to bind the foul Magics within. The pages are made from Yew, and sometimes seap posion. It is more than likely than anyone who touches the book, will slowly turn down the Dark Path."

/obj/Items/Books_Scrolls/Book_of_Necromancy/Click()
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
	if(usr.Function == "Interact" && src.suffix)
		if(usr.Fainted)
			return
		if(usr.Sleeping)
			return
		var/obj/HasSkull = null
		var/obj/HasBones = null
		for(var/obj/Items/Misc/Skull/S in range(0,usr))
			if(S.suffix == null)
				HasSkull = S
				break
		for(var/obj/Items/Misc/Bones/B in range(0,usr))
			if(B.suffix == null)
				HasBones = B
				break
		if(HasSkull && HasBones)
			view(usr) << "<font color = purple>[usr] opens their [src] and begins to use its foul power to raise an undead minion!<br>"
			if(usr.Necromancery <= 20)
				usr.Necromancery += usr.MagicPotentcy / 100
				if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
					usr.Intelligence += usr.IntelligenceMulti / 3
				var/Harm = prob(15)
				if(Harm)
					if(usr.LeftArm)
						usr.LeftArm -= rand(1,20)
						if(usr.LeftArm <= 1)
							usr.LeftArm = 1
						usr.Pain += rand(5,15)
					if(usr.RightArm)
						usr.RightArm -= rand(1,20)
						if(usr.RightArm <= 1)
							usr.RightArm = 1
						usr.Pain += rand(5,15)
					if(usr.RightLeg)
						usr.RightLeg -= rand(1,20)
						if(usr.RightLeg <= 1)
							usr.RightLeg = 1
						usr.Pain += rand(5,15)
					if(usr.LeftLeg)
						usr.LeftLeg -= rand(1,20)
						if(usr.LeftLeg <= 1)
							usr.LeftLeg = 1
						usr.Pain += rand(5,15)
					var/Num = rand(50)
					while(Num)
						Num -= 1
						if(usr)
							var/obj/Misc/SpellEffects/Evil/D = new
							D.loc = usr.loc
							D.MoveRand()
							spawn(50)
								if(D)
									del(D)
					usr.overlays += /obj/Misc/SpellEffects/Evil/
					spawn(50)
						if(usr)
							usr.overlays -= /obj/Misc/SpellEffects/Evil/
					view(6,usr) << "<font color = purple>[usr]'s body is wreaked with leathal Magical energies due to lack in skill with Necromancery.<br>"
			else
				if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
					usr.Intelligence += usr.IntelligenceMulti / 6
			var/mob/NPC/Evil/Undead/Undead_Skeleton/S = new
			S.loc = usr.loc
			S.Strength += usr.Strength / 4 + usr.Necromancery / 4
			S.Agility += usr.Agility / 4 + usr.Necromancery / 4
			S.Endurance += usr.Endurance / 4 + usr.Necromancery / 4
			S.Faction = usr.Faction
			S.Dead = 1
			S.PickUpObjects()
			del(HasSkull)
			del(HasBones)
			spawn(20)
				if(S)
					S.Dead = 0
					S.Owner = usr
					S.FollowAI()
			return
		for(var/obj/Items/Body/B in range(0,usr))
			var/CanRes = 1
			if(B.LeftArm == 0 && B.RightArm == 0 && B.LeftLeg == 0 && B.RightLeg == 0)
				CanRes = 0
			if(B.Brain <= 20)
				CanRes = 0
			if(CanRes)
				var/mob/HasOwner = null
				if(B.Owner)
					if(ismob(B.Owner))
						HasOwner = B.Owner
					else
						for(var/mob/M in Players)
							if(M.name == B.Owner)
								HasOwner = M
					view(usr) << "<font color = purple>[usr] opens their [src] and begins to use its foul power to raise [B] to false life!<br>"
					if(usr.Necromancery <= 20)
						usr.Necromancery += usr.MagicPotentcy / 100
						if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
							usr.Intelligence += usr.IntelligenceMulti / 3
						var/Harm = prob(15)
						if(Harm)
							if(usr.LeftArm)
								usr.LeftArm -= rand(1,20)
								if(usr.LeftArm <= 1)
									usr.LeftArm = 1
								usr.Pain += rand(5,15)
							if(usr.RightArm)
								usr.RightArm -= rand(1,20)
								if(usr.RightArm <= 1)
									usr.RightArm = 1
								usr.Pain += rand(5,15)
							if(usr.RightLeg)
								usr.RightLeg -= rand(1,20)
								if(usr.RightLeg <= 1)
									usr.RightLeg = 1
								usr.Pain += rand(5,15)
							if(usr.LeftLeg)
								usr.LeftLeg -= rand(1,20)
								if(usr.LeftLeg <= 1)
									usr.LeftLeg = 1
								usr.Pain += rand(5,15)
							var/Num = rand(50)
							while(Num)
								Num -= 1
								if(usr)
									var/obj/Misc/SpellEffects/Evil/D = new
									D.loc = usr.loc
									D.MoveRand()
									spawn(50)
										if(D)
											del(D)
							usr.overlays += /obj/Misc/SpellEffects/Evil/
							spawn(50)
								if(usr)
									usr.overlays -= /obj/Misc/SpellEffects/Evil/
							view(6,usr) << "<font color = purple>[usr]'s body is wreaked with leathal Magical energies due to lack in skill with Necromancery.<br>"
					else
						if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
							usr.Intelligence += usr.IntelligenceMulti / 6
					if(HasOwner == null)
						var/mob/M = new
						HasOwner = M
					if(HasOwner)
						HasOwner.Target = null
						HasOwner.Strength += usr.Necromancery / 4
						HasOwner.Endurance += usr.Necromancery / 4
						HasOwner.Agility += usr.Necromancery / 4
						HasOwner.StrCap += usr.Necromancery / 4
						HasOwner.EndCap += usr.Necromancery / 4
						HasOwner.AgilCap += usr.Necromancery / 4
						HasOwner.EvilRevive(B)
						del(B)
	if(usr.Function == "Examine")
		usr << "<font color = teal>[src.desc]<br>"
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
			for(var/mob/M in Players)
				if(M.Admin)
					M << "<font color = teal><b>([usr.key])[usr] drops [src] at [src.x],[src.y],[src.z].<br>"
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
					for(var/mob/M in Players)
						if(M.Admin)
							M << "<font color = teal><b>([usr.key])[usr] picks up [src] at [src.x],[src.y],[src.z].<br>"
					return
				else
					usr << "<b>You cant carry too much weight!<br>"
					return
			else
				usr << "<b>You cant pick that item up!<br>"
				return
