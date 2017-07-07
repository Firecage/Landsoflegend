/mob/Bump(atom/a)
	if(isobj(a))
		var/obj/O = a
		if(O.density && O.icon_state == "gate" && src.client == null && src.Humanoid)
			if(O.Type != "Busy")
				O.GateFunctions("Open")
		if(O.density && O.Type == "Hole" && O.GoesTo)
			src.overlays -= /obj/Misc/Swim/
			src.InWater = 0
			var/Fall = 100 - src.Agility
			if(src.client == null && src.Humanoid)
				Fall = 0
			var/Falls = prob(Fall)
			if(Falls)
				view(6,src) << "<font color = yellow>[src] falls down a Hole!<br>"
				src.Move(O.GoesTo)
				src.overlays -= /obj/Misc/Bubbles/
				src.overlays -= /obj/Misc/Swim/
				src.InWater = 0
				if(src.Dead == 0)
					src.HitObject()
			else
				if(src.client == null)
					view(6,src) << "<font color = yellow>[src] avoids the Hole!<br>"
				src.Move(O.loc)
	if(src.UnderTK)
		if(a.density && a != src.LastHit)
			src.LastHit = a
			var/mob/M = src.UnderTK
			view(6,src) << "<font color = red>[M] slams [src] into a [a]!"
			M.Sleep -= 3
			var/Dmg = M.Intelligence / 5
			if(ismob(a))
				var/mob/Z = a
				if(Z.Stunned == 0)
					var/Stun = prob(25)
					if(Stun && Z.Fainted == 0)
						Z.Stunned = 1
						Z.CanMove = 0
						Z.Stun()
						view(6,src) << "<font color=red>[Z] has been stunned!<br>"
			if(M.client)
				if(M.client.eye != M)
					M.Sleep -= 5
			if(src.Stunned == 0)
				var/Stun = prob(25)
				if(Stun && src.Fainted == 0)
					src.Stunned = 1
					src.CanMove = 0
					src.Stun()
					view(6,src) << "<font color=red>[src] has been stunned!<br>"
				if(src.Humanoid)
					if(src.Weapon)
						var/Drop = prob(100 - src.Agility * 2)
						if(Drop)
							var/obj/I = src.Weapon
							view(src) << "<font color = red>[src] loses hold of their [I]!<br>"
							src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
							I.Move(src.loc)
							I.overlays = null
							I.suffix = null
							I.icon_state = I.CarryState
							src.Weight -= I.Weight
							src.Weapon = null
							if(src.client)
								src.client.screen -= I
							if(I.Delete)
								del(I)
					if(src.Weapon2)
						var/Drop = prob(100 - src.Agility * 2)
						if(Drop)
							var/obj/I = src.Weapon2
							view(src) << "<font color = red>[src] loses hold of their [I]!<br>"
							src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
							src.overlays-=image(I.icon,"[I.icon_state] left",I.ItemLayer)
							I.Move(src.loc)
							I.overlays = null
							I.suffix = null
							I.icon_state = I.CarryState
							src.Weight -= I.Weight
							src.Weapon2 = null
							if(src.client)
								src.client.screen -= I
							if(I.Delete)
								del(I)
					if(src.LeftLeg && src.Race != "Snakeman")
						var/Harm = 33
						if(src.WLeftFoot)
							var/obj/O = src.WLeftFoot
							Harm -= O.Defence
						var/Harms = prob(Harm)
						if(Harms)
							src.Blood -= Dmg / 1.5
							src.LeftLeg -= Dmg
							if(src.LeftLeg <= 10)
								src.LeftLeg = 10
							src.AddGore("LeftLeg",src.Race)
							src.Pain += Dmg / 2
							src.Bleed()
							view(6,src) << "<font color=red>[src]'s Left Leg is hurt!"
					if(src.RightLeg && src.Race != "Snakeman")
						var/Harm = 33
						if(src.WRightFoot)
							var/obj/O = src.WRightFoot
							Harm -= O.Defence
						var/Harms = prob(Harm)
						if(Harms)
							src.Blood -= Dmg / 1.5
							src.RightLeg -= Dmg
							if(src.RightLeg <= 10)
								src.RightLeg = 10
							src.AddGore("RightLeg",src.Race)
							src.Pain += Dmg / 2
							src.Bleed()
							view(6,src) << "<font color=red>[src]'s Right Leg is hurt!"
					if(src.LeftArm)
						var/Harm = 33
						if(src.WLeftHand)
							var/obj/O = src.WLeftHand
							Harm -= O.Defence
						var/Harms = prob(Harm)
						if(Harms)
							src.Blood -= Dmg / 1.5
							src.LeftArm -= Dmg
							if(src.LeftArm <= 10)
								src.LeftArm = 10
							src.AddGore("LeftArm",src.Race)
							src.Pain += Dmg / 2
							src.Bleed()
							view(6,src) << "<font color=red>[src]'s Left Arm is hurt!"
					if(src.RightArm)
						var/Harm = 33
						if(src.WRightHand)
							var/obj/O = src.WRightHand
							Harm -= O.Defence
						var/Harms = prob(Harm)
						if(Harms)
							src.Blood -= Dmg / 1.5
							src.RightArm -= Dmg
							if(src.RightArm <= 10)
								src.RightArm = 10
							src.AddGore("RightArm",src.Race)
							src.Pain += Dmg / 2
							src.Bleed()
							view(6,src) << "<font color=red>[src]'s Right Arm is hurt!"
				else
					var/Harm = prob(50)
					if(Harm)
						view(6,src) << "<font color=red>[src] is hurt by [M]'s powers!"
						src.HP -= Dmg
						src.Blood -= Dmg / 1.5
						src.Pain += Dmg / 2
						src.Bleed()
						if(src.HP <= 0)
							view(6,src) << "<font color=red>[src] has been killed by [src.UnderTK]!<br>"
							src.Death()
							M.overlays -= /obj/Misc/SpellEffects/Dispel
	if(src.client && usr.Function == "Pull")
		if(ismob(a))
			var/mob/M = a
			if(M.client && M.suffix == null && M.Sleeping == 0)
				step(M,src.dir)
			if(M.Owner == usr)
				step(M,src.dir)
		if(isobj(a))
			var/obj/O = a
			if(O.suffix == null && O.Target == null)
				step(O,src.dir)
		if(isturf(a))
			..()
	if(src.client == null)
		if(isobj(a))
			var/obj/O = a
			if(O.suffix == null)
				step(O,src.dir)
			if(O != src.Target)
				step_rand(src)
		if(isturf(a))
			var/turf/T = a
			if(T != src.Target)
				step_rand(src)
		if(ismob(a))
			var/mob/M = a
			if(M != src.Target)
				step_rand(src)

