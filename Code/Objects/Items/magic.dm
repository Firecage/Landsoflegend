/obj/Items/Magical
	icon = 'magical artifacts.dmi'

/obj/Items/Magical/Mystical_Ball
	icon_state = "mystical ball"
	Weight = 1
	desc = "A strange ball that has an eerie inner glow. It seems to be made from crystal and emmits both a semi-transparent aura and low pitch gentle humm.<p> Using this ball will slowly increase Intelligence and Astral Magic. As your skill in Astral goes up, new abilties for this ball will unlock."

/obj/Items/Magical/Mystical_Ball/Click()
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(usr.CanInteract == 0)
				usr << "<font color = red>You cant do that for a while!<br>"
				return
			if(usr.Sleeping)
				return
			if(usr.Fainted)
				return
			var/Arms = 0
			if(usr.LeftArm >= 25)
				Arms = 1
			if(usr.RightArm >= 25)
				Arms = 1
			if(Arms == 0)
				return
			usr.CanInteract = 0
			spawn(300)
				if(usr)
					usr.CanInteract = 1
			var/Understand = 0
			Understand = prob(usr.Intelligence + usr.AstralMagic)
			if(Understand)
				if(usr.AstralMagic <= 20)
					var/Harm = prob(20)
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
						view(6,usr) << "<font color = purple>[src] reacts in a negative way. [usr]'s body is wreaked with leathal Magical energies due to lack in skill with the Orb.<br>"
					usr.AstralMagic += usr.MagicPotentcy / 100
					if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
						usr.Intelligence += usr.IntelligenceMulti / 3
				else
					if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
						usr.Intelligence += usr.IntelligenceMulti / 6
				usr << "<font color = teal>You manage to activate the balls Magic...<br>"
				view(6,usr) << "<font color = yellow>[usr] waves their hands over a strange mystical ball..."
				var/list/menu = new()
				menu += "Telepath"
				if(usr.AstralMagic >= 5)
					menu += "Locate"
				if(usr.AstralMagic >= 15)
					menu += "Teleport"
				menu += "Cancel"
				var/Result = input(usr,"Choose a power to use.", "Choose", null) in menu
				if(Result == "Cancel")
					return
				if(Result == "Teleport")
					var/X = input("Input the X of where you wish to Magically Teleport to.")as null|num
					if(!X)
						return
					var/Y = input("Input the Y of where you wish to Magically Teleport to.")as null|num
					if(!Y)
						return
					var/Z = input("Input the Z of where you wish to Magically Teleport to.")as null|num
					if(!Z)
						return
					if(X && Y && Z)
						if(X >= 300)
							X = 300
						if(Y >= 250)
							Y = 250
						if(X <= 1)
							X = 1
						if(Y <= 1)
							Y = 1
						if(src.suffix == "Stuck")
							var/Cant = 0
							for(var/turf/T in block(locate(97,45,3),locate(115,38,3)))
								if(T.x == X && T.y == Y)
									Cant = 1
							if(Cant)
								usr << "<font color = red>You are un-able to open a portal there, strange Magics prevent it!<br>"
								return
						if(src in range(1,usr))
							view(6,usr) << "<font color = yellow>The [src] that [usr] holds suddenly glows a bright blue, opening a strange portal!<br>"
							if(usr.AstralMagic <= 20)
								usr << "<font color = purple>Your skill with using the Orb has effected the location you've chosen.<br>"
								var/PlusMinus = rand(1,2)
								if(PlusMinus == 1)
									X += rand(5,20)
									Y -= rand(5,20)
								if(PlusMinus == 2)
									X -= rand(5,20)
									Y += rand(5,20)
							if(Z == 2 && X <= 20 && Y <= 20)
								X = 40
								Y = 40
							var/obj/Misc/Gates/AstralGate/G = new
							G.loc = usr.loc
							var/obj/Misc/Gates/AstralGate/G2 = new
							G2.loc = locate(X,Y,Z)
							G2.GoesTo = G.loc
							G.GoesTo = G2.loc
				if(Result == "Locate")
					var/list/menu2 = new()
					var/Mobs = list()
					for(var/mob/M in world)
						if(M.client)
							menu2 += "[M.name]"
							if(M.OrginalName)
								menu2 += "[M.OrginalName]"
							Mobs += M
					menu2 += "Cancel"
					var/Result2 = input("Choose someone you want to Locate.", "Choose", null) in menu2
					if (Result2 == "Cancel")
						return
					if(Result2)
						var/mob/Found = null
						for(var/mob/M in Mobs)
							if(M.name == Result2)
								Found = M
							if(M.OrginalName == Result2)
								Found = M
						if(Found)
							if(src in range(1,usr))
								var/X = Found.x
								var/Y = Found.y
								var/Z = Found.z
								if(usr.AstralMagic <= 20)
									var/PlusMinus = rand(1,2)
									if(PlusMinus == 1)
										X += rand(5,20)
										Y -= rand(5,20)
									if(PlusMinus == 2)
										X -= rand(5,20)
										Y += rand(5,20)
								usr << "<font color = teal>You use the orbs powers to locate [Found], you think they might be at [X],[Y],[Z]<br>"
								return
				if(Result == "Telepath")
					var/list/menu2 = new()
					var/Mobs = list()
					for(var/mob/M in world)
						if(M.client)
							menu2 += "[M.name]"
							if(M.OrginalName)
								menu2 += "[M.OrginalName]"
							Mobs += M
					menu2 += "Cancel"
					var/Result2 = input("Choose someone you want to Telepath.", "Choose", null) in menu2
					if (Result2 == "Cancel")
						return
					if(Result2)
						var/mob/Found = null
						for(var/mob/M in Mobs)
							if(M.name == Result2)
								Found = M
							if(M.OrginalName == Result2)
								Found = M
						if(Found)
							if(src in range(1,usr))
								if(usr.Muted)
									usr << "<font color =red>You cant talk, your Muted!<br>"
									return
								var/T = input("Telepath - In Character")as null|text
								if(!T)
									return
								if(usr.invisibility && usr.Admin == 0)
									view(1,usr) << "<font color = teal>[usr] whispers:Wooooo....."
									return
								var/obj/SL = usr.CurrentLanguage
								var/NewText = null
								var/Text = null
								var/TextLength = lentext(T)
								var/Understands = 0
								if(usr.CurrentLanguage)
									for(var/obj/Misc/Languages/HL in Found.LangKnow)
										if(SL.name == HL.name)
											Understands = HL.SpeakPercent
											if(HL.SpeakPercent <= 100)
												var/NotSpeaker = 1
												if(HL in usr.LangKnow)
													NotSpeaker = 0
												if(NotSpeaker)
													if(SL.SpeakPercent >= HL.SpeakPercent && HL.SpeakPercent <= 97)
														HL.SpeakPercent += Found.Intelligence / 20
														if(Found.Intelligence <= Found.IntCap && Found.Intelligence <= WorldIntCap && Found.Intelligence <= Found.IntelligenceMax)
															Found.Intelligence += Found.IntelligenceMulti / 10
								if(Understands == 0)
									Found.LearnRaceLanguages("[usr.CurrentLanguage]")
								while(TextLength >= 1)
									Text ="[copytext(T,(lentext(T)-TextLength)+1,(lentext(T)-TextLength)+2)]"
									var/Change = 0
									Change = prob(100 - Understands)
									if(Change)
										Found.CheckText(Text)
										NewText+="[Found.TextOutput]"
										Found.TextOutput = null
									if(Change == 0)
										NewText+="[copytext(T,(lentext(T)-TextLength)+1,(lentext(T)-TextLength)+2)]"
									TextLength--
								Found << "<font color=red>You hear [usr]'s voice in your head (In [SL.name]): [Safe_Guard(NewText)]<br>"
								usr << "<font color=red>[Found] hears your voice (In [SL.name]): [Safe_Guard(NewText)]<br>"
								usr.Log_player("([usr.key])[usr] Telepath to [Found] - [T]")
				return
			else
				if(usr.AstralMagic <= 20)
					usr.AstralMagic += usr.MagicPotentcy / 200
					if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
						usr.Intelligence += usr.IntelligenceMulti / 3
				usr << "<font color = teal>You failed to activate the balls Magic.<br>"
				view(6,usr) << "<font color = yellow>[usr] waves their hands over a strange mystical ball..."
				return
	if(usr.Function == "Examine")
		if(src in range(1,usr))
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
			src.icon_state = "mystical ball"
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
					src.icon_state = "mystical ball glow"
					usr << "<font color = teal>[src] seems to react to your touch, glowing slightly.<br><br>"
					return
				else
					usr << "<b>You cant carry too much weight!<br>"
					return
			else
				usr << "<b>You cant pick that item up!<br>"
				return
