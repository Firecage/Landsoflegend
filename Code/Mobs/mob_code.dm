/mob/
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