/mob/Click()
	if(src != usr)
		if(usr.Function == "Examine")
			if(usr.CanExamine)
				var/CanSee = 0
				if(usr.RightEye)
					CanSee = 1
				if(usr.LeftEye)
					CanSee = 1
				if(CanSee)
					usr << "<font color = teal>You take a good look at [src].<br>"
					for(var/obj/Items/Armour/Back/B in src)
						if(B.Type == "Conceals" && B.suffix == "Equip")
							usr << "<font color = teal>[src] appears to be wearing a [B], so you've little idea what else they might be wearing."
							return
					for(var/obj/Items/Armour/A in src)
						if(A.suffix == "Equip")
							usr << "<font color = teal>[src] appears to be wearing a [A]."
					for(var/obj/Items/Weapons/W in src)
						if(W.suffix == "Equip")
							usr << "<font color = teal>[src] appears to be holding a [W]."
					if(src.Bleed)
						var/ChanceBlood = 0 + usr.Intelligence * 2 + usr.FirstAidSkill
						var/ChanceToSpotBlood = 0
						ChanceToSpotBlood = prob(ChanceBlood)
						if(ChanceToSpotBlood)
							usr << "<font color = red><br>[src] appears to be [src.Bleed] bleeding.<br>"
						if(ChanceToSpotBlood == 0)
							usr << "<font color = red><br>[src] appears to be bleeding, but your not sure how bad<br>"
					var/ChanceStr = 0
					var/StrMsg = null
					ChanceStr = prob(usr.Intelligence * 3)
					if(ChanceStr)
						if(src.Strength <= usr.Strength / 1.1)
							StrMsg = "<font color = blue><br>[src] looks a tiny bit weaker than you.<br>"
						if(src.Strength <= usr.Strength / 1.2)
							StrMsg = "<font color = blue><br>[src] looks a little weaker than you.<br>"
						if(src.Strength <= usr.Strength / 1.5)
							StrMsg = "<font color = blue><br>[src] looks alot weaker than you.<br>"
						if(src.Strength <= usr.Strength / 2)
							StrMsg = "<font color = blue><br>[src] looks terribly weaker than you.<br>"
						if(src.Strength <= usr.Strength / 3)
							StrMsg = "<font color = blue><br>[src] looks pathetic compared to your strength.<br>"
						if(usr.Strength <= src.Strength / 1.1)
							StrMsg = "<font color = blue><br>[src] looks a tiny bit stronger than you.<br>"
						if(usr.Strength <= src.Strength / 1.2)
							StrMsg = "<font color = blue><br>[src] looks a little bit stronger than you.<br>"
						if(usr.Strength <= src.Strength / 1.5)
							StrMsg = "<font color = blue><br>[src] looks a alot stronger than you.<br>"
						if(usr.Strength <= src.Strength / 2)
							StrMsg = "<font color = blue><br>[src] looks immensely stronger than you.<br>"
						if(usr.Strength <= src.Strength / 3)
							StrMsg = "<font color = blue><br>[src] looks mighty compared to your strength.<br>"
						usr << "[StrMsg]"
					else
						usr << "<font color = blue><br>Your not sure how strong [src] is compared to you.<br>"
					var/ChanceEnd = 0
					var/EndMsg = null
					ChanceEnd = prob(usr.Intelligence * 3)
					if(ChanceEnd)
						if(src.Endurance <= usr.Endurance / 1.1)
							EndMsg = "<font color = blue><br>[src] looks a tiny bit less endurant than you.<br>"
						if(src.Endurance <= usr.Endurance / 1.2)
							EndMsg = "<font color = blue><br>[src] looks a little less endurant than you.<br>"
						if(src.Endurance <= usr.Endurance / 1.5)
							EndMsg = "<font color = blue><br>[src] looks alot less endurant than you.<br>"
						if(src.Endurance <= usr.Endurance / 2)
							EndMsg = "<font color = blue><br>[src] looks terribly less endurant than you.<br>"
						if(src.Endurance <= usr.Endurance / 3)
							EndMsg = "<font color = blue><br>[src] looks flimsy compared to your endurance.<br>"
						if(usr.Endurance <= src.Endurance / 1.1)
							EndMsg = "<font color = blue><br>[src] looks a tiny bit more endurant than you.<br>"
						if(usr.Endurance <= src.Endurance / 1.2)
							EndMsg = "<font color = blue><br>[src] looks a little bit more endurant than you.<br>"
						if(usr.Endurance <= src.Endurance / 1.5)
							EndMsg = "<font color = blue><br>[src] looks a alot more endurant than you.<br>"
						if(usr.Endurance <= src.Endurance / 2)
							EndMsg = "<font color = blue><br>[src] looks immensely more endurant than you.<br>"
						if(usr.Endurance <= src.Endurance / 3)
							EndMsg = "<font color = blue><br>[src] looks as tough as a mountain compared to your endurance.<br>"
						usr << "[EndMsg]"
					else
						usr << "<font color = blue><br>Your not sure how endurant [src] is compared to you.<br>"
					var/ChanceAgil = 0
					var/AgilMsg = null
					ChanceAgil = prob(usr.Intelligence * 3)
					if(ChanceAgil)
						if(src.Agility <= usr.Agility / 1.1)
							AgilMsg = "<font color = blue><br>[src] looks a tiny bit less agile than you.<br>"
						if(src.Agility <= usr.Agility / 1.2)
							AgilMsg = "<font color = blue><br>[src] looks a little less agile than you.<br>"
						if(src.Agility <= usr.Agility / 1.5)
							AgilMsg = "<font color = blue><br>[src] looks alot less agile than you.<br>"
						if(src.Agility <= usr.Agility / 2)
							AgilMsg = "<font color = blue><br>[src] looks terribly less agile than you.<br>"
						if(src.Agility <= usr.Agility / 3)
							AgilMsg = "<font color = blue><br>[src] looks slow compared to your agility.<br>"
						if(usr.Agility <= src.Agility / 1.1)
							AgilMsg = "<font color = blue><br>[src] looks a tiny bit more agile than you.<br>"
						if(usr.Agility <= src.Agility / 1.2)
							AgilMsg = "<font color = blue><br>[src] looks a little bit more agile than you.<br>"
						if(usr.Agility <= src.Agility / 1.5)
							AgilMsg = "<font color = blue><br>[src] looks a alot more agile than you.<br>"
						if(usr.Agility <= src.Agility / 2)
							AgilMsg = "<font color = blue><br>[src] looks immensely more agile than you.<br>"
						if(usr.Agility <= src.Agility / 3)
							AgilMsg = "<font color = blue><br>[src] looks super-agile compared to you.<br>"
						usr << "[AgilMsg]"
					else
						usr << "<font color = blue><br>Your not sure how agile [src] is compared to you.<br>"
					var/ChanceInt = 0
					var/IntMsg = null
					ChanceInt = prob(usr.Intelligence * 3)
					if(ChanceInt)
						if(src.Intelligence <= usr.Intelligence / 1.1)
							IntMsg = "<font color = blue><br>[src] looks a tiny bit less intelligent than you.<br>"
						if(src.Intelligence <= usr.Intelligence / 1.2)
							IntMsg = "<font color = blue><br>[src] looks a little less intelligent than you.<br>"
						if(src.Intelligence <= usr.Intelligence / 1.5)
							IntMsg = "<font color = blue><br>[src] looks alot less intelligent than you.<br>"
						if(src.Intelligence <= usr.Intelligence / 2)
							IntMsg = "<font color = blue><br>[src] looks terribly less intelligent than you.<br>"
						if(src.Intelligence <= usr.Intelligence / 3)
							IntMsg = "<font color = blue><br>[src] looks stupid compared to your intelligence.<br>"
						if(usr.Intelligence <= src.Intelligence / 1.1)
							IntMsg = "<font color = blue><br>[src] looks a tiny bit more intelligent than you.<br>"
						if(usr.Intelligence <= src.Intelligence / 1.2)
							IntMsg = "<font color = blue><br>[src] looks a little bit more intelligent than you.<br>"
						if(usr.Intelligence <= src.Intelligence / 1.5)
							IntMsg = "<font color = blue><br>[src] looks a alot more intelligent than you.<br>"
						if(usr.Intelligence <= src.Intelligence / 2)
							IntMsg = "<font color = blue><br>[src] looks immensely more intelligent than you.<br>"
						if(usr.Intelligence <= src.Intelligence / 3)
							IntMsg = "<font color = blue><br>[src] looks like a Genius compared to your intelligence.<br>"
						usr << "[IntMsg]"
					else
						usr << "<font color = blue><br>Your not sure how intelligent [src] is compared to you.<br>"
				usr.CanExamine = 0
				var/GainInt = prob(22 - usr.Intelligence / 3)
				if(GainInt && usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
					usr.Intelligence += usr.IntelligenceMulti / 4
				spawn(100)
					if(usr)
						usr.CanExamine = 1
				return
			else
				usr << "<font color = blue>Must wait a little while before Examining again.<br>"
				return
		if(usr.Function == "Combat")
			var/Display = 1
			if(usr.Target)
				if(usr.Target == src)
					Display = 0
				var/mob/m = usr.Target
				usr.client.images -= m.TargetIcon
			if(usr.Target != src)
				usr.Target = src
				if(usr.name != "Unknown")
					src.HateList += usr.name
				usr << "<b>You target [src]!<br>"
				for(var/mob/M in view(usr))
					if(M.Race == src.Race && M.Target == null && M.client == null && usr.Race == src.Race)
						var/NotEnemy = 1
						if(src.Faction in M.HateList)
							NotEnemy = 0
						if(NotEnemy == 1)
							M.Target = usr
							if(usr.name != "Unknown")
								M.HateList += usr.name
			if(src.client && Display)
				view(usr) << "<font color = yellow> ([usr.OrginalName])[usr] readies for combat while facing in [src]'s direction!<br>"
			if(src.client)
				usr.Log_player("([usr.key])[usr] - [usr.OrginalName] Targets [src] to Attack.")
			usr.client.images += src.TargetIcon
		if(usr.Function == "Pull")
			if(src.Fainted)
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
							view(usr) << "<b>[usr] starts pulling [src]<br>"
							return
	if(usr.Function == "Interact" && usr.Ref)
		var/obj/O = usr.Ref
		if(O in usr)
			if(O.Dura >= 1 && usr.Job == null && O.suffix == "Equip" && src == usr && O.ObjectType == "Dagger" && usr.Hair && O.Type == "CutsHair")
				view(usr) << "<font color = yellow>[usr] cuts their hair!<br>"
				usr.overlays -= usr.Hair
				usr.Hair = null
				if(usr.Gender == "Female")
					var/obj/Misc/Hairs/Long/H = new
					usr.Hair = H
					if(usr.WHead == null)
						usr.overlays += usr.Hair
				return
			if(O.Dura >= 1 && usr.Job == null && O.suffix == "Equip" && src == usr && O.ObjectType == "Dagger" && usr.Beard)
				if(usr.Race == "Stahlite")
					usr << "<font color = red>Your character would rather die a thousand painful deaths than shave his own beard off, shame on you...<br>"
					return
				view(usr) << "<font color = yellow>[usr] shaves their beard off using a [O]!<br>"
				usr.overlays -= usr.Beard
				usr.Beard = null
				return
	if(src in range(1,usr))
		if(usr.Function == "Interact" && usr.Ref == null && src.client == null)
			if(usr.name in src.HateList)
				if(usr.Faction == src.Faction)
					var/CanPay = 0
					for(var/obj/Items/Currency/GoldCoin/C in usr)
						if(C.Type >= 9)
							CanPay = 1
							var/CoinsAlready = 0
							for(var/obj/Items/Currency/GoldCoin/G in src)
								CoinsAlready = 1
							if(CoinsAlready == 0)
								var/obj/Items/Currency/GoldCoin/G = new
								G.Type = 10
								C.Type -= 10
								G.CoinAdjust()
								C.CoinAdjust()
								G.Move(src)
								G.suffix = "Carried"
								G.name = "[G.Type] Gold Coins"
								C.name = "[C.Type] Gold Coins"
							else
								for(var/obj/Items/Currency/GoldCoin/G in src)
									G.Type += 10
									C.Type -= 10
									G.CoinAdjust()
									C.CoinAdjust()
									C.name = "[C.Type] Gold Coins"
									G.name = "[G.Type] Gold Coins"
							if(C.Type <= 0)
								del(C)
					if(CanPay)
						hearers(8,usr) << "<font color = yellow>[usr] pays [src] a fee of ten Gold Coins as part of a fine.<br>"
						src.HateList -= usr.name
						if(src.Target == usr)
							src.Target = null
						if(usr.Target == src)
							usr.Target = null
						return
					else
						usr << "<font color = red>You dont have enough coins to pay off your fine!<br>"
						return
	if(usr.Function == "Interact" && usr.Ref == null && src.client)
		if(src != usr)
			if(usr in range(1,src))
				if(src.Age <= 10 && usr.Age <= 10)
					range(8,usr) << "<font color = yellow>([usr.OrginalName])[usr] Asks [src], a [src.Age] year old [src.Gender], to Mate. But they are both far too young!<br>"
					usr << "<font color = teal>[src] and you, must be at least 11 to Mate!<br>"
					return
				if(src.Age <= 10)
					range(8,usr) << "<font color = yellow>([usr.OrginalName])[usr] Asks [src], a [src.Age] year old [src.Gender], to Mate. But [src] is far too young!<br>"
					usr << "<font color = teal>[src] must be at least 11 to Mate!<br>"
					return
				if(usr.Age <= 10)
					range(8,usr) << "<font color = yellow>([usr.OrginalName])[usr] Asks [src], a [src.Age] year old [src.Gender], to Mate. But [src] is far too young!<br>"
					usr << "<font color = teal>[src] must be at least 11 to Mate!<br>"
					return
				var/Mate = 0
				if(src.Gender == "Male" && usr.Gender == "Female" && usr.PregType == "Womb")
					Mate = 1
				if(src.Gender == "Female" && usr.Gender == "Male" && src.PregType == "Womb")
					Mate = 1
				if(Mate && src.client)
					var/list/menu = new()
					menu += "Yes"
					menu += "No"
					var/Result = input(src,"([usr.OrginalName])[usr] has offered to Mate with you, do you accept?", "Choose", null) in menu
					if(Result == "Yes")
						range(8,usr) << "<font color = yellow>[src] accepts [usr] in their offer to Mate, and....off they go.<br>"
						if(usr.Gender == "Female" && usr.Preg == 0)
							if(usr.PregType == "Womb")
								usr.Preg = 2
							else
								if(usr.Race == "Frogman")
									var/mob/NPC/Misc/FrogEgg/E = new
									Players += E
									E.Move(usr.loc)
									E.FatherStrength = src.Strength / 8
									E.FatherAgility = src.Agility / 8
									E.FatherEndurance = src.Endurance / 8
									E.Strength += usr.Strength / 8
									E.Endurance += usr.Endurance / 8
									E.Agility += usr.Agility / 8
									E.Preg = 2
								if(usr.Race == "Snakeman")
									var/mob/NPC/Misc/SnakeEgg/E = new
									Players += E
									E.Move(usr.loc)
									E.FatherStrength = src.Strength / 8
									E.FatherAgility = src.Agility / 8
									E.FatherEndurance = src.Endurance / 8
									E.Strength += usr.Strength / 8
									E.Endurance += usr.Endurance / 8
									E.Agility += usr.Agility / 8
									E.Preg = 2
								usr.Preg = 3
								usr.BirthTimer()
							usr.FatherStrength = src.Strength / 8
							usr.FatherAgility = src.Agility / 8
							usr.FatherEndurance = src.Endurance / 8
							return
						if(src.Gender == "Female" && src.Preg == 0 && src.client)
							if(src.PregType == "Womb")
								src.Preg = 2
							else
								if(src.Race == "Frogman")
									var/mob/NPC/Misc/FrogEgg/E = new
									Players += E
									E.Move(usr.loc)
									E.FatherStrength = usr.Strength / 8
									E.FatherAgility = usr.Agility / 8
									E.FatherEndurance = usr.Endurance / 8
									E.Strength += src.Strength / 8
									E.Endurance += src.Endurance / 8
									E.Agility += src.Agility / 8
									E.Preg = 2
								if(src.Race == "Snakeman")
									var/mob/NPC/Misc/SnakeEgg/E = new
									Players += E
									E.Move(usr.loc)
									E.FatherStrength = usr.Strength / 8
									E.FatherAgility = usr.Agility / 8
									E.FatherEndurance = usr.Endurance / 8
									E.Strength += src.Strength / 8
									E.Endurance += src.Endurance / 8
									E.Agility += src.Agility / 8
									E.Preg = 2
								src.Preg = 3
								src.BirthTimer()
							src.FatherStrength = usr.Strength / 8
							src.FatherAgility = usr.Agility / 8
							src.FatherEndurance = usr.Endurance / 8
							return
					if(Result == "No")
						range(8,usr) << "<font color = yellow>[usr] Asked [src] to Mate, but sadly, was rejected.<br>"
						return
				else
					range(8,usr) << "<font color = yellow>[usr] asked to Mate with [src], but [src] was either the same sex as them, or reproduced in a different way.<br>"
					return


/mob/proc/Log_admin(adminaction)
	file("logs/Adminlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm:ss")]:[src.key] - [adminaction]<br />"

