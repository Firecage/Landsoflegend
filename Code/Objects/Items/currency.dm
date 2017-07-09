/obj/Items/Currency
	icon = 'misc.dmi'

/obj/Items/Currency/GoldCoin
	icon_state = "gold coin"
	Weight = 0
	Type = 1

/obj/Items/Currency/GoldCoin/Click()
	if(usr.Function == "Transfer")
		if(usr.Container)
			var/obj/C = usr.Container
			if(src.suffix == "Carried")
				if(src in C)
					if(C in range(1,usr))
						if(usr.Weight <= usr.WeightMax)
							var/Num=input(usr,"How many coins do you wish to move from this [src.Type] coin pile?")as num
							if(Num <= 1)
								return
							if(Num >= src.Type + 1)
								return
							if(Num && usr.Container && src in C)
								usr << "You moved [Num] Gold Coins from [C] to your inventory!<br>"
								var/CoinsAlready = 0
								for(var/obj/Items/Currency/GoldCoin/G in usr)
									CoinsAlready = 1
								if(CoinsAlready == 0)
									var/obj/Items/Currency/GoldCoin/G = new
									G.Type = Num
									src.Type -= Num
									G.CoinAdjust()
									src.CoinAdjust()
									G.loc = usr
									G.suffix = "Carried"
									G.name = "[G.Type] Gold Coins"
									src.name = "[src.Type] Gold Coins"
								else
									for(var/obj/Items/Currency/GoldCoin/G in usr)
										G.Type += Num
										src.Type -= Num
										G.CoinAdjust()
										src.CoinAdjust()
										src.name = "[src.Type] Gold Coins"
										G.name = "[G.Type] Gold Coins"
								usr.DeleteInventoryMenu()
								if(usr.InvenUp)
									usr.CreateInventory()
								usr.CreateContainerContents(C)
								if(src.Type == 0)
									del(src)
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
							var/Num=input(usr,"How many coins do you wish to move from this [src.Type] coin pile?")as num
							if(Num <= 1)
								return
							if(Num >= src.Type + 1)
								return
							if(Num && usr.Container && src in usr)
								usr << "You moved [Num] Gold Coins from your inventory to [C]!<br>"
								var/CoinsAlready = 0
								for(var/obj/Items/Currency/GoldCoin/G in C)
									CoinsAlready = 1
								if(CoinsAlready == 0)
									var/obj/Items/Currency/GoldCoin/G = new
									G.Type = Num
									src.Type -= Num
									G.CoinAdjust()
									src.CoinAdjust()
									G.loc = C
									G.suffix = "Carried"
									G.name = "[G.Type] Gold Coins"
									src.name = "[src.Type] Gold Coins"
								else
									for(var/obj/Items/Currency/GoldCoin/G in C)
										G.Type += Num
										src.Type -= Num
										G.CoinAdjust()
										src.CoinAdjust()
										src.name = "[src.Type] Gold Coins"
										G.name = "[G.Type] Gold Coins"
								usr.DeleteInventoryMenu()
								if(usr.InvenUp)
									usr.CreateInventory()
								usr.CreateContainerContents(C)
								if(src.Type == 0)
									del(src)
								return
						else
							usr << "<b>[C] is carrying enough already!<br>"
							return
	if(usr.Function == "Interact")
		if(src.suffix == "Carried" && src.Type >= 1 && src in usr)
			var/Num=input(usr,"How many coins do you wish to seperate from this [src.Type] coin pile?")as num
			if(Num <= 1)
				return
			if(Num >= src.Type)
				return
			if(Num && src in usr)
				var/obj/Items/Currency/GoldCoin/C = new
				C.Type = Num
				src.Type -= Num
				C.CoinAdjust()
				src.CoinAdjust()
				C.loc = usr.loc
				C.suffix = null
				C.name = "[C.Type] Gold Coins"
				src.name = "[src.Type] Gold Coins"
				if(usr.InvenUp)
					usr.DeleteInventoryMenu()
					usr.InvenUp = 0
				return
	if(usr.Function == "PickUp")
		if(src.suffix == "Carried" && src in usr)
			src.loc = usr.loc
			src.suffix = null
			src.layer = 4
			src.overlays = null
			usr.client.screen -= src
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
					src.overlays+=image(/obj/HUD/C/)
					for(var/obj/Items/Currency/C in usr)
						if(src != C)
							src.Type += C.Type
							src.CoinAdjust()
							src.name = "[src.Type] Gold Coins"
							del(C)
					if(usr.InvenUp)
						usr.DeleteInventoryMenu()
						usr.CreateInventory()
					view() << "<b>[usr] picks up some gold coins.<br>"
					return
				else
					usr << "<b>You cant carry too much weight!<br>"
					return
			else
				usr << "<b>You cant pick that item up!<br>"
				return