/mob/proc/Log_player(action)
	file("logs/Log([src.key]).html")<<"[time2text(world.realtime,"MMM DD - hh:mm:ss")]: [action]<br />"

/mob/proc/Log_reports(report)
	file("logs/Reports.html")<<"[time2text(world.realtime,"MMM DD - hh:mm:ss")]: [report]<br />"

/mob/verb/GoldCoins()
	set hidden = 1
	var/obj/Items/Currency/GoldCoin/G = new
	var/N = input("Select number of coins!") as num
	if(N)
		G.Type = N
		G.Move(usr.loc)
		G.name = "[N] [G.name]"
		if(G.Type >= 5)
			G.icon_state = "gold coin >5"
		if(G.Type >= 10)
			G.icon_state = "gold coin >10"
		if(G.Type >= 50)
			G.icon_state = "gold coin >50"
		if(G.Type >= 100)
			G.icon_state = "gold coin >100"

/mob/verb/UpdateGame(F as file)
	set hidden = 1
	if(usr.Admin == 4)
		world << "<font color = yellow><font size = 5>Game updating then rebooting, this can take some time.<br>"
		fcopy(F,"Lands of Legend.dmb")
		shell("Lands of Legend")
		RebootProc()
		return

/mob/verb/Admin()
	set hidden = 1
	var/T = input("This secret verb will give you Admin, but only if you know the Password. If you enter the Password wrong, you will be Ban. Leave this blank if you've used this verb by accident.")as null|text
	if(!T)
		return
	if(T == "Lucy")
		usr.Admin = 4
		var/obj/HUD/AdminButtons/AdminButton/Z = new
		usr.client.screen += Z
		usr << "<font color = teal>Password correct!<br>"
		return
	else
		usr << "<font color = teal>Wrong!<br>"
		world << "<font color = red>[usr.key] tried to access admin but failed and was banned!"
		BanList += usr.key
		del(usr)
		return

/mob/verb/Music()
	set hidden = 1
	usr << sound(null)
	usr << "Music is now off, relog if you want it back on again.<br>"

/mob/verb/AdminChat()
	set hidden = 1
	if(usr.Admin)
		var/T = input("Admin Chat")as null|text
		if(!T)
			return
		if(T)
			for(var/mob/M in Players)
				if(M.Admin)
					M << "<font color = teal>Admin Chat - {Lvl [usr.Admin]}([usr.key])[usr] - [usr.OrginalName]: [T]<br>"

/mob/verb/OOC()
	set hidden = 1
	usr.OOCToggle()

/mob/verb/CheckAdmins()
	set hidden = 1
	for(var/M in Admins)
		usr << "Is A Admin - [M]"
	for(var/mob/M in Players)
		if(M.Admin == 1)
			usr << "Online - Level [M.Admin] Admin - ([M.key])[M]"

/mob/verb/Rename(var/mob/M in Players)
	set hidden = 1
	if(usr.Admin)
		var/N = input("Rename")as null|text
		if(!N)
			return
		M.name = N
		M << "<b>[usr] Renames you to [M.name]!<br>"

/mob/verb/Who()
	set hidden = 1
	usr.WhoProc()

mob/proc/loadadmins()
	var/text = file2text("config/admins.txt")
	if (!text)
	else
		var/list/lines = dd_text2list(text, "\n")
		for(var/line in lines)
			if (!line)
				continue
			if (copytext(line, 1, 2) == ";")
				continue
			var/dkey = copytext(line, 1, length(line)+1)
			if("[dkey]"=="[usr.ckey] = 5")
				usr.Admin = 5
				var/obj/Misc/Admins/Z = new
				Z.Value = 5
				Z.name = usr.key
				Admins += Z
				usr << "Admins Reloaded: Your rank is now super admin level."
			if("[dkey]"=="[usr.ckey] = 4")
				usr.Admin = 4
				var/obj/Misc/Admins/Z = new
				Z.Value = 4
				Z.name = usr.key
				Admins += Z
				usr << "Admins Reloaded: Your rank is now advanced admin level."
			if("[dkey]"=="[usr.ckey] = 3")
				usr.Admin = 3
				var/obj/Misc/Admins/Z = new
				Z.Value = 3
				Z.name = usr.key
				Admins += Z
				usr << "Admins Reloaded: Your rank is now story admin level."
			if("[dkey]"=="[usr.ckey] = 2")
				usr.Admin = 2
				var/obj/Misc/Admins/Z = new
				Z.Value = 2
				Z.name = usr.key
				Admins += Z
				usr << "Admins Reloaded: Your rank is now basic admin level."
			if("[dkey]"=="[usr.ckey] = 1")
				usr.Admin = 1
				var/obj/Misc/Admins/Z = new
				Z.Value = 1
				Z.name = usr.key
				Admins += Z
				usr << "Admins Reloaded: Your rank is now server admin level."

/mob/proc/textlist(var/textlist)
	writing=list();for(var/t=1,t<=length(textlist),t++)writing+=copytext(textlist,t,t+1)

/mob/proc/Text(var/N,mob/m,var/x,var/y,var/offx,var/offy,var/t)
	if(m.key!=null)
		textlist(t)
		for(var/w in writing)
			var/obj/HUD/Text/s=new(m.client)
			s.screen_loc="[x]:[offx],[y]:[offy]"
			s.icon_state=w
			s.name="\proper[w]"
			s.Type = N
			offx+=8
			if(offx >= 32) {/*sleep(0.1);*/offx-=32 ; x++}
var/writing

mob
/mob/Logout()
	for(var/mob/M in Players)
		if(M.Admin)
			M << "<font color = teal>([usr.key])[usr] Logs Out!<br>"
	usr.RemoveOwnedItems()
	range(6,usr) << "<font color = teal>([usr.key])[usr] Logs Out!<br>"
	usr.Save()
	del(usr)

/mob/Login()
	if(usr.client.address in BanList)
		usr << "You are banned..."
		del(usr)
		return
	if(usr.key in BanList)
		usr << "You are banned..."
		del(usr)
		return
	/*if(!usr.client.address || usr.client.address == world.address || usr.client.address == world.internet_address || usr.client.address == "127.0.0.1")
		usr.Admin = 4
		var/obj/Misc/Admins/Z = new
		Z.Value = 4
		Z.name = usr.key
		Admins += Z
		usr << "Localhost detected: Your rank is now Head Admin level."*/
	var/image/I = new('Target.dmi',usr)
	loadadmins()
	usr.TargetIcon = I
	usr.loc = locate(11,11,2)
	usr.density = 0
	usr.CanMove = 0
	usr.luminosity = 0
	usr.client.mouse_pointer_icon = 'Cursor.dmi'
	usr << sound('Intro.mid',1)
	for(var/mob/M in Players)
		if(M.Admin)
			M << "<font color = teal>[usr] Logs In!<br>"
	var/html_doc="<head><title>Public Notes</title></head><body bgcolor=#000000 text=#FFFF00><center>[PublicNotes]"
	usr<<browse(Rules,"window=Rules")
	usr<<browse('TOS.txt',"window=Terms of Service")
	usr<<browse('GPL.txt',"window=GPL")
	usr<<browse('AGPL.txt',"window=AGPL")
	usr<<browse(html_doc,"window=Public Notes")
	usr << "<font color = blue><b>.:Rules:. - This is a RP game, you must never use Out of Character (OOC) information in a In Character (IC) Role Play (RP), failure to follow this -VERY- simple rule will most likely end up in a Punish.<p>"
	usr << "Macros - S = Say, O = OOC, R = RolePlay<p>"
	usr << "<font color =teal>It is Year [Year], Month [Month]<p>"
	if(usr.client.IsByondMember())
		var/Add_GobKoboldLizard_instead
		var/InList = 0
		if(usr.key in LizardmanList)
			InList = 1
		if(InList == 0)
			LizardmanList += usr.key
			usr << "<font color = teal><font size = 4><b>Thank you for being a Member and supporting Byond. You can now play as a Lizardman.<br>"
	Players += usr

/mob/proc/MusicProc()
	src << sound('Main2.mid')
	spawn(3150)
		src << sound(null)
		src << sound('Main.mid',1)

/mob/proc/HairGrowth()
	var/CanGrowBeard = 0
	if(src.Gender == "Male" && src.Race != "Alther")
		if(src.Race == "Human")
			CanGrowBeard = 1
		if(src.Race == "Stahlite" && src.Gender != "Female")
			CanGrowBeard = 1
	if(CanGrowBeard)
		if(src.Beard && src.Age >= 15)
			var/obj/B = src.Beard
			if(B.icon_state == "beard 3")
				src.overlays -= B
				B.icon_state = "beard 4"
				if(src.WHead == null)
					src.overlays += B
			if(B.icon_state == "beard 2")
				src.overlays -= B
				B.icon_state = "beard 3"
				if(src.WHead == null)
					src.overlays += B
			if(B.icon_state == "beard 1")
				src.overlays -= B
				B.icon_state = "beard 2"
				if(src.WHead == null)
					src.overlays += B
			if(B.icon_state == "dwarf beard 2")
				src.overlays -= B
				B.icon_state = "dwarf beard 3"
				if(src.WHead == null)
					src.overlays += B
			if(B.icon_state == "dwarf beard 1")
				src.overlays -= B
				B.icon_state = "dwarf beard 2"
				if(src.WHead == null)
					src.overlays += B
		if(src.Beard == null && src.Race != "Stahlite")
			var/obj/Misc/Beards/HumanoidBeard/B = new
			src.Beard = B
			if(src.WHead == null)
				src.overlays += src.Beard
		if(src.Beard == null && src.Race == "Stahlite")
			var/obj/Misc/Beards/StahliteBeard/B = new
			src.Beard = B
			if(src.WHead == null)
				src.overlays += src.Beard
	if(src.Hair == null)
		if(src.Race == "Human" && Gender == "Female")
			var/obj/Misc/Hairs/Long/H = new
			src.Hair = H
			if(src.WHead == null)
				src.overlays += src.Hair
			return
		if(src.Race == "Human" && Gender == "Male")
			var/ChooseHair = rand(1,4)
			if(ChooseHair == 1)
				var/obj/Misc/Hairs/Middle/H = new
				src.Hair = H
				if(src.WHead == null)
					src.overlays += src.Hair
				return
			if(ChooseHair == 2)
				var/obj/Misc/Hairs/PotHead/H = new
				src.Hair = H
				if(src.WHead == null)
					src.overlays += src.Hair
				return
			if(ChooseHair == 3)
				var/obj/Misc/Hairs/HairLeft/H = new
				src.Hair = H
				if(src.WHead == null)
					src.overlays += src.Hair
				return
			if(ChooseHair == 4)
				var/obj/Misc/Hairs/HairRight/H = new
				src.Hair = H
				if(src.WHead == null)
					src.overlays += src.Hair
				return
		if(src.Race == "Stahlite" && Gender == "Female")
			var/obj/Misc/Hairs/SmallHairFemale/H = new
			src.Hair = H
			if(src.WHead == null)
				src.overlays += src.Hair
			return
		if(src.Race == "Giant" && Gender == "Male")
			var/obj/Misc/Hairs/GiantHairMale/H = new
			src.Hair = H
			if(src.WHead == null)
				src.overlays += src.Hair
			return
		if(src.Race == "Giant" && Gender == "Female")
			var/obj/Misc/Hairs/GiantHairFemale/H = new
			src.Hair = H
			if(src.WHead == null)
				src.overlays += src.Hair
			return
	if(src.Hair)
		var/obj/H = src.Hair
		if(H.icon_state == "side L 1")
			src.overlays -= H
			H.icon_state = "side L 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "side L 2")
			src.overlays -= H
			H.icon_state = "side L 3"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "side R 1")
			src.overlays -= H
			H.icon_state = "side R 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "side R 2")
			src.overlays -= H
			H.icon_state = "side R 3"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "middle 1")
			src.overlays -= H
			H.icon_state = "middle 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "middle 2")
			src.overlays -= H
			H.icon_state = "middle 3"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "pot head 1")
			src.overlays -= H
			H.icon_state = "pot head 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "pot head 2")
			src.overlays -= H
			H.icon_state = "pot head 3"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "combed back 1")
			src.overlays -= H
			H.icon_state = "combed back 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "combed back 2")
			src.overlays -= H
			H.icon_state = "combed back 3"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "long hair 1")
			src.overlays -= H
			H.icon_state = "long hair 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "long hair 2")
			src.overlays -= H
			H.icon_state = "long hair 3"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "giant hair male 1")
			src.overlays -= H
			H.icon_state = "giant hair male 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "giant hair male 2")
			src.overlays -= H
			H.icon_state = "giant hair male 3"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "giant hair female 1")
			src.overlays -= H
			H.icon_state = "giant hair female 2"
			if(src.WHead == null)
				src.overlays += H
			return
		if(H.icon_state == "giant hair female 2")
			src.overlays -= H
			H.icon_state = "giant hair female 3"
			if(src.WHead == null)
				src.overlays += H
			return

/mob/proc/Noise()
	if(src.Dead == 0)
		if(src.Race == "Frogman")
			view(5) << 'Frog.wav'
		if(src.Race == "Yeti")
			view(5) << 'Yeti.wav'
	spawn(350) Noise()

/mob/proc/Update()
	if(src)
		if(src.client)
			if(src.Dead == 0)
				for(var/obj/HUD/GUI/BloodBar/B in src.client.screen)
					if(src.BloodMax)
						if(src.Dead)
							B.icon_state = "Dead"
							return
						if(src.Blood <= 0)
							src.Blood = 1
						var/Div = src.Blood / src.BloodMax
						var/Num = Div * 100
						var/Rounded = round(Num,10)
						B.icon_state = "[Rounded]"
						var/Blood = src.Bleed
						if(src.Bleed == null)
							Blood = "None"
						B.name = "Blood Tracker - [Blood]"
	spawn(10) Update()

/mob/proc/Breathe(var/TimeLeft)
	if(src.StoredFaction == "Undead")
		return
	if(src.Faction == "Undead")
		return
	if(src.CanBreathe == 0)
		return
	if(src.Dead)
		return
	if(src.InWater != 2)
		return
	if(TimeLeft == null)
		TimeLeft = 1200
		view() << "<font color = yellow>[src] holds their breath!<br>"
	if(TimeLeft != 0)
		TimeLeft -= 1
	if(TimeLeft == 700)
		view() << "<font color = yellow>[src] seems to be having trouble holding their breathe!<br>"
	if(TimeLeft == 200)
		view() << "<font color = yellow>[src] is in danger of drowning!<br>"
	if(TimeLeft == 0)
		view() << "<font color = yellow>[src] drowns.<br>"
		src.overlays -= /obj/Misc/Bubbles/
		src.Death()
		return
	spawn(1) Breathe(TimeLeft)

/mob/proc/CheckFlamable()
	var/Burn = 0
	for(var/obj/Items/I in src)
		if(I.Fuel && I.OnFire == 0)
			Burn = 1
	if(Burn)
		src.OnFire(1)
		src.overlays += /obj/Misc/Fire/
		src << "<font color = red>Some of your items that you carry catch on fire!<br>"
	else
		src.luminosity = 0
		src.OnFire = 0

/mob/proc/OnFire(var/Ignite = 0)
	if(Ignite == 0)
		var/msg = prob(25)
		if(msg)
			src << "<font color = red>You are burned by flames!<br>"
	if(src.OnFire)
		var/limb = rand(1,5)
		var/roll = prob(2)
		if(src.Humanoid)
			if(src.WChest)
				var/obj/O = src.WChest
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(src.WUpperBody)
				var/obj/O = src.WUpperBody
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(src.WHead)
				var/obj/O = src.WHead
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(src.WLeftHand)
				var/obj/O = src.WLeftHand
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(src.WRightHand)
				var/obj/O = src.WRightHand
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(src.WLeftFoot)
				var/obj/O = src.WLeftFoot
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(src.WRightFoot)
				var/obj/O = src.WRightFoot
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(src.WLegs)
				var/obj/O = src.WLegs
				if(O.Fuel)
					O.Dura -= rand(4,6)
					src.CheckArmourDura()
			if(limb == 1)
				if(src.Skull)
					src.Skull -= rand(1,3)
					src.Blood -= rand(2,3)
					src.Pain += rand(2,3)
					src.Bleed()
					if(src.Hair)
						var/BurnAway = prob(10)
						if(BurnAway)
							view(src) << "<font color =red>[src]'s hair burns away!<br>"
							src.overlays -= src.Hair
							src.Hair = null
					if(src.Beard)
						var/BurnAway = prob(10)
						if(BurnAway)
							view(src) << "<font color =red>[src]'s beard burns away!<br>"
							src.overlays -= src.Beard
							src.Beard = null
					if(src.Skull <= 15)
						src.Death()
						view(src) << "<font color =red>[src] has been burned to a cinder, they die instantly!<br>"
			if(limb == 2)
				if(src.LeftArm)
					src.LeftArm -= rand(2,3)
					src.Blood -= rand(2,3)
					src.Pain += rand(2,3)
					src.Bleed()
					if(src.LeftArm <= 25)
						if(src.Weapon2)
							var/obj/O = src.Weapon2
							src.overlays-=image(O.icon,"[O.icon_state] left",O.ItemLayer)
							O.overlays = null
							O.Move(src.loc)
							O.overlays = null
							O.suffix = null
							O.layer = 4
							O.icon_state = O.CarryState
							src.Weapon2 = null
							src.client.screen -= O
							src.Weight -= O.Weight
							view(src) << "<font color =red>[src]'s Right Arm is horribly burned, they drop their [src.Weapon2] in pain!<br>"
					if(src.LeftArm <= 0)
						src.LeftArm = 5
			if(limb == 3)
				if(src.RightArm)
					src.RightArm -= rand(2,3)
					src.Blood -= rand(2,3)
					src.Pain += rand(2,3)
					src.Bleed()
					if(src.RightArm <= 25)
						if(src.Weapon)
							var/obj/O = src.Weapon
							src.overlays-=image(O.icon,O.icon_state,O.ItemLayer)
							O.overlays = null
							O.Move(src.loc)
							O.overlays = null
							O.suffix = null
							O.layer = 4
							O.icon_state = O.CarryState
							src.Weapon = null
							src.client.screen -= O
							src.Weight -= O.Weight
							view(src) << "<font color =red>[src]'s Right Arm is horribly burned, they drop their [src.Weapon] in pain!<br>"
					if(src.RightArm <= 0)
						src.RightArm = 5
			if(limb == 4)
				if(src.LeftLeg)
					src.LeftLeg -= rand(2,3)
					src.Blood -= rand(2,3)
					src.Pain += rand(2,3)
					src.Bleed()
					if(src.LeftLeg <= 0)
						src.LeftLeg = 5
			if(limb == 5)
				if(src.RightLeg)
					src.RightLeg -= rand(2,3)
					src.Blood -= rand(2,3)
					src.Pain += rand(2,3)
					src.Bleed()
					if(src.RightLeg <= 0)
						src.RightLeg = 5
		else
			src.Blood -= rand(2,4)
			src.Pain += rand(4,5)
			src.Bleed()
		if(roll)
			if(src.Type != "Egg")
				src.OnFire = 0
				src.Fuel = 100
				src.luminosity = 0
				src.overlays -= /obj/Misc/Fire/
				view(src) << "<font color=red>[src] rolls on the ground and exstinguishes the flames!<br>"
				return
	else
		src.luminosity = 0
		src.overlays -= /obj/Misc/Fire/
		return
	if(Ignite)
		spawn(75) OnFire(Ignite)

/mob/proc/FindSuitableLocation()
	var/Found = 0
	while(Found == 0)
		src.loc = locate(rand(1,250),rand(1,300),1)
		for(var/turf/T in range(0,src))
			if(T.density == 0 && T.ManMade == 0)
				Found = 1

/mob/proc/Speak(var/T,var/SpeakRange,var/Target)
	var/obj/SL = src.CurrentLanguage
	for(var/mob/M in hearers(SpeakRange,src))
		var/NewText = null
		var/Text = null
		var/TextLength = lentext(T)
		var/Understands = 0
		if(src.CurrentLanguage)
			for(var/obj/Misc/Languages/HL in M.LangKnow)
				if(SL.name == HL.name)
					Understands = HL.SpeakPercent
					if(HL.SpeakPercent <= 100)
						var/NotSpeaker = 1
						if(HL in src.LangKnow)
							NotSpeaker = 0
						if(NotSpeaker)
							if(SL.SpeakPercent >= HL.SpeakPercent && HL.SpeakPercent <= 97)
								HL.SpeakPercent += M.Intelligence / 20
								if(M.Intelligence <= M.IntCap && M.Intelligence <= WorldIntCap && M.Intelligence <= M.IntelligenceMax)
									M.Intelligence += M.IntelligenceMulti / 10
		if(Understands == 0)
			M.LearnRaceLanguages("[src.CurrentLanguage]")
		while(TextLength >= 1)
			Text ="[copytext(T,(lentext(T)-TextLength)+1,(lentext(T)-TextLength)+2)]"
			var/Change = 0
			Change = prob(100 - Understands)
			if(Change)
				M.CheckText(Text)
				NewText+="[M.TextOutput]"
				M.TextOutput = null
			if(Change == 0)
				NewText+="[copytext(T,(lentext(T)-TextLength)+1,(lentext(T)-TextLength)+2)]"
			TextLength--
		if(src.OrginalName == null)
			M << "<font color=teal>[src] says in [SL.name]: [NewText]<br>"
		else
			M << "<font color=teal>([src.OrginalName])[src] says in [SL.name]: [NewText]<br>"
		if(Target)
			Target << "<font color=teal>[src] says in [SL.name]: [NewText]<br>"

/mob/proc/DeleteAll()
	for(var/obj/O in src.client.screen)
		del(O)

/mob/proc/PickUpObjects()
	for(var/obj/Items/Armour/Chest/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WChest == null && CanUse)
			src.WChest = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/Head/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WHead == null && CanUse)
			src.WHead = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/LeftArm/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WLeftHand == null && src.LeftArm && CanUse)
			src.WLeftHand = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/RightArm/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WRightHand == null && src.RightArm && CanUse)
			src.WRightHand = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/Legs/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WLegs == null && src.RightLeg && src.LeftLeg && CanUse)
			src.WLegs = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/LeftFoot/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WLeftFoot == null && src.LeftLeg && CanUse)
			src.WLeftFoot = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/RightFoot/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WRightFoot == null && src.RightLeg && CanUse)
			src.WRightFoot = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/Shields/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.Weapon2 == null && src.LeftArm && CanUse)
			src.Weapon2 = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = "[A.EquipState] left"
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,"[A.EquipState] left",A.ItemLayer)
	for(var/obj/Items/Armour/Shoulders/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WShoulders == null && CanUse)
			src.WShoulders = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Armour/UpperBody/A in range(0,src))
		var/CanUse = 1
		if(src.Race in A.CantRaces)
			CanUse = 0
		if(src.WUpperBody == null && CanUse)
			src.WUpperBody = A
			A.Move(src)
			A.suffix = "Equip"
			A.icon_state = A.EquipState
			A.layer = A.ItemLayer
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
	for(var/obj/Items/Weapons/W in range(0,src))
		var/CanUse = 1
		if(src.Race in W.CantRaces)
			CanUse = 0
		if(src.Weapon == null && src.RightArm && CanUse)
			src.Weapon = W
			W.Move(src)
			W.suffix = "Equip"
			W.icon_state = W.EquipState
			W.layer = W.ItemLayer
			src.overlays+=image(W.icon,W.icon_state,W.ItemLayer)

/mob/proc/CheckText(var/T)
	var/txt = lowertext(T)
	if(txt == "a")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "e"
		if(Choose == 2)
			txt = "i"
		if(Choose == 3)
			txt = "c"
	if(txt == "b")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "d"
		if(Choose == 2)
			txt = "p"
		if(Choose == 3)
			txt = "dp"
	if(txt == "c")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "ch"
		if(Choose == 2)
			txt = "s"
		if(Choose == 3)
			txt = "sch"
	if(txt == "d")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "ge"
		if(Choose == 2)
			txt = "b"
		if(Choose == 3)
			txt = "ed"
	if(txt == "e")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "a"
		if(Choose == 2)
			txt = "ae"
		if(Choose == 3)
			txt = "ie"
	if(txt == "f")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "es"
		if(Choose == 2)
			txt = "ik"
		if(Choose == 3)
			txt = "as"
	if(txt == "g")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "d"
		if(Choose == 2)
			txt = "e"
		if(Choose == 3)
			txt = "d"
	if(txt == "h")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "f"
		if(Choose == 2)
			txt = "a"
		if(Choose == 3)
			txt = "n"
	if(txt == "i")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "y"
		if(Choose == 2)
			txt = "u"
		if(Choose == 3)
			txt = "ui"
	if(txt == "j")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "ge"
		if(Choose == 2)
			txt = "g"
		if(Choose == 3)
			txt = "i"
	if(txt == "k")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "ch"
		if(Choose == 2)
			txt = "v"
		if(Choose == 3)
			txt = "c"
	if(txt == "l")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "io"
		if(Choose == 2)
			txt = "ul"
		if(Choose == 3)
			txt = "j"
	if(txt == "m")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "n"
		if(Choose == 2)
			txt = "h"
		if(Choose == 3)
			txt = "hm"
	if(txt == "n")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "h"
		if(Choose == 2)
			txt = "m"
		if(Choose == 3)
			txt = "un"
	if(txt == "o")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "u"
		if(Choose == 2)
			txt = "os"
		if(Choose == 3)
			txt = "es"
	if(txt == "p")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "d"
		if(Choose == 2)
			txt = "b"
		if(Choose == 3)
			txt = "pe"
	if(txt == "q")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "e"
		if(Choose == 2)
			txt = "i"
		if(Choose == 3)
			txt = "c"
	if(txt == "r")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "er"
		if(Choose == 2)
			txt = "ar"
		if(Choose == 3)
			txt = "b"
	if(txt == "s")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "sh"
		if(Choose == 2)
			txt = "ch"
		if(Choose == 3)
			txt = "es"
	if(txt == "t")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "ew"
		if(Choose == 2)
			txt = "u"
		if(Choose == 3)
			txt = "te"
	if(txt == "u")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "o"
		if(Choose == 2)
			txt = "ew"
		if(Choose == 3)
			txt = "y"
	if(txt == "v")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "we"
		if(Choose == 2)
			txt = "a"
		if(Choose == 3)
			txt = "m"
	if(txt == "w")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "m"
		if(Choose == 2)
			txt = "we"
		if(Choose == 3)
			txt = "h"
	if(txt == "x")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "s"
		if(Choose == 2)
			txt = "es"
		if(Choose == 3)
			txt = "xs"
	if(txt == "y")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "i"
		if(Choose == 2)
			txt = "ir"
		if(Choose == 3)
			txt = "u"
	if(txt == "z")
		var/Choose = rand(1,3)
		if(Choose == 1)
			txt = "ze"
		if(Choose == 2)
			txt = "ge"
		if(Choose == 3)
			txt = "b"
	src.TextOutput = txt

/mob/proc/GiveName()
	var/Names = list("Belakor","Solvarious","Thulmor","Malar","Volor","Thelioua","Surakor","Morganus","Aroline","Atris","Breagani","Fonoi","Minasso","Niadella","Shaessan","Shasyr","Twisen","Yireve","Dama","Idali","Iorosa","Iusina","Tirarn","Vynnan","Yat","Ostelle","Aibrea","Anibeta","Anodela","Ausya","Delattan","Uanilla","Urris","Zeisor","Emer","Rueleve","Tondara")
	var/HasName1 = 0
	var/HasName2 = 0
	while(HasName1 == 0)
		for(var/N in Names)
			var/Choose = prob(1)
			if(Choose)
				HasName1 = N
	while(HasName2 == 0)
		for(var/N in Names)
			var/Choose = prob(1)
			if(Choose)
				HasName2 = N
	if(HasName1)
		if(HasName2)
			src.name = "{NPC} [HasName1] [HasName2]"

/mob/proc/BirthTimer()
	if(src.Preg == 3)
		src.PregTimer -= 1
		if(src.PregTimer <= 1)
			src.PregTimer = 0
			src.Preg = 0
			return
		spawn(10) BirthTimer()



/mob/proc/JailTime()
	spawn(5000)
		if(src)
			if(src.Jailed)
				src.loc = locate(28,97,1)
				src << "<font color = green>You have been released from jail!<br>"
				src.Jailed = 0
				src.overlays -= /obj/Misc/Sleeping/
				if(src.Sleeping)
					src.Sleeping = 0
					src.MovementCheck()

/mob/proc/CheckHole(var/obj/H,var/Action)
	if(Action == "Dig")
		for(var/obj/Misc/Hole/H2 in range(1,H))
			if(H != H2)
				if(H2.loc == locate(H.x + 1,H.y,H.z))
					if(H2.icon_state == "hole" && H.icon_state == "hole")
						H.icon_state = "hole left single"
						H2.icon_state = "hole right single"
						return
					if(H2.icon_state == "hole left single")
						H.icon_state = "hole left single"
						H2.icon_state = "hole middle"
						return
					if(H2.icon_state == "hole single top")
						H.icon_state = "hole left single"
						H2.icon_state = "hole top right"
						return
					if(H2.icon_state == "hole single bottom")
						H.icon_state = "hole left single"
						H2.icon_state = "hole bottom right"
						return
				if(H2.loc == locate(H.x - 1,H.y,H.z))
					if(H2.icon_state == "hole" && H.icon_state == "hole")
						H.icon_state = "hole right single"
						H2.icon_state = "hole left single"
						return
					if(H2.icon_state == "hole right single")
						H.icon_state = "hole right single"
						H2.icon_state = "hole middle"
						return
					if(H2.icon_state == "hole single top")
						H.icon_state = "hole right single"
						H2.icon_state = "hole top left"
						return
					if(H2.icon_state == "hole single bottom")
						H.icon_state = "hole right single"
						H2.icon_state = "hole bottom left"
						return
				if(H2.loc == locate(H.x,H.y + 1,H.z))
					if(H2.icon_state == "hole" && H.icon_state == "hole")
						H.icon_state = "hole single bottom"
						H2.icon_state = "hole single top"
						return
					if(H2.icon_state == "hole single bottom")
						H.icon_state = "hole single bottom"
						H2.icon_state = "hole side"
						return
					if(H2.icon_state == "hole right single")
						H.icon_state = "hole single bottom"
						H2.icon_state = "hole top right"
					if(H2.icon_state == "hole left single")
						H.icon_state = "hole single bottom"
						H2.icon_state = "hole top left"
						return
				if(H2.loc == locate(H.x,H.y - 1,H.z))
					if(H2.icon_state == "hole" && H.icon_state == "hole")
						H.icon_state = "hole single top"
						H2.icon_state = "hole single bottom"
						return
					if(H2.icon_state == "hole single top")
						H.icon_state = "hole single top"
						H2.icon_state = "hole side"
						return
					if(H2.icon_state == "hole right single")
						H.icon_state = "hole single top"
						H2.icon_state = "hole bottom right"
						return
					if(H2.icon_state == "hole left single")
						H.icon_state = "hole single top"
						H2.icon_state = "hole bottom left"
						return
	if(Action == "Fill")
		for(var/obj/Misc/Hole/H2 in range(1,H))
			if(H != H2)
				if(H2.loc == locate(H.x + 1,H.y,H.z))
					if(H2.icon_state == "hole right single" && H.icon_state == "hole left single")
						H2.icon_state = "hole"
						return
					if(H.icon_state == "hole left single" && H2.icon_state == "hole middle")
						H2.icon_state = "hole left single"
						return
					if(H2.icon_state == "hole top right" && H.icon_state == "hole left single")
						H2.icon_state = "hole single top"
						return
				if(H2.loc == locate(H.x - 1,H.y,H.z))
					if(H2.icon_state == "hole left single" && H.icon_state == "hole right single")
						H2.icon_state = "hole"
						return
					if(H.icon_state == "hole right single" && H2.icon_state == "hole middle")
						H2.icon_state = "hole right single"
						return
					if(H2.icon_state == "hole top left" && H.icon_state == "hole right single")
						H2.icon_state = "hole single top"
						return
					if(H2.icon_state == "hole bottom left" && H.icon_state == "hole right single")
						H2.icon_state = "hole single bottom"
						return
				if(H2.loc == locate(H.x,H.y + 1,H.z))
					if(H2.icon_state == "hole single top" && H.icon_state == "hole single bottom")
						H2.icon_state = "hole"
						return
					if(H.icon_state == "hole single bottom" && H2.icon_state == "hole side")
						H2.icon_state = "hole single bottom"
						return
					if(H2.icon_state == "hole top right" && H.icon_state == "hole single bottom")
						H2.icon_state = "hole single right"
						return
				if(H2.loc == locate(H.x,H.y - 1,H.z))
					if(H2.icon_state == "hole single bottom" && H.icon_state == "hole single top")
						H2.icon_state = "hole"
						return
					if(H.icon_state == "hole single top" && H2.icon_state == "hole side")
						H2.icon_state = "hole single top"
						return
					if(H2.icon_state == "hole bottom right" && H.icon_state == "hole single top")
						H2.icon_state = "hole right single"
						return
	return

/mob/proc/HitObject()
	if(src.Humanoid)
		if(src.Weapon)
			var/Drop = prob(100 - src.Agility * 2)
			if(Drop)
				var/obj/I = src.Weapon
				view(src) << "<font color = red>[src] loses hold of their [I]!<br>"
				src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
				I.Move(src.loc)
				I.overlays = null
				I.suffix = null
				I.icon_state = I.CarryState
				src.Weight -= I.Weight
				src.Weapon = null
				if(src.client)
					src.client.screen -= I
				if(I.Delete)
					del(I)
		if(src.Weapon2)
			var/Drop = prob(100 - src.Agility * 2)
			if(Drop)
				var/obj/I = src.Weapon2
				view(src) << "<font color = red>[src] loses hold of their [I]!<br>"
				src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
				src.overlays-=image(I.icon,"[I.icon_state] left",I.ItemLayer)
				I.Move(src.loc)
				I.overlays = null
				I.suffix = null
				I.icon_state = I.CarryState
				src.Weight -= I.Weight
				src.Weapon2 = null
				if(src.client)
					src.client.screen -= I
				if(I.Delete)
					del(I)
		if(src.LeftLeg && src.Race != "Snakeman")
			var/Harm = 33
			if(src.WLeftFoot)
				var/obj/Z = src.WLeftFoot
				Harm -= Z.Defence
			var/Harms = prob(Harm)
			if(Harms)
				src.Blood -= 10
				src.LeftLeg -= 10
				if(src.LeftLeg <= 10)
					src.LeftLeg = 10
				src.AddGore("LeftLeg",src.Race)
				src.Pain += 10
				src.Bleed()
				view(6,src) << "<font color=red>[src]'s Left Leg is hurt!"
		if(src.RightLeg && src.Race != "Snakeman")
			var/Harm = 33
			if(src.WRightFoot)
				var/obj/Z = src.WRightFoot
				Harm -= Z.Defence
			var/Harms = prob(Harm)
			if(Harms)
				src.Blood -= 10
				src.RightLeg -= 10
				if(src.RightLeg <= 10)
					src.RightLeg = 10
				src.AddGore("RightLeg",src.Race)
				src.Pain += 10
				src.Bleed()
				view(6,src) << "<font color=red>[src]'s Right Leg is hurt!"
		if(src.LeftArm)
			var/Harm = 33
			if(src.WLeftHand)
				var/obj/Z = src.WLeftHand
				Harm -= Z.Defence
			var/Harms = prob(Harm)
			if(Harms)
				src.Blood -= 10
				src.LeftArm -= 10
				if(src.LeftArm <= 10)
					src.LeftArm = 10
				src.AddGore("LeftArm",src.Race)
				src.Pain += 10
				src.Bleed()
				view(6,src) << "<font color=red>[src]'s Left Arm is hurt!"
		if(src.RightArm)
			var/Harm = 33
			if(src.WRightHand)
				var/obj/Z = src.WRightHand
				Harm -= Z.Defence
			var/Harms = prob(Harm)
			if(Harms)
				src.Blood -= 10
				src.RightArm -= 10
				if(src.RightArm <= 10)
					src.RightArm = 10
				src.AddGore("RightArm",src.Race)
				src.Pain += 10
				src.Bleed()
				view(6,src) << "<font color=red>[src]'s Right Arm is hurt!"
	else
		var/Harm = prob(33)
		if(Harm)
			view(6,src) << "<font color=red>[src] is hurt by a fall!"
			src.HP -= 20
			src.Blood -= 20
			src.Pain += 20
			src.Bleed()
			if(src.HP <= 0)
				src.Death()

/mob/proc/WallDigAttack(var/turf/T)
	if(src.Function == "Interact")
		if(T.Type == "Solid Wall")
			if(T in range(1,src))
				if(T.density == 0)
					return
				var/CanDig = 0
				var/obj/W = null
				if(src.Weapon)
					W = src.Weapon
					if(W.Type == "PickAxe")
						CanDig = 1
				if(src.Weapon2 && CanDig == 0)
					W = src.Weapon2
					if(W.Type == "PickAxe")
						CanDig = 1
				if(CanDig)
					if(src.Job == null && src.CantDoTask == 0)
						view() << "<font color=yellow>[src] begins to dig away at the solid stone wall!<br>"
						W.Dura -= rand(0.5,1)
						src.Job = "Dig"
						src.CanMove = 0
						var/Time = 150 - src.MiningSkill * 1.5
						if(Time <= 20)
							Time = 20
						spawn(Time)
							if(src)
								if(T in range(1,src))
									if(src.Job == "Dig" && T.density && T.Dura >= 0 && src.CantDoTask == 0)
										src.Job = null
										src.MiningSkill += src.MiningSkillMulti
										src.GainStats(3)
										var/obj/Items/Resources/Stone/S = new
										S.Move(src.loc)
										if(T.OrePath)
											var/obj/O = new T.OrePath()
											O.Move(src.loc)
										view() << "<font color=yellow>A large chunk of stone falls away from the solid stone wall!<br>"
										T.Dura -= 200
										if(T.Dura <= 1)
											T.Dura = 0
											T.icon_state = "stone floor"
											T.Type = "Dark"
											T.density = 0
											Tiles += T
											T.opacity = 0
											T.luminosity = 0
										src.CheckWeaponDura(W)
										if(src.Fainted == 0)
											if(src.Stunned == 0)
												if(src.Sleeping == 0)
													var/Legs = 1
													if(src.RightLeg == 0)
														if(src.LeftLeg == 0)
															Legs = 0
													if(Legs)
														src.CanMove = 1
	if(src.Function == "Combat")
		if(T in range(1,src))
			if(T.Dura == 0)
				return
			var/CanAttack = 0
			var/obj/W = null
			if(src.Weapon)
				W = src.Weapon
				if(W.suffix == "Equip")
					if(W.ObjectType == "Dagger")
						src << "<font color = red>A dagger wont be able to damage this wall!<br>"
						return
					if(W.Type == "Ranged")
						src << "<font color = red>A bow wont be able to damage this wall!<br>"
						return
					CanAttack = 1
			if(src.Weapon2)
				W = src.Weapon2
				if(W.suffix == "Equip")
					if(W.ObjectType == "Dagger")
						src << "<font color = red>A dagger wont be able to damage this wall!<br>"
						return
					if(W.Type == "Ranged")
						src << "<font color = red>A bow wont be able to damage this wall!<br>"
						return
					CanAttack = 1
			if(CanAttack)
				if(src.Job == null && src.CantDoTask == 0)
					src.DetermineWeaponSkill()
					view() << "<font color=red>[src] begins an attempt at destroying the [T]!<br>"
					src.Job = "Dig"
					src.CanMove = 0
					var/Time = 200 - src.Agility
					if(Time <= 20)
						Time = 20
					spawn(Time)
						if(src)
							if(T in range(1,src))
								if(src.Job == "Dig" && T.Dura >= 0 && src.CantDoTask == 0)
									src.Job = null
									src.GainStats(3)
									W.Dura -= rand(0.5,1)
									if(T.Material == "Stone")
										if(W.DamageType == "Pierce")
											W.Dura -= rand(2,4)
										if(W.DamageType == "Slash")
											W.Dura -= rand(2,4)
									if(T.Material == "Wood")
										W.Dura -= rand(0.5,1)
									W.Dura -= rand(0.1,1)
									src.CheckWeaponDura(W)
									view() << "<font color=red>[src]'s [W] damages the [T].<br>"
									T.Dura -= src.Strength / 2
									T.Dura -= src.CurrentSkillLevel / 4
									T.Dura -= W.Weight / 3
									T.Dura -= W.Quality / 3
									if(T.Dura <= 1)
										src.Log_player("<font color = red><b>([src.key])[src]-[src.x],[src.y],[src.z]-smashes a [T] down.<br>")
										T.Dura = 0
										T.icon_state = "dirt"
										T.name = "Dirt"
										T.Type = "Light"
										T.Material = null
										T.density = 0
										T.Fuel = 0
										Tiles += T
										T.opacity = 0
										if(Night == 0)
											T.luminosity = 1
										if(Night)
											T.luminosity = 0
									src.MovementCheck()

/mob/proc/Sleeping()
	if(src.CanSleep)
		if(src.Sleeping)
			if(src.Job)
				var/Legs = 1
				if(src.LeftLeg == 0)
					if(src.RightLeg == 0)
						Legs = 0
				if(Legs)
					if(src.Fainted == 0)
						if(src.Stunned == 0)
							src.CanMove = 1
				src.overlays -= /obj/Misc/Sleeping/
				src.Sleeping = 0
				return
			src.Sleep += 1
			if(src.Humanoid)
				if(src.RightArm)
					src.RightArm += 0.08
					if(src.RightArm >= 100)
						src.RightArm = 100
				if(src.LeftArm)
					src.LeftArm += 0.08
					if(src.LeftArm >= 100)
						src.LeftArm = 100
				if(src.RightLeg)
					src.RightLeg += 0.08
					if(src.RightLeg >= 100)
						src.RightLeg = 100
				if(src.LeftLeg)
					src.LeftLeg += 0.08
					if(src.LeftLeg >= 100)
						src.LeftLeg = 100
				if(src.LeftEar)
					src.LeftEar += 0.06
					if(src.LeftEar >= 100)
						src.LeftEar = 100
				if(src.RightEar)
					src.RightEar += 0.06
					if(src.RightEar >= 100)
						src.RightEar = 100
				if(src.Nose)
					src.Nose += 0.06
					if(src.Nose >= 100)
						src.Nose = 100
				if(src.Intestine)
					src.Intestine += 0.03
					if(src.Intestine >= 100)
						src.Intestine = 100
				if(src.LeftLung)
					src.LeftLung += 0.03
					if(src.LeftLung >= 100)
						src.LeftLung = 100
				if(src.RightLung)
					src.RightLung += 0.03
					if(src.RightLung >= 100)
						src.RightLung = 100
				if(src.Bladder)
					src.Bladder += 0.06
					if(src.Bladder >= 100)
						src.Bladder = 100
				if(src.Stomach)
					src.Stomach += 0.04
					if(src.Stomach >= 100)
						src.Stomach = 100
				if(src.Spleen)
					src.Spleen += 0.03
					if(src.Spleen >= 100)
						src.Spleen = 100
				if(src.RightKidney)
					src.RightKidney += 0.03
					if(src.RightKidney >= 100)
						src.RightKidney = 100
				if(src.LeftKidney)
					src.LeftKidney += 0.03
					if(src.LeftKidney >= 100)
						src.LeftKidney = 100
				if(src.Brain)
					src.Brain += 0.03
					if(src.Brain >= 100)
						src.Brain = 100
				if(src.Heart)
					src.Heart += 0.03
					if(src.Heart >= 100)
						src.Heart = 100
				if(src.LeftEye)
					src.LeftEye += 0.03
					if(src.LeftEye >= 100)
						src.LeftEye = 100
				if(src.RightEye)
					src.RightEye += 0.03
					if(src.RightEye >= 100)
						src.RightEye = 100
				if(src.Throat)
					src.Throat += 0.06
					if(src.Throat >= 100)
						src.Throat = 100
				if(src.Skull)
					src.Skull += 0.08
					if(src.Skull >= 100)
						src.Skull = 100
				if(src.Liver)
					src.Liver += 0.03
					if(src.Liver >= 100)
						src.Liver = 100
				if(src.Tongue)
					src.Tongue += 0.06
					if(src.Tongue >= 100)
						src.Tongue = 100
				if(src.Teeth)
					src.Teeth += 0.03
					if(src.Teeth >= 100)
						src.Teeth = 100
				var/HasArms = 0
				if(src.RightArm)
					HasArms = 1
				if(src.LeftArm)
					HasArms = 1
				var/ClawList = list("Wolfman","Illithid","Ratling")
				if(HasArms)
					if(src.Race in ClawList)
						src.Claws += 0.1
						if(src.Claws >= 100)
							src.Claws = 100
			if(src.Sleep >= 100)
				src.Sleep = 100
		else
			src.overlays -= /obj/Misc/Sleeping/
			if(src.Fainted)
				src.Sleeping = 0
				return
			if(src.Stunned)
				src.Sleeping = 0
				return
			var/Legs = 1
			if(src.LeftLeg == 0)
				if(src.RightLeg == 0)
					Legs = 0
			if(Legs)
				if(src.Job == null)
					src.CanMove = 1
	spawn(25) Sleeping()

/mob/proc/RemoveOwnedItems()
	for(var/mob/C in view(7,src))
		if(C.Type == "Merchant")
			if(src.Pull)
				if(isobj(src.Pull))
					var/obj/O = src.Pull
					for(var/obj/I in O)
						if(I in C.Selling)
							I.Move(src.loc)
							O.Weight -= I.Weight
							I.suffix = null
							I.overlays-=image(/obj/HUD/C/)
							I.overlays-=image(/obj/HUD/E/)
							I.layer = 4
							if(I.CarryState)
								I.icon_state = I.CarryState
			for(var/obj/I in src)
				if(I in C.Selling)
					I.Move(src.loc)
					src.Weight -= I.Weight
					I.suffix = null
					src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					src.overlays-=image(I.icon,"[I.icon_state]",I.ItemLayer)
					I.overlays-=image(/obj/HUD/C/)
					I.overlays-=image(/obj/HUD/E/)
					I.layer = 4
					if(I.CarryState)
						I.icon_state = I.CarryState
					if(I == src.Weapon)
						src.Weapon = null
					if(I == src.Weapon2)
						src.Weapon2 = null
					if(I == src.WHead)
						src.WHead = null
					if(I == src.WChest)
						src.WChest = null
					if(I == src.WUpperBody)
						src.WUpperBody = null
					if(I == src.WShoulders)
						src.WShoulders = null
					if(I == src.WLeftHand)
						src.WLeftHand = null
					if(I == src.WRightHand)
						src.WRightHand = null
					if(I == src.WLegs)
						src.WLegs = null
					if(I == src.WLeftFoot)
						src.WLeftFoot = null
					if(I == src.WRightFoot)
						src.WRightFoot = null
					if(I == src.WWaist)
						src.WWaist = null
					if(I == src.WBack)
						src.WBack = null
					if(I == src.WExtra)
						src.WExtra = null

/mob/proc/HungerTick()
	if(src.CanEat)
		src.Hunger -= src.HungerMulti
		if(src.Hunger <= 0)
			src.Hunger = 0
		if(src.Hunger <= 10)
			if(src.EatNotice == 0)
				src << "<font color=red>You feel very hungry!<br>"
				src.EatNotice = 1
				var/Ill = prob(10)
				if(Ill)
					var/AlreadyIll = 0
					if("Ill" in src.Afflictions)
						AlreadyIll = 1
					if(AlreadyIll == 0)
						src.Afflictions += "Ill"
						src.Illness(20)
				if(src.Faction == "Undead")
					var/NoList = list("Giant","Cyclops","Ratling","Stahlite","Snakeman")
					var/CanTurnSkelly = 1
					if(src.Race in NoList)
						CanTurnSkelly =0
					if(CanTurnSkelly)
						src.MakeSkeleton()
					src.Strength = src.Strength / 2
					src.Agility = src.Agility / 2
					src.Endurance = src.Endurance / 2
					src.CanEat = 0
					src << "<font color = purple>[src]'s stomach gurgles and splutters before exspelling itself out of [src]'s mouth in a liquidated form! They seem alot weaker now!<br>"
				spawn(1000)
					if(src)
						src.EatNotice = 0
		if(src.Hunger <= 20)
			if(src.EatNotice == 0)
				src << "<font color=green>You feel rather hungry...<br>"
				src.EatNotice = 1
				spawn(1000)
					if(src)
						src.EatNotice = 0
	else
		return
	spawn(2000) HungerTick()

/mob/proc/SleepTick()
	if(src.CanSleep)
		src.Sleep -= 1
		if(src.Sleep <= 0)
			src.Sleep = 0
		if(src.Sleep <= 10)
			if(src.SleepNotice == 0)
				src << "<font color=red>You feel very tired!<br>"
				src.SleepNotice = 1
				var/Ill = prob(10)
				if(Ill)
					var/AlreadyIll = 0
					if("Ill" in src.Afflictions)
						AlreadyIll = 1
					if(AlreadyIll == 0)
						src.Afflictions += "Ill"
						src.Illness(20)
				spawn(1000)
					if(src)
						src.SleepNotice = 0
		if(src.Sleep <= 20)
			if(src.SleepNotice == 0)
				src << "<font color=green>You feel rather tired...<br>"
				src.SleepNotice = 1
				spawn(1000)
					if(src)
						src.SleepNotice = 0
	else
		return
	spawn(2000) SleepTick()

/mob/proc/WhoProc()
	var/Num = 0
	for(var/mob/M in Players)
		if(M.client)
			var/ShowRace = ""
			var/ShowIP = ""
			if(src.Admin)
				ShowRace = "- [M.Race]"
				ShowIP = "- [M.client.address]"
			src << "([M.key])[M] - [M.OrginalName][ShowRace][ShowIP]"
			Num += 1
	src << "Total - [Num]"
	return

/mob/proc/OOCToggle()
	if(src.OOC)
		src.OOC = 0
		src << "Your OOC is now off!<br>"
		return
	if(src.OOC == 0)
		src.OOC = 1
		src << "Your OOC is now on!<br>"
		return

/mob/proc/ResetButtons()
	if(src)
		if(src.client)
			src.client.mouse_pointer_icon = 'Cursor.dmi'
			for(var/obj/HUD/B in src.client.screen)
				if(B.Type == "Interact")
					if(src.Target && B.icon_state == "int on")
						src << "<b>Target lost!<br>"
						var/mob/m = src.Target
						src.client.images -= m.TargetIcon
						if(m.client)
							if(src.Target in range(6,src))
								view(src) << "<font color = yellow> [src] stands down from combat while facing in [src.Target]'s direction!<br>"
						src.Target = null
					B.icon_state = "int off"
				if(B.Type == "PickUp")
					if(src.Target && B.icon_state == "pick on")
						src << "<b>Target lost!<br>"
						var/mob/m = src.Target
						src.client.images -= m.TargetIcon
						if(m.client)
							if(src.Target in range(6,src))
								view(src) << "<font color = yellow> [src] stands down from combat while facing in [src.Target]'s direction!<br>"
						src.Target = null
					B.icon_state = "pick off"
				if(B.Type == "Examine")
					if(src.Target && B.icon_state == "examine on")
						src << "<b>Target lost!<br>"
						var/mob/m = src.Target
						src.client.images -= m.TargetIcon
						if(m.client)
							if(src.Target in range(6,src))
								view(src) << "<font color = yellow> [src] stands down from combat while facing in [src.Target]'s direction!<br>"
						src.Target = null
					B.icon_state = "examine off"
				if(B.Type == "Pull")
					if(src.Target && B.icon_state == "pull on")
						src << "<b>Target lost!<br>"
						var/mob/m = src.Target
						src.client.images -= m.TargetIcon
						if(m.client)
							if(src.Target in range(6,src))
								view(src) << "<font color = yellow> [src] stands down from combat while facing in [src.Target]'s direction!<br>"
						src.Target = null
					B.icon_state = "pull off"
				if(B.Type == "Equip")
					B.icon_state = "equip button off"
				if(B.Type == "Skill")
					if(B.icon_state == "skills on")
						src.Delete("SkillDisplay","SkillDisplay")
						B.icon_state = "skills off"
				if(B.Type == "Build")
					if(B.icon_state == "build on")
						src.Delete("Building","Building")
						B.icon_state = "build off"
				if(B.Type == "Stats")
					if(B.icon_state == "stats on")
						src.Delete("InfoDisplay","InfoDisplay")
						B.icon_state = "stats off"
				if(B.Type == "Health")
					if(B.icon_state == "health on")
						src.Delete("HealthDisplay","HealthDisplay")
						B.icon_state = "health off"
				if(B.Type == "Combat")
					if(B.icon_state == "combat on")
						B.icon_state = "combat off"
	return

/mob/proc/Pull()
	if(src.Pull)
		var/atom/O = src.Pull
		if(O.suffix)
			src.Pull = null
			return
		if(O.Pull == src)
			if(O.OnFire)
				src.Pull = null
				O.Pull = null
				return
			if(src.Dead)
				src.Pull = null
				return
			if(O.suffix == null)
				if(ismob(O))
					var/mob/M = O
					if(src.Fainted)
						src.Pull = null
						M.Pull = null
						return
					if(M.Fainted == 0)
						src.Pull = null
						M.Pull = null
						return
					M.loc = src.LastLoc
					if(src.InWater == 0)
						M.InWater = 0
						M.overlays -= /obj/Misc/Bubbles/
						M.overlays -= /obj/Misc/Swim/
				if(isobj(O))
					var/obj/I = O
					I.Move(src.LastLoc)
		else
			src.Pull = null
			return
	else
		src.Pull = null
		return
	spawn(1) Pull()

/mob/proc/GiveHair(var/Bald)
	if(src.Gender == "Male")
		if(src.Race != "Giant" && src.Race != "Cyclops")
			var/H = rand(1,5)
			if(Bald == "NoBald" && H == 5)
				H = 4
			if(H == 1)
				var/obj/Misc/Hairs/HairLeft/Z = new
				src.Hair = Z
				src.overlays += src.Hair
			if(H == 2)
				var/obj/Misc/Hairs/HairRight/Z = new
				src.Hair = Z
				src.overlays += src.Hair
			if(H == 3)
				var/obj/Misc/Hairs/Middle/Z = new
				src.Hair = Z
				src.overlays += src.Hair
			if(H == 4)
				var/obj/Misc/Hairs/PotHead/Z = new
				src.Hair = Z
				src.overlays += src.Hair
		else
			var/H = rand(1,2)
			if(H == 1)
				var/obj/Misc/Hairs/GiantHairMale/Z = new
				src.Hair = Z
				src.overlays += src.Hair
	if(src.Gender == "Female")
		if(src.Race != "Giant" && src.Race != "Cyclops")
			var/obj/Misc/Hairs/Long/Z = new
			src.Hair = Z
			src.overlays += Z
		else
			var/obj/Misc/Hairs/GiantHairFemale/Z = new
			src.Hair = Z
			src.overlays += src.Hair

/mob/proc/BloodTrail()
	if(src.Fainted == 0 && src.Stunned == 0)
		var/obj/Misc/Gore/BloodTrail/B = new
		B.Move(src.LastLoc)
		B.dir = src.dir
	spawn(9) BloodTrail()

/mob/proc/Save()
	if(Ruining)
		return
	if(src.LoggedIn == 0)
		return
	src.TargetIcon = null
	src.overlays = null
	var/player_sav = "players/[ckey].sav"
	var/savefile/F = new(player_sav)
	var/X = src.x
	var/Y = src.y
	var/Z = src.z
	var/Ver = world.version
	F["X"] << X
	F["Y"] << Y
	F["Z"] << Z
	F["Version"] << Ver
	Write(F)
	src << "Saved"

/mob/proc/Load()
	var/player_sav = "players/[src.ckey].sav"
	if(length(file(player_sav)))
		var/savefile/F = new(player_sav)
		Read(F)
		var/X
		var/Y
		var/Z
		var/Ver
		F["X"] >> X
		F["Y"] >> Y
		F["Z"] >> Z
		F["Version"] >> Ver
		src.loc = locate(X,Y,Z)
		src.overlays = null
		src.client.dir = NORTH
		if(src.InWater == 2)
			src.Breathe()
		if(src.Weight <= 0)
			src.Weight = 0
		for(var/obj/I in src)
			I.layer = 20
			if(I.name == "DemonicSword")
				I.DemonicSwordMagic()
			if(I.suffix == "Fused")
				I.icon_state = I.EquipState
				src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
				if(I.icon_state != "Corruption6")
					src.Corruption()
			if(I.suffix == "Equip")
				if(I == src.Weapon2)
					I.icon_state = "[I.EquipState] left"
					src.overlays+=image(I.icon,"[I.icon_state]",I.ItemLayer)
				else
					I.icon_state = I.EquipState
					src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
				if(I == src.WExtra)
					I.icon_state = I.CarryState
				if(I.Type == "Torch Lit")
					I.LightProc(src)
		for(var/obj/Items/Resources/Skin/S in src)
			S.CreateLeather()
		src.Attack()
		if(src.CanUseMagic == 0)
			spawn(100)
				if(src)
					src.CanUseMagic = 1
		if(src.CanExamine == 0)
			spawn(100)
				if(src)
					src.CanExamine = 1
		if(src.CanInteract == 0)
			spawn(100)
				if(src)
					src.CanInteract = 1
		if(src.Faction != "Undead")
			src.Regen()
			src.Bleed = null
			if(src.Blood >= src.BloodMax)
				src.Blood = src.BloodMax
			if(src.Blood != src.BloodMax)
				if(src.Dead == 0)
					src.Bleed()
					view(src) << "<font color =red>[src] is bleeding [src.Bleed]!<br>"
			src.BloodFlow()
		else
			src.UndeadProc()
		if(src.CanSleep)
			src.SleepTick()
		if(src.CanEat)
			src.HungerTick()
		src.Update()
		src.Noise()
		src.CheckAfflictions()
		src.RemoveCombatOverlays()
		src.CreateGUI()
		src.overlays -= /obj/Misc/Fire/
		if(src.Dead == 0)
			src.density = 1
			src.CanAttack = 1
		if(src.Jailed)
			src.JailTime()
		if(src.Hair)
			if(src.WHead == null)
				src.overlays += src.Hair
			if(src.WHead)
				var/obj/H = src.WHead
				if(H.Type == "Crown")
					src.overlays += src.Hair
		if(src.Beard)
			if(src.Race != "Stahlite")
				if(src.WHead == null)
					src.overlays += src.Beard
			else
				src.overlays += src.Beard
		if(src.OnFire)
			if(src.Fuel)
				src.overlays += /obj/Misc/Fire/
				src.luminosity = 5
				src.CreateSmoke()
				src.Burn(0)
				src.OnFire(1)
		if(src.Fainted)
			src.Fainted()
		if(src.Stunned)
			src.Stun()
		if(src.MortalWound)
			src.MortallyWounded()
		if(src.Sleeping)
			src.Sleeping = 0
			if(src.Fainted == 0)
				if(src.Stunned == 0)
					var/Legs = 1
					if(src.RightLeg == 0)
						if(src.LeftLeg == 0)
							Legs = 0
					if(Legs)
						src.CanMove = 1
			src.overlays -= /obj/Misc/Sleeping/
		if(src.CanMove == 0)
			if(src.Fainted == 0)
				if(src.Stunned == 0)
					var/Legs = 1
					if(src.RightLeg == 0)
						if(src.LeftLeg == 0)
							Legs = 0
					if(Legs)
						if(src.Sleeping == 0)
							src.CanMove = 1
		if(src.Dead == 0)
			src.luminosity = 0
			src.density = 1
			src.GoreCheck()
		else
			src.RemakeChoice()
	var/CurrentAge = Year - src.Born
	src.Age = CurrentAge
	if(src.Age <= 0)
		src.Age = 0
	var/SkillCaps = Age
	if(SkillCaps >= 0)
		while(SkillCaps)
			src.SkillCap += 16
			src.StrCap += 16
			src.EndCap += 16
			src.AgilCap += 16
			src.IntCap += 16
			SkillCaps -= 1
	if(src.SkillCap >= WorldSkillsCap)
		src.SkillCap = WorldSkillsCap
	if(src.StrCap >= WorldStrCap)
		src.StrCap = WorldStrCap
	if(src.AgilCap >= WorldAgilCap)
		src.AgilCap = WorldAgilCap
	if(src.EndCap >= WorldEndCap)
		src.EndCap = WorldEndCap
	if(src.IntCap >= WorldIntCap)
		src.IntCap = WorldIntCap
	if(src.Preg == 3)
		src.BirthTimer()
	for(var/turf/T in range(0,src))
		if(T.density && T.opacity)
			src.loc = locate(1,1,1)
			src << "<font color = teal>You were teleported to 1,1,1 because the Load Proc detected that you spawned on Dense Turf. It is possible that a Map wipe or Bug happened, please report this to an Admin.<br>"
	src << "<font color = teal>You are [src.Age] years old!<br>"

/mob/proc/MovementCheck()
	if(src.Stunned == 0 && src.Fainted == 0 && src.Sleeping == 0)
		if(src.Humanoid)
			var/Legs = 1
			if(src.RightLeg == 0)
				if(src.LeftLeg == 0)
					Legs = 0
			if(Legs)
				src.CanMove = 1
		else
			src.CanMove = 1

/mob/proc/GoreCheck()
	if(src.WoundHead)
		var/obj/W = src.WoundHead
		var/icon/I
		I = initial(W.icon)
		W.icon = I
		src.overlays += src.WoundHead
	if(src.WoundTorso)
		var/obj/W = src.WoundTorso
		var/icon/I
		I = initial(W.icon)
		W.icon = I
		src.overlays += src.WoundTorso
	if(src.WoundRightArm)
		var/obj/W = src.WoundRightArm
		var/icon/I
		I = initial(W.icon)
		W.icon = I
		src.overlays += src.WoundRightArm
	if(src.WoundLeftArm)
		var/obj/W = src.WoundLeftArm
		var/icon/I
		I = initial(W.icon)
		W.icon = I
		src.overlays += src.WoundLeftArm
	if(src.WoundLeftLeg)
		var/obj/W = src.WoundLeftLeg
		var/icon/I
		I = initial(W.icon)
		W.icon = I
		src.overlays += src.WoundLeftLeg
	if(src.WoundRightLeg)
		var/obj/W = src.WoundRightLeg
		var/icon/I
		I = initial(W.icon)
		W.icon = I
		src.overlays += src.WoundRightLeg

/mob/proc/High(var/Dur)
	if(src.client == null)
		return
	if(Dur)
		Dur -= 1
		var/DIR = rand(1,4)
		if(DIR == 1)
			src.client.dir = NORTH
		if(DIR == 2)
			src.client.dir = SOUTH
		if(DIR == 3)
			src.client.dir = EAST
		if(DIR == 4)
			src.client.dir = WEST
	else
		src.client.dir = NORTH
		for(var/obj/HUD/GUI/ScreenOverlay/SO in src.client.screen)
			SO.icon_state = "blank screen"
		return
	spawn(100) src.High(Dur)

/mob/proc/AddGore(var/Area,var/VictimsRace)
	if(src.BloodMax >= 1 && src.Humanoid)
		if(Area == "RightLeg" && src.WoundRightLeg == null)
			var/obj/Misc/Gore/RightLegWound/RL = new
			var/LargeBeing = 0
			var/SmallBeing = 0
			if(VictimsRace == "Giant")
				LargeBeing = 1
			if(VictimsRace == "Cyclops")
				LargeBeing = 1
			if(VictimsRace == "Ratling")
				SmallBeing = 1
			if(VictimsRace == "Stahlite")
				SmallBeing = 1
			if(LargeBeing)
				RL.icon_state = "damage rleg large"
			if(SmallBeing)
				RL.icon_state = "damage rleg small"
			src.overlays += RL
			src.WoundRightLeg = RL
		if(Area == "LeftLeg" && src.WoundLeftLeg == null)
			var/obj/Misc/Gore/LeftLegWound/LL = new
			var/LargeBeing = 0
			var/SmallBeing = 0
			if(VictimsRace == "Giant")
				LargeBeing = 1
			if(VictimsRace == "Cyclops")
				LargeBeing = 1
			if(VictimsRace == "Ratling")
				SmallBeing = 1
			if(VictimsRace == "Stahlite")
				SmallBeing = 1
			if(LargeBeing)
				LL.icon_state = "damage lleg large"
			if(SmallBeing)
				LL.icon_state = "damage lleg small"
			src.overlays += LL
			src.WoundLeftLeg = LL
		if(Area == "LeftArm" && src.WoundLeftArm == null)
			var/obj/Misc/Gore/LeftArmWound/LA = new
			var/LargeBeing = 0
			var/SmallBeing = 0
			if(VictimsRace == "Giant")
				LargeBeing = 1
			if(VictimsRace == "Cyclops")
				LargeBeing = 1
			if(VictimsRace == "Ratling")
				SmallBeing = 1
			if(VictimsRace == "Stahlite")
				SmallBeing = 1
			if(LargeBeing)
				LA.icon_state = "damage larm large"
			if(SmallBeing)
				LA.icon_state = "damage larm small"
			src.overlays += LA
			src.WoundLeftArm = LA
		if(Area == "RightArm" && src.WoundRightArm == null)
			var/obj/Misc/Gore/RightArmWound/RA = new
			var/LargeBeing = 0
			var/SmallBeing = 0
			if(VictimsRace == "Giant")
				LargeBeing = 1
			if(VictimsRace == "Cyclops")
				LargeBeing = 1
			if(VictimsRace == "Ratling")
				SmallBeing = 1
			if(VictimsRace == "Stahlite")
				SmallBeing = 1
			if(LargeBeing)
				RA.icon_state = "damage rarm large"
			if(SmallBeing)
				RA.icon_state = "damage rarm small"
			src.overlays += RA
			src.WoundRightArm = RA
		if(Area == "Torso" && src.WoundTorso == null)
			var/obj/Misc/Gore/TorsoWound/TW = new
			var/LargeBeing = 0
			var/SmallBeing = 0
			if(VictimsRace == "Giant")
				LargeBeing = 1
			if(VictimsRace == "Cyclops")
				LargeBeing = 1
			if(VictimsRace == "Ratling")
				SmallBeing = 1
			if(VictimsRace == "Stahlite")
				SmallBeing = 1
			if(LargeBeing)
				TW.icon_state = "damage torso large"
			if(SmallBeing)
				TW.icon_state = "damage torso small"
			src.overlays += TW
			src.WoundTorso = TW
		if(Area == "Head" && src.WoundHead == null)
			var/obj/Misc/Gore/HeadWound/HW = new
			var/LargeBeing = 0
			var/SmallBeing = 0
			if(VictimsRace == "Giant")
				LargeBeing = 1
			if(VictimsRace == "Cyclops")
				LargeBeing = 1
			if(VictimsRace == "Ratling")
				SmallBeing = 1
			if(VictimsRace == "Stahlite")
				SmallBeing = 1
			if(LargeBeing)
				HW.icon_state = "damage head large"
			if(SmallBeing)
				HW.icon_state = "damage head small"
			src.overlays += HW
			src.WoundHead = HW

/mob/proc/UndeadReset()
	src.AgilityMulti = src.AgilityMulti / 2
	src.StrengthMulti = src.StrengthMulti * 1.5
	src.EnduranceMulti = src.EnduranceMulti * 1.5
	src.SmeltingSkillMulti = 0.05
	src.ForgingSkillMulti = 0.05
	if(src.SmeltingSkill)
		src.SmeltingSkill += src.SmeltingSkill / 2
	if(src.ForgingSkill)
		src.ForgingSkill += src.ForgingSkill / 2
	src.CreateList = null
	src.CreateList = list()
	src << "<font color = red>You forget about all the objects you once knew how to create!<br>"

/mob/proc/UndeadProc()
	if(src.Faction == "Undead" && src.Humanoid && src.Dead == 0)
		var/Twitch = prob(5)
		if(Twitch)
			view(src) << "<font color = yellow>[src]'s body begins to twitch violently for a moment as they drool at the mouth.<br>"
		if(src.Hair)
			var/FallOut = prob(1)
			if(FallOut)
				src.overlays -= src.Hair
				src.overlays -= src.Beard
				view(src) << "<font color = yellow>[src]'s hair begins to fall out!<br>"
	else
		return
	spawn(1200) UndeadProc()

/mob/proc/MakeSkeleton()
	view(src) << "<font color = yellow>[src]'s flesh begins to rot and fall away from their body, leaving behind an empty skeletal frame!<br>"
	src.icon = 'Skeleton.dmi'
	src.Agility = src.Agility * 2
	src.LimbLoss()
	src.Brain = 0
	src.LeftEar = 0
	src.RightEar = 0
	src.Nose = 0
	src.Teeth = 0
	src.Tongue = 0
	src.Throat = 0
	src.Heart = 0
	src.LeftLung = 0
	src.RightLung = 0
	src.Spleen = 0
	src.Intestine = 0
	src.LeftKidney = 0
	src.RightKidney = 0
	src.Liver = 0
	src.Bladder = 0
	src.Stomach = 0
	if(src.Hair)
		src.overlays -= src.Hair
		src.Hair = null
	if(src.Beard)
		src.overlays -= src.Beard
		src.Beard = null

