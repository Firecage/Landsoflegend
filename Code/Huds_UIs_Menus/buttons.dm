/obj/HUD/Buttons
	icon = 'HUD2.dmi'

/obj/HUD/Buttons/IllithidPowers
	name = "Powers"
	icon_state = "illithid powers"
	screen_loc = "15,2"
	layer = 10

/obj/HUD/Buttons/IllithidPowers/Click()
	if(usr.Dead)
		return
	if(usr.Fainted)
		return
	var/list/menu = new()
	menu += "Telepath"
	menu += "Locate"
	menu += "Observe"
	menu += "Mind Blast"
	menu += "Mind Probe"
	menu += "Cancel"
	var/Result = input("Choose a power to use.", "Choose", null) in menu
	if (Result == "Cancel")
		return
	if(Result == "Mind Blast")
		if(usr.CanUseMagic == 0)
			usr << "<font color = red>You must wait a while!<br>"
			return
		var/list/menu2 = new()
		for(var/mob/M in view(6,usr))
			if(M != usr)
				menu2 += M
		menu2 += "Cancel"
		var/Result2 = input("Choose someone you want to Mind Blast.", "Choose", null) in menu2
		if(Result2 == "Cancel")
			return
		if(Result2)
			if(usr.CanUseMagic == 0)
				usr << "<font color = red>You must wait a while!<br>"
				return
			var/mob/M = Result2
			if(M in view(6,usr))
				usr.CanUseMagic = 0
				spawn(200)
					if(usr)
						usr.CanUseMagic = 1
				var/EnterMind = 0
				EnterMind = prob(100 - M.Intelligence / 2)
				if(M.Fainted)
					EnterMind = 1
				if(M.Faction == "Undead")
					EnterMind = 0
				if(EnterMind == 0)
					usr << "<font color = red>[M] blocks you from entering their mind!<br>"
					M << "<font color = red>[usr] tried to enter your mind with their powers, but you resist!<br>"
					return
				if(EnterMind)
					usr << "<font color = red>You enter [M]'s Mind...<br>"
					M << "<font color = red>([usr.key])[usr] enters your mind!<br>"
					spawn(200)
						if(usr && M && M.Dead == 0 && usr.Dead == 0)
							if(M in range(6,usr))
								var/HurtMind = 0
								HurtMind = prob(100 - M.Intelligence / 2)
								if(HurtMind == 0)
									usr << "<font color = red>[M] blocks you from Blasting their mind!<br>"
									M << "<font color = red>([usr.key])[usr] tried to Blast your mind with their powers, but you resist!<br>"
									return
								if(HurtMind)
									usr << "<font color = red>You manage to Blast [M]'s Mind!<br>"
									M << "<font color = red>([usr.key])[usr] manages to Blast your mind!<br>"
									M.Pain += rand(10,20)
									M.Brain -= rand(3,6)
									M.Brain -= usr.Intelligence / 5
									M.CanMove = 0
									if(M.Fainted == 0)
										M.Stunned = 1
										M.Stun()
										view(6,M) << "<font color=red>[M] has been stunned!<br>"
									if(M.Target == null && M.client == null)
										M.Target = usr
									var/Critical = prob(5 + usr.Intelligence / 3)
									if(Critical)
										M.Brain -= rand(5,7)
										M.Brain -= usr.Intelligence / 10
										view(6,M) << "<font color = yellow>[M]'s head becomes ruptured!<br>"
										M.Blood -= rand(15,30)
										M.Bleed()
										M.Splat()
									if(M.Brain <= 1 && M.Humanoid)
										view(6,M) << "<font color = yellow>[M]'s Brain begins to leak through their nose! Slowly they drop down to the ground, dead.<br>"
										M.Brain = 0
										M.Death()
									return
	if(Result == "Mind Probe")
		if(usr.CanUseMagic == 0)
			usr << "<font color = red>You must wait a while!<br>"
			return
		var/list/menu2 = new()
		for(var/mob/M in view(6,usr))
			if(M != usr)
				menu2 += M
		menu2 += "Cancel"
		var/Result2 = input("Choose someone you want to Mind Probe.", "Choose", null) in menu2
		if(Result2 == "Cancel")
			return
		if(Result2)
			var/mob/M = Result2
			if(M in view(6,usr))
				usr.CanUseMagic = 0
				spawn(200)
					if(usr)
						usr.CanUseMagic = 1
				var/EnterMind = 0
				EnterMind = prob(100 - M.Intelligence)
				if(M.Fainted)
					EnterMind = 1
				if(M.Faction == "Undead")
					EnterMind = 0
				if(EnterMind == 0)
					usr << "<font color = red>[M] blocks you from entering their mind!<br>"
					M << "<font color = red>[usr] tried to enter your mind with their powers, but you resist!<br>"
					return
				if(EnterMind)
					usr << "<font color = red>You enter [M]'s Mind...<br>"
					M << "<font color = red>([usr.key])[usr] enters your mind!<br>"
					spawn(200)
						if(usr && M && M.Dead == 0 && usr.Dead == 0)
							if(M in range(6,usr))
								var/ProbeMind = 0
								ProbeMind = prob(100 - M.Intelligence)
								if(ProbeMind == 0)
									usr << "<font color = red>[M] blocks you from Probing their mind!<br>"
									M << "<font color = red>([usr.key])[usr] tried to Probe your mind with their powers, but you resist!<br>"
									return
								if(ProbeMind)
									usr << "<font color = red>You manage to Probe [M]'s Mind for information!<br>"
									M << "<font color = red>([usr.key])[usr] manages to Probe your mind for Information!<br>"
									if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
										usr.Intelligence += usr.IntelligenceMulti / 2
									var/LearnItems = prob(100 - M.Intelligence)
									if(LearnItems)
										usr << "<font color = teal>You learn what [M] is carrying....<p>"
										for(var/obj/Items/I in M)
											usr << "<font color = teal>[M] has [I] [I.suffix]<br>"
									var/LearnName = prob(100 - M.Intelligence)
									if(LearnName)
										usr << "<font color = teal>You learn [M.OrginalName][M]'s name.<br>"
									var/LearnGender = prob(100 - M.Intelligence)
									if(LearnGender)
										usr << "<font color = teal>You learn that [M] is a [M.Gender].<br>"
									var/LearnAge = prob(100 - M.Intelligence)
									if(LearnAge)
										usr << "<font color = teal>You learn that [M] is [M.Age] years old.<br>"
									var/LearnRace = prob(100 - M.Intelligence)
									if(LearnRace)
										usr << "<font color = teal>You learn that [M] is a [M.Race].<br>"
									return
	if(Result == "Observe")
		if(usr.client.eye != usr)
			usr.client.eye = usr
			return
		var/list/menu2 = new()
		var/Mobs = list()
		for(var/mob/M in world)
			menu2 += "[M.name]"
			if(M.OrginalName)
				menu2 += "[M.OrginalName]"
			Mobs += M
		menu2 += "Cancel"
		var/Result2 = input("Choose someone you want to Observe with your mind.", "Choose", null) in menu2
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
				if(src in usr.client.screen)
					usr.client:perspective = EYE_PERSPECTIVE
					usr.client:eye = Found
					usr << "<font color = teal>You use your mind powers to Observe [Found]!<br>"
					return
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
				if(src in usr.client.screen)
					var/X = Found.x
					var/Y = Found.y
					var/Z = Found.z
					usr << "<font color = teal>You use your mind powers to locate [Found], they are at [X],[Y],[Z]<br>"
					return
	if(Result == "Telepath")
		if(usr.CurrentLanguage == null)
			usr << "<font color =red>Select a Language to speak first!<br>"
			return
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
				if(src in usr.client.screen)
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

/obj/HUD/Buttons/GameInfo
	name = "GameInfo-(G)"
	icon_state = "help"
	Type = "Help"
	screen_loc = "15,1"
	layer = 10

/obj/HUD/Buttons/GameInfo/Click()
	var/list/menu = new()
	menu += "Ranks"
	menu += "Story"
	menu += "Help"
	menu += "Updates"
	menu += "Toggle OOC"
	menu += "Toggle Sparring"
	menu += "Initiate CountDown"
	menu += "Music Off"
	menu += "Change Language"
	menu += "Players Online"
	menu += "Report Bug"
	menu += "Report Player"
	menu += "Admin Help"
	menu += "Admin Rules"
	menu += "Rules"
	var/obj/O = new
	var/Loc = usr.loc
	var/Z = 0
	if(usr.z == 1)
		O.loc = locate(usr.x,usr.y,2)
		Z = 2
	if(usr.z == 3)
		O.loc = locate(usr.x,usr.y,1)
		Z = 1
	for(var/obj/Misc/Hole/H in range(0,O))
		menu += "Climb Up"
	del(O)
	menu += "Cancel"
	var/Result = input("Choose an option.", "Choose", null) in menu
	if (Result == "Cancel")
		return
	if(Result == "Climb Up")
		if(usr.loc == Loc)
			if(usr.Fainted)
				return
			if(usr.Stunned)
				return
			if(usr.Sleeping)
				return
			if(usr.CantDoTask)
				usr << "<font color = red>Must wait a little while before trying to climb out again!<br>"
				return
			var/Climbs = prob(10 + usr.Agility / 2)
			if(Climbs)
				view(6,usr) << "<font color = yellow>[usr] manages to climb up and out of the Hole above!<br>"
				usr.loc = locate(usr.x,usr.y,Z)
				oview(6,usr) << "<font color = yellow>[usr] manages to climb up and out of the Hole!<br>"
				usr.CantDoTask = 1
				spawn(200)
					if(usr)
						usr.CantDoTask = 0
				return
			else
				view(6,usr) << "<font color = yellow>[usr] tries to climb up and out of the Hole above but fails!<br>"
				usr.CantDoTask = 1
				spawn(200)
					if(usr)
						usr.CantDoTask = 0
				return
	if(Result == "Rules")
		usr<<browse(Rules,"window=Rules")
		return
	if(Result == "Initiate CountDown")
		view(8,usr) << "<font color = teal>([usr.OrginalName])[usr] is Waiting 1 Minute.<br>"
		usr.Log_player("([usr.key])[usr] Initiated a CountDown.")
		spawn(600)
			if(usr)
				view(8,usr) << "<font color = teal>([usr.OrginalName])[usr] has Waited 1 Minute.<br>"
				usr.Log_player("([usr.key])[usr] has waited for the CountDown.")
	if(Result == "Toggle Sparring")
		if(usr.SparMode == 0)
			usr.SparMode = 1
			usr << "<font color = teal><b>You will now only do 1/4 the damage you normally would against players! This does not work for Ranged Weapons.<br>"
			return
		if(usr.SparMode)
			usr.SparMode = 0
			usr << "<font color = teal><b>You will now do full damage to players!<br>"
			return
	if(Result == "Report Player")
		if(usr.Muted)
			usr << "You are Mute and can not do that!<br>"
			return
		var/T = input("Please input the Players Name and Key, what happened, and as much detail as possible. Do not use this for anything but reporting Players or you will be punished.")as null|message
		if(!T)
			return
		if(T)
			usr.Log_reports("([usr.key])[usr] - [usr.OrginalName] used Report Player - [T]<p>")
			usr << "<font color = teal>Player reported!<br>"
			for(var/mob/M in Players)
				if(M.Admin)
					M << "([usr.key])[usr] - [usr.OrginalName] used Report Player - [T]<p>"
			return
	if(Result == "Report Bug")
		if(usr.Muted)
			usr << "You are Mute and can not do that!<br>"
			return
		var/T = input("Please be very detailed with the Bugs you find. Do NOT use this to spam or get the Admins attention, or you will be punished. This is for Bugs only.")as null|message
		if(!T)
			return
		if(T)
			usr.Log_reports("([usr.key])[usr] - [usr.OrginalName] used Report Bug - [T]<p>")
			usr << "<font color = teal>Bug reported!<br>"
			return
	if(Result == "Admin Help")
		if(usr.Muted)
			usr << "You are Mute and can not do that!<br>"
			return
		var/T = input("Type a message to the Admins, please remember that if you Spam this Feature you will be punished.")as null|message
		if(!T)
			return
		var/FindsAdmin = 0
		for(var/mob/M in Players)
			if(M.Admin)
				FindsAdmin = 1
				M << "<b><font color = teal>([usr.key])[usr] - [usr.OrginalName]: [T]<br>"
		if(FindsAdmin)
			usr << "<font color = teal>Your message has been broadcast to the Admins!<br>"
			usr.Log_player("([usr.key])[usr] - [usr.OrginalName] used Admin Help - [T]")
			return
		else
			usr.Log_player("([usr.key])[usr] - [usr.OrginalName] used Admin Help but no Admins were online. - [T]")
			usr << "<font color = teal>There are currently no Admins online right now!<br>"
			return
	if(Result == "Music Off")
		usr << sound(null)
		usr << "Music is now off, relog if you want it back on again.<br>"
		return
	if(Result == "Updates")
		var/html_doc="<head><title>Updates</title></head><body bgcolor=#000000 text=#FFFF00><center><b><font color = teal><p><u>Version 0.596 Updates</u><br><p>Fixed a bug where several items could not be pulled or transfered into containers.<p>You can now interact with and apologize to NPC who are in your faction, this will stop them attacking you if you've done something bad, although you must pay a fee of 10 Gold.<p>Tweaked the Illithids TK damage, since its easy to max their Intelligence out and before you could do 26 damage per hit, lowered it to 16 at 80 Intelligence.<p>Fixed a bug where you could drown from not being in water after using stairs.<p><u>Version 0.595 Updates</u><br><p>Fixed a bug with repairing items.<p>NPC Guards will now recognise players who attack same faction NPC, so if you attack a Human Villager as a Human then run away, any guards who see you do this will always attack you on sight, unless you wear a cloak.<p>You can now only be Kicked if you walk near a body of one of your previous characters and you have Pickup or Pull modes activated.<p>Tweaked the starting stats for all races based on exact stat mods and fixed a small bug with Giants Strength mod and Snakeman having a Giants Strength mod.<p>Fixed a bug with the new death system where after making a new char and getting killed then remaking, you could add around +5 to your stats each time, resulting in new chars with more than 5, 10 and even 15+ stats.<p>Fixed a bug where NPC would target you even when your on another z level.<p><u>Version 0.594 Updates</u><br><p>30 second timer on the count down was changed to one minute.<p>Inquisitor now have half as much armour as before, in terms of defence and 10 less Agility than before.<p><b><font color = teal><p><u>Version 0.593 Updates</u><br><p>Anyone who attacks the Inquis Vault doors near an Inquis will get attacked.<p><u>Version 0.592 Updates</u><br><p>Inquis weapons do extra to undead now.<p>May have fixed a bug with being propelled back and slamming into a mob. The mob would get stuck and not be able to move.<p>Changed how potential on an item used for crafting works. Now it will take the Potential number and divide it by 40. Depending on your skill, it will remove 5 from 40 and so on each major skill level. So by about Epic, it becomes 20 and by Legendary, 18. The number left once devided will be added to the damage/defence of the item.<p>Fixed an issue with some mountains not having a second floor and being sky.<p><u>Version 0.591 Updates</u><br><p>Added Gold and Copper doors.<p>Doors were being damaged too easily, tweaked the code a litte.<p>Doors can now be knocked on.<p>The smithing rank now gives a +0.1 to Forging, Smelting and Mining skill mods.<p>Player logs will now display if a player destroys a door/chest/lock or creates a fire near wooden walls or floors.<p>Fixed a bug where stairs built under a hole were never turning the hole into stairs, allowing people to fill the hole in for a secret exit.<p>Version 0.59 Updates</u><br><p>Being stunned no longer allows you to attack.<p>Torches burn out slower than before.<p>Stairs can be built over Holes by Interacting with a Large Brick then the Hole. They can also be destroyed the same way as doors.<p>Player created turf now have a key attached to them so Admins can track those who abuse building.<p>If you fall down a Hole you can now use the ? Button to try and Climb Out, but its a low chance.<p>The chance to swim up was made easier. Instead of taking both the players weight and what they wear, it'll just take what they are carrying instead.<p>Players can now dual wield daggers and swords. Also, using the new hand buttons, you can switch between left and right hands for all weapons. Players could now use their left arm for things if their right is broken.<p>Fixed a bug where Keys would delete.<p>Ratlings now have claws.<p>Illithids Mind Blast was made easier to enter someones mind with slightly.<p>Fixed a bug with doors opening inside a players inventory.<p>Fixed a bug where Skulls from undead could not be used to craft with.<p>Ratling Kings/Queens get Plate armor now and Smiths can create it.<p>Holes can be dug now by using Interact on a shovel or being a Ratling. Double Clicking on turf begins the digging. They can also be filled or climbed down carefully by Interaction.<p>Mining skill goes up slower now because people were having 200+ easily.<p>Giant and Cyclops Kings/Queens/Smiths can now get Plate armor.<p>Ratling no longer start with bone armor but know how to make it instead.<p>Map now saves every year instead of every 6 months.<p>Copper long sword icon was fixed.<p>King rank now gives Defence 10 Plate/Chain, depending on race.<p>Stat gains were way too high, made them adjust better to a players stats, it gets harder to raise as they rise now.<p>Can now repair items with lower than 33 dura instead of lower than 1.<p>Fixed a bug where some Armor could not be repaired.<p>Lowered Kings/Queens weapons from 20 damage to 15.<p>If your unarmed skill is higher than 20, you wont take hand damage when fighting, unless hitting someone in plate/chain/<p>Ammount of Max Weight gained when strength rises was lowered a little.<p>Version 0.58 Updates</u><br><p>Can gain stats from swimming now.<p>Training dummies give a little more weapon skill than before each hit and are twice as endurant than before, but can be improved by repairing.<p>Wolfmen can no longer where shoulder armor. Felt they were already powerful enough.<p>Sligthly Bigger map.<p>Illithid Int Cap is now 80 instead of 100 and Alther Int cap is now 70 instead of 75. Illithid Agility cap is now 40 instead of 60.<p>Tweaked Illithid TK damage a little. Before armor would not give the full defence when being slammed against objects.<p>Version 0.573 Updates</u><br><p>Fixed a bug where Legendary items could not be crafted.<p>Fixed Human hair growth and overlay bugs.<p>Added yearly random events.<p>Illithid mind blast and mind probe are sligthly faster with a shorter cool down.<p>Iron gates can now be crafted.<p>All crafting skills and jobs take twice as less time to do and have had their mininum time lowered.<p>Fixed a bug where anything could be used to skin or butcher.<p>Silver weapons now do extra damage to Undead.<p>NPC Guard now respawn every month.<p>Fixed a bug where players could not learn Ancient.<p>Removed one group of Inquisitors because the maps too small for two groups and players keep getting killed constantly by them.<p>Bandits can roam free now.<p>Small stone bricks now give shards instead of the larger ones.<p>Added Inquisitor inside the Vault.<p>Added an Extra Door to the Inquisitor Vault.<p>Made the Inquisitor Vault Walls Impossible to break due to people Abusing.<p>Fixed a bug where if you had a smithing rank, you could examine weapons that you already knew how to create.<p>Version 0.57 Updates</u><br><p>Fixed a bug with Weapons where if you Examine an iron weapon, you would'nt get the other material types added to your craft list.<p>Added bone crafting.<p>Inventory will now close when a crafting menu opens.<p>Wolfmen can now Skin and Butcher with their claws.<p>Added Silver weapons.<p>Fixed a bug where NPC would smash you on the head and knock you out, even if you had a helmet on.<p>Intelligence is halved now when you get infected and turn into a zombie.<p>Infect chance for zombies is 1% again.<p>Illthid doors can now be attacked.<p>Illthids can no longer use TK + Observe on people.<p>Made NPC guard stronger.<p>Removed the stat boost for newly made players based on old players stats.<p>Fixed an overlay bug regarding Hair and Crowns.<p>Version 0.56 Updates</u><br><p>Wolfmen no longer get their Claws Damage Boost if holding a shield in combat.<p>You can now attack and destroy any walls or floors.<p>Doors are now half as durable as before by default.<p>Town walls can no longer be seen through.<p>Extended the Wolfmans field of vision while in the dark by one tile.<p>Added an Altherian Priest to help Altherian players.<p>Admin reward now takes the number entered by the Admin and Times it by the player race Multi in that stat Area. So for a Alther with an Agility Mod of 0.2, they would get Num X 0.2 added to their stats.<p>Very very sligthly lowered the chance to die depending on Blood loss.<p>Being stunned now sometimes lasts twice as long as before.<p>Zombies now have a 2% chance to infect instead of 1%.<p>NPC will now re-populate the world every two months instead of three.<p>Fixed an icon problem with Stahlites gloves.<p>Zombie NPC and players will no longer rise up from the dead if their brain is damaged badly.<p>Zombie NPC and Players now have a 10% chance per hit to die if they have no limbs.<p>Version 0.55 Updates</u><br><p>The count down on RP's was made seperate from the Emote button.<p>Leather hides can no longer get over 100 Craft Potential.<p>Trees now fall left and right. If they land on the tile your in they will take into account your Wood Cutting Skill, which helps you judge where it'll fall giving a lower chance of being hit.<p>Fixed a bug where if the server rebooted and there was a lit forge, that forge would stay lit forever.<p>Wolves can wear plate pauldrons again.<p>Wolves can no longer use Human style plate helmets. Instead they get their own kind, made by ranked smiths.<p>Wolves can use leather gloves again now, but not plate.<p>Made the new stat system for newly made late joiners divide the best stats by 5 instead of 3.<p>World will now only re-populate withy NPC's every Three months, instead of each month.<p>Wounds now heal twice as quickly as before.<p>Frogmen now have a 1% chance every 2.5 seconds to regenerate a lost limb.<p>Frogmen now get a bonus to swimming skill upon creation.<p>Frogmen no longer drown in water, ever.<p>Frogmen can move faster in water now.<p>Fixed a bug with leather hides not drying out correctly.<p>Fixed a bug where it was impossible to gain Max Weight through non-combat related skills.<p>You can now Examine people for information.<p>Made the System where you gain a portion of the strongest player onlines stats when making a new char differant. Instead it will take the stats of all players online, then add them together and devide by the players, getting the average stats, then dividing by four. It wont do this if theres less than 3 players.<p>Added swimming. You move faster in water depending on your swimming skill and strength. Wearing or Carrying anything increases your chances to sink as well as decreasing your chances to swim up from the water. There is also a Delay on how often you can swim up from underwater now. You can hold your breathe for two minutes, after which you die.<p>You can now wear leggings even if you've a leg missing.<p>Fixed a bug where people could attack a door and force the delay to non-exsistant, resulting in a destroyed door in 1/100 the normal time.<p>Wolfmen and Wolfwomen can no longer wear plate armour on their chest or hands, since this would distrupt their natural movements to the extent of damage to their bodies and realisticly, would cause possible death.<p>Fixed a bug with Stahlites icons.<p>Major Organs now Heal, but slower than other lesser ones.<p>Removed the Lich Npc, can only become un-dead through the Necro book or infection.<p>The game will now track the people with the Highest stats and save that number. When anyone makes a new char, they get that number divided by 3 added to their stats. This is to help lessen the impact upon players when they die after grinding for hours and get killed by a rabid chicken.<p>Moved the Inquisitor tower closer to the Human towns since it made no sense it was miles away. Also added a Vault inside.<p>Limbs and damaged Organs no longer magically heal after a year.<p>Fixed a bug where Transfering an Item would constantly shut your Inventory off each time.<p>You can now Forge Locks and Keys. When you Examine a door, Locks and Keys should be added to your Craft List.<p>You can Damage Doors and Chests using Combat Mode and repair them using certain tools.<p>You can now place Locks into Doors and Chests using Interact.<p>Iron doors can now be crafted.<p>Made it so when one of your legs health drops below 50 you move slower.<p>Made it so when you Target an NPC of your own Race, any other NPC who are friendly to the one you targetted attack you also.<p>There is now a chance to get extra Large and Small Bricks when smashing them with a hammer based on your Masonary Skills.<p>The max ammount of time to build something was lowered from 50 seconds to 30 seconds. This makes building walls and floors quicker but still based on skill as always.<p>There is now a chance based on your Wood Cutting skill to gain an extra Log when chopping a felled tree.<p>Pulling things now makes you slower.<p>Made Stat Gains from crafting slightly higher.<p>Wearing Armour now effects Dodge, Block and Parry when fighting, based on your Strength and Weight of Armour you wear.<p>Wearing Armour will now slow your attacking speed down.<p>There is now a chance based on your wood cutting skill to get extra Blocks or Blanks.<p>Code will now devide your MaxWeight by 1.1 and 1.2 when moving or attacking. If your current Weight is over that number you will Attack and Move slower.<p>There is now stat caps on Races. It starts at 50 for Humans and varies from Race to Race.<p>Lowered default stat gain chance from 33% to 22% per sucessful hit due to a change in stat codes.<p>When you Examine Metal objects, you can now craft them in all Materials, and not just the Material that the object you Examined was made from.<p>Added a Priest Rank.<p>All Humanoid NPC should now act correctly when they turn into a zombie.<p>All Humanoid NPC should now be able to be either infected, or revived, as Zombies.<p>Added a Female Stahlite icon, with hair.<p>Version 0.54 Updates</u><br><p>Added the ability to Mate, simply Click Interact, then click another player. Frogmen and Snakemen lay eggs. The child has a 50/50 chance of either being a player or NPC. If player, the next person to make a new character and pick the same race as the mother, is born to her. If NPC, the mother will give birth, and an NPC child will be created. Later on, if one of the parents die, they will become the child. Both NPC and Player get 1/8 stats from each parent.<p>Fixed the no Dura on Leather items bug.<p>Reverted the map back to the old Version, because its easier to find people and Role Play.<p>Bone armour now has a defence similar to Chain, instead of Leather.<p>Fixed a bug where getting knocked back, slamming into something, and dropping your weapon or shield made them bugged.<p>Fixed a bug that stopped Claws from growing back or healing.<p>Version 0.531 Updates</u><br><p>Was forced to remove the EXP Feature, due to it creating a massive bug.<p>Version 0.53 Updates</u><br><p>Added Bandit Raiders who travel in groups.<p>Fixed a bug where Ranged Combat Skill was not teaching correctly to a Learner when they Dodge,Bat away, Block, or get hit by an Arrow..<p>-May- have fixed a bug with Map Saving, will require alot of testing.<p>Fixed a bug where Large Brick Walls were not showing up in the Build Menu for Construction.<p>Players can now Push other Players who have targetted them, where as before, pushing someone who had targetted you did not work.<p>Players will now gain EXP when they Gain Weapon Skill or Stats, this EXP will then Save when they log out. When the Player dies and makes a new Character, the EXP from the previous Character carries over and adds a small Bonus to the New Characters Stats and Weapon Skills. This was added to lessen the impact of Perm Death. EXP will not go any higher than 100, when a New Character is made, they get EXP devided by 4.5 added to their stats, which is +22 for someone at 100 stats.<p>Version 0.52 Updates</u><br><p>Fixed a bug where Forging would break at 90 skill.<p>Fixed a bug where NPC were talking to players...<p>Mined out tiles that players have created will no longer spawn with hundreds of Rocks scattered about.<p>Hopefully, Plants, Rocks, and other un-wanted objects will now Delete when someone builds a wall/floor over them.<p>Gain chance on Shield Skill was changed to 50% from 33% per successful Block.<p>Base Fail chance on Crafting was lowered to 50% from 60%.<p>Purity of Ores renamed to Craft Potential.<p>Leather now has Craft Potential, like Ore, but depends on the players Skinning Skill.<p>Skin from creatures will now Dry out after a few minutes.<p>Anything with no Blood no longer leaves a blood trail when knocked back.<p>Version 0.51 Updates</u><br><p>Clicking Examine now displays your Cords, this is a Temp feature until I code in a more RP way of locating your position.<p>Added Gold Armour.<p>Months now go slightly faster.<p>Goblins now randomly spawn on the map in groups.<p>Gold and Silver Veins are alot more Rare now.<p>Re-added the dreaded Inquisitors.<p>Skill/Stat Caps now raise when your offline.<p>There is now a universal skill/stat cap that rises each Month.<p>Auto Heals now happen every Month instead of Year.<p>Made the Multi Cap increase by 3 every Month, instead of 10 every Year.<p>Made NPC re-spawn every Month instead of Year.<p>Version 0.50 Updates</u><br><p>May have fixed the Eternal Forge Lit bug.<p>Removed the Heir Rank and added Weapon Master and Diplomat Ranks.<p>All Tools now have a Weight, so they dont attack really fast.<p>Most NPC who dont have a home, such as a Cave or Tomb will now randomly spawn accross the Map every in game Year, this is to avoid them spawning on Player Made houses.<p>Fighting someone with higher Skill now has a 15% chance for you to gain in the Skill Area of the Weapon they use, as long as your Skill is not already higher than theirs. For instance, you wont gain anything from someone if your Skill in Swords is 30 and theirs 50, this is because it Halves their Skill, only allowing you to gain up to 25 of their Skill. This allows you to slowly learn from someone else and their combat Skills, opening up a Teacher-Learner Role Play and at the same time, wont allow you to constantly Gain Skill points from each other Infinitely.<p>Admin Logs will now display Edits, to help prevent abuse.<p>The Map will now save every Six(6) in game Months, instead of Twelve(12).<p>Months and Years now pass Three times as Slower.<p>Day and Night Cycles are now seperate from Months and Years.<p>Crafted items will now display when they were created, their quality, and other information when examined.<p>Fixed a bug with Lit Torches never burning out and giving the player 5 luminosity while not using one.<p>Skeletons die for good when their skulls are smashed during combat.<p>There is now a 15% chance that a sucessful attack to the skull will instantly KO someone. There is also a 33% chance that if your Brain is hurt, you also get instantly KO'ed<p>There is now a chance, based on your strength, that you will knock someone flying back.<p>Stat gain default chance was lowered to 33% from 50% per sucessful hit.<p>Fixed a bug where if your stats were too high, you would never gain, no matter what. Fixed it back to a 2% chance to gain if your stats are very high like it was before.<p>Meat, Limbs, Skulls and Bones now have a much shoter name than before.<p>Admin rewards now raise your stat Multi, where as before they would raise your stats past your multi and possibly bug them.<p>Skill caps will no longer update along with your age when you log in, this means if you dont play for a day, then log in, your skill caps wont go up. You will need to be present each in game year for them to rise now.<p>Fixed a bug where two players could cut down the same tree and get double resources from it.<p>Wolfmen NPC no longer attack Cloaked players.<p>Version 0.491 Updates</u><br><p>May have fixed a bug with Map Saving, but just in case, Maps are backed up every Three IC years.<p>Underground walls can now be dug into.<p>Fixed a bug where the contents of a container would never save.<p>Expanded the map a tiny bit.<p>Frogmen now have a Swamp area.<p>You can now Toggle a Spar mode, this will make you do 1/4 the damage to players. (Not NPC)<p>Fixed a bug related to Quivers, Arrows and Weight.<p>Added a Report Bug and Report Player Option on the Question mark button, if you abuse or spam these features, you will be punished.<p>Added an Admin Help option to the Question Mark button.<p>You can now open stat windows while fighting.<p>Common is now only given to Stahlites, Humans, Snakemen and Altherians.<p>You can now get to 97% instead of 95% with Languages.<p>Version 0.487 Updates</u><br><p>May have fixed the Language bug, needs testing with other players.<p>Due to popular demand, a Common language was added to all races.<p>Fixed a bug where 100 or higher crafting skill would bug up your item creation.<p>Crafts fail chance was lowered again. It was at 70%, it is now 60%, it will now stay at 60%.<p>Wolfmen, Giants and Cyclops Hunger will now go down twice as fast as before. Undead's Hunger will go down Three times as fast.<p>Made forging skill based on your Multi Cap, like with Melee skills and stats.<p>Made smelting skill based on your Multi Cap, like with Melee skills and stats.<p>Training dummies now have alot more dura, but will still need to be repaired. Repairing them makes them stronger than before, based on your Carpentry skills.<p>Butchery Skill Multi's were not active on players, you can now gain Butchery skill,<p>Added Snakemen guards to the Snakeman starting area.<p>Charcoal no longer has a Weight of 5, but 2 instead.<p>Tools placed on the map were given Weight, instead of before where they had 0 Weight and attacked really fast.<p>Added Shoulder Protection for Ratlings.<p>Shield users now have a chance to block arrows based on their Shield Skill and Agility.<p>Added guards to the Wolf Shaman's Cave.<p>Fixed a bug where the Lich NPC would never revive anyone.<p>Money now has no Weight.<p>Attack speed with Heavey weapons is now slower than before.<p>You can pull Arrows out by Interacting on them, depending where it was lodged depends on how much you will bleed.<p>Arrows have a chance to lodge into people when they hit, depending on their armour.<p>Arrows now have a chance to break on some Armours.<p>Worked on the Ranged combat a little, it will now work a lot more like Melee where the enemy can be stunned and faint.<p>Removed the Hell map to help reduce lag until it has a use.<p>Added more Masonary objects in for Masons.<p>Stat gains from Crafting/Building now work like those from fighting, they will increase at a chance based on your current stats.<p>You can now no longer sleep with a Weapon Equipped, Plate Armour, or a Shield Equipped.<p><u>Version 0.47 Updates</u><br><p>Made the language system work better and fixed a bug related to it.<p>You can now create some of the Stone items in game, including the Forge.<p>You can now forge an Anvil.<p>Added different Languages for different Races, the more you hear a Language, the better you become at speaking it, based off your Intelligence.<p>You can now place a lit torch in water to put it out.<p>Meat will now actually cook when you try to. Before it had a chance of the fire going out before finished.<p>You will now no longer have any chance of dieing if you get hungry or tired but you will still get ill.<p>Fixed a bug where you could not create training dummies or armour racks.<p>Stats and Combat skills now have a Cap on them, it starts at 11 and goes up by 10 every year, this means by the time your age 1 you can get your stats to 21, and by age 2, 31, ect ect.<p>Made it so you gain Agility and Endurance when doing crafting skills, where as before it was just strength, which messed up your overall gain chance later on if you decided to fight and become a warrior.<p>Slightly lowered the ammount of Endurance and Strength gained from being a Zombie.<p>Fixed a bug where blunt weapons were able to cut off a limb.<p>You will now only grow a beard if your older than 15.<p>Fixed a bug with the spiders not attacking.<p>Fixed a bug where if you logged out dead and then logged in again, and you were revived just as you go to click load or new game, you would be revived in your old body.<p>Players bodies will now not rot over time.<p>You can now light a forge using two stone shards.<p>Fixed a bug where certain NPC would never respawn.<p>Fixed a bug where targetting a player then killing them would still display the Target icon.<p>Made it so when you become a Zombie you loose your crafting memeory.<br>"
		usr<<browse(html_doc,"window=Updates")
	if(Result == "Admin Rules")
		var/html_doc="<head><title>Admin Rules</title></head><body bgcolor=#000000 text=#FFFF00><center>[AdminRules]"
		usr<<browse(html_doc,"window=Admin Rules")
		return
	if(Result == "Ranks")
		var/html_doc="<head><title>Ranks</title></head><body bgcolor=#000000 text=#FFFF00><center>[Ranks]"
		usr<<browse(html_doc,"window=Ranks")
		return
	if(Result == "Story")
		var/html_doc="<head><title>Story</title></head><body bgcolor=#000000 text=#FFFF00><center>[Story]"
		usr<<browse(html_doc,"window=Story")
		return
	if(Result == "Toggle OOC")
		usr.OOCToggle()
		return
	if(Result == "Players Online")
		usr.WhoProc()
		return
	if(Result == "Change Language")
		var/list/langmenu = new()
		for(var/obj/Misc/Languages/L in usr.LangKnow)
			langmenu += L
		langmenu += "Cancel"
		var/LangResult = input("What do you need Help on?", "Choose", null) in langmenu
		if(LangResult == "Cancel")
			return
		if(LangResult)
			var/obj/L = LangResult
			usr.CurrentLanguage = L
			usr << "<font color = green>You will now speak [L.name] - You are [L.SpeakPercent]% fluent in this language, and Write [L.WritePercent]% correctly in it.<br>"
	if(Result == "Help")
		var/Finish_Later_Using_HTML
		var/list/helpmenu = new()
		helpmenu += "Mining"
		helpmenu += "Tree Chopping"
		helpmenu += "Pulling & Pushing"
		helpmenu += "Camp Site Contruction"
		helpmenu += "Pick Up & Dropping Items"
		helpmenu += "Combat"
		helpmenu += "Wounds"
		helpmenu += "Sleeping"
		helpmenu += "Eating"
		helpmenu += "Cooking"
		helpmenu += "Butchery"
		helpmenu += "Skinning"
		helpmenu += "Smelting"
		helpmenu += "Stone Work"
		helpmenu += "Forging"
		helpmenu += "Carpentry"
		helpmenu += "Repair"
		helpmenu += "Cancel"
		var/HelpResult = input("What do you need Help on?", "Choose", null) in helpmenu
		if (HelpResult == "Cancel")
			return
		if(HelpResult == "Mining")
			var/Mining = {"
				<style>
				body{background:#000000}
				</style>
				<font color = teal><font size = 3><u><b>.:Mining:.</u></b> <p>
				In order to Mine you will first need a Pick Axe.
				Once you have one, check its Dura to make sure its not broken.
				Now, walk up to a Solid Stone Wall and Equip your Pick Axe.
				Now all you simply do is Click the Interact button on your screen, then Click a Solid Wall.
				Once finished, a Large Boulder will fall away from the wall.
				In order to cancel Mining, simply Click the Combat button on your screen.
				If you keep Mining a wall, it will eventually turn into an Empty Cave Tile.<br>
				"}
			usr<<browse(Mining,"window=Help")
			return
		if(HelpResult == "Tree Chopping")
			usr << "<font color = teal><font size = 3><u><b>.:Tree Chopping:.</u></b> <p> <font color = teal>In order to Chop a Tree you will first need a Hatchet. Once you have one, check its Dura to make sure its not broken. Now, walk up to a Tree and Equip your Hatchet. Now all you simply do is Click the Interact button on your screen, then Click a Tree. Be careful not to stand to the Right or Left of the Tree, because it will fall and kill you. When you have finished Chopping the Tree you can Chop the fallen Tree into a Log, but only if the Tree was large, small Trees only give Branches. To chop the fallen Tree into a Log, Click Interact, with a Hatchet equipped, then Click the Fallen Tree, this will turn it into a Log. If you want to cancel a job at any time, click the Combat button. Now that you have a Log, you can repeat the Interact process using a Saw, and turn the Log into Wooden Planks, used in house or furniture building.<br>"
			var/Chopping = {"
				<style>
				body{background:#000000}
				</style>
				<font color = teal><font size = 3><u><b>.:Tree Chopping:.</u></b> <p>
				"}
			usr<<browse(Chopping,"window=Help")
			return
		if(HelpResult == "Pulling & Pushing")
			usr << "<font color = teal><font size = 3><u><b>.:Pulling & Pushing:.</u></b> <p> <font color = teal>Alot of Items can be Pulled. Some because they are too big to be carried in your Inventory. In order to pull an object, Click the Pull Button, then Simply Click an object to Pull. You can Click that object again in order to stop Pulling it. While the Pull button is active you can also Push players around if they have no current Target.<br>"
			return
		if(HelpResult == "Camp Site Contruction")
			usr << "<font color = teal><font size = 3><u><b>.:Camp Site Contruction:.</u></b> <p> <font color = teal> Camp sites are useful for cooking food with, but dont stand in them, or you may catch on fire and die. In order to create a Camp Site, you will need Three branches placed down on the ground near you. Once you have Three on the ground, Click the Interact button, then click any of the Three Branches. Remember to have all the Branches in the same tile, and if you need to cancel a Job, Click the Combat Button. There are two ways of lighting a Camp Site on fire. The first is to Mine out a Large Boulder from a Solid Wall, then use a Hammer on the Boulder to get Stone Shards. With Two stone shards in your inventory, Interact with one, then click the other, and this will create sparks and light the camp site. The second way is to get a Torch, Equip it, then Interact with a Wall Torch to light your Torch, then Interact with the Camp Site. Please remember that if you start to spread fire on purpose or have no Role Play Reason to do so, you will be Ban. Admins know when a player start a fire.<br>"
			return
		if(HelpResult == "Pick Up & Dropping Items")
			usr << "<font color = teal><font size = 3><u><b>.:Pick Up & Dropping Items:.</u></b> <p> <font color = teal> In order to pick an Item up, Click the Pick Up button, then click an Item that is near you. Remember that if you carry too much you wont be able to pick anything up. To Drop an Items, Click the Pick Up Button again, then Click an Item in your Inventory, this will Drop the item. Remember that the Pick Up Button Both Picks up & Drops Items.<br>"
			return
		if(HelpResult == "Combat")
			usr << "<font color = teal><font size = 3><u><b>.:Combat:.</u></b> <p> <font color = teal>In order to attack an enemy you need to Click the Combat Mode Button, then simply Click someone. This button also Cancels any Jobs that you may be doing. Please remember that this is a Role Play Game, Admins keep records of players actions, and Non-Role Play kills will result in a ban. Now that you have a target you can Click the Combat button again to loose that target. Combat starts off slow when you first start out, but as your Agility rises, the speed of your attacks become more requent. Also note that some objects in game can be attacked and broken, like Wooden Doors for instance.<br>"
			return
		if(HelpResult == "Wounds")
			usr << "<font color = teal><font size = 3><u><b>.:Wounds:.</u></b> <p> <font color = teal>When you deal damage to an enemy you will hurt certain body parts. You can check the status of your Wounds in the Health Information Button. All Limbs will slowly heal over time, and some organs such as Eyes will Heal up to a point. Sleeping will increase the speed at which you Heal. The best way to Heal a Wound is to use a bandage.<br>"
			return
		if(HelpResult == "Sleeping")
			usr << "<font color = teal><font size = 3><u><b>.:Sleeping:.</u></b> <p> <font color = teal>Eventually your character will become sleepy. But do not worry, you dont need to sleep, but not sleeping will make you quite alot slower in Combat and has a chance to make you Ill. In order to sleep, find a bed and Interact with it. To wake up, Interact with it again.<br>"
			return
		if(HelpResult == "Eating")
			usr << "<font color = teal><font size = 3><u><b>.:Eating:.</u></b> <p> <font color = teal>Eventually your character will become hungry. But do not worry, you dont need to eat, but not eating will make you quite alot slower in Combat and has a chance to make you Ill. In order to eat, simply find some food, open your Inventory and click the Eat button, then click the Food. Some Foods will make you see strange, others will need to be cooked. You can Eat raw meats or limbs, but depending on your race, you may get Ill if the foods not cooked. Small foods, such as berries, will never fill you up past a certain Point, you will be required to find somthing a little bigger. Some races can eat an entire corpse, to do this, Click the Eat button in your inventory, then Click the Corpse.<br>"
			return
		if(HelpResult == "Cooking")
			usr << "<font color = teal><font size = 3><u><b>.:Cooking:.</u></b> <p> <font color = teal>Some races will need to have their food cooked if they want to eat safely. There is currently only one way to cook food. Light up a Camp Fire, then drop the food down next to it. Depending on your cooking skill, the food should cook slowly. If you leave the food near the fire too long you will be alerted that the food will burn.<br>"
			return
		if(HelpResult == "Butchery")
			usr << "<font color = teal><font size = 3><u><b>.:Butchery:.</u></b> <p> <font color = teal>In order to get meat you will need to Butcher a Corpse. In order to do this, Equip a Sword or Axe then Interact with one of them, then simply click a body. A Menu will display asking which part of the body you want to Butcher. Limbs can be removed, cooked and eaten. If you choose the Body option you will get Raw Meat Chuncks.<br>"
			return
		if(HelpResult == "Skinning")
			usr << "<font color = teal><font size = 3><u><b>.:Skinning:.</u></b> <p> <font color = teal>In order to Skin a Corpse you must first Equip a Dagger. After that simply Interact with a Corpse and you will begin to skin it.<br>"
			return
		if(HelpResult == "Smelting")
			usr << "<font color = teal><font size = 3><u><b>.:Smelting:.</u></b> <p> <font color = teal>In order to Smelt Ores that you Mine you will first need to locate a Forge. Next you will need at least one piece of Coal to fuel the forge. You will also need a Torch to light the Forge with. Once you have these things, Interact with the Coal, then Click the Forge. This will place the Coal into the Forge and supply it with Fuel. You can keep adding Coal before and after you light the Forge to make it last longer. Once the Coal is inside the Forge, Light the Torch on a Wall Torch, then Interact with the Forge with the Torch Equipped and Lit. This will light the Forge up. Now that the Forge is lit, Interact on some Ore, then click the Lit Forge. You will begin to create an Ingot out of the Ore. You will fail alot of times before you become really good at it though, so remember to stock up on lots of Coal and Ore.<br>"
			return
		if(HelpResult == "Stone Work")
			usr << "<font color = teal><font size = 3><u><b>.:Stone Work:.</u></b> <p> <font color = teal>Once you try Mining you will notice that you receive a Large Boulder. This Boulder can be turned into large and Small Bricks for use in Building and will also give you Stone Shards for lighting Camp Sites. With a hammer equipped, Interact with a Boulder, this will Hammer the Boulder into a Large brick. If you Interact with the Large Brick you created this will turn it into Three Smaller bricks.<br>"
			return
		if(HelpResult == "Forging")
			usr << "<font color = teal><font size = 3><u><b>.:Forging:.</u></b> <p> <font color = teal>In order to Forge a Metal Ingot into an Item you will first need to make sure you can create the Item you want. using the Examine button you can click Metal objects such as Weapons and Armour and learn how to create them by looking at them, this will add that item to memory for when you begin to Blacksmith. Once you have at least one item in your memory, find a Forge and Anvil. You will now need a Hammer. Once you have a Hammer Interact with an Ingot then click the Hammer. make sure that you are standing between a Lit Forge and an Anvil, or this will not work. A Forging menu should pop up once you Interact with the Ingot then click the hammer. In order to Forge an Item from the list, just simply Click the Item. You will fail alot of times before you become good at it. The higher your Forging skill, the better Quality the item will be. Note that only Iron and Copper can be crafted into items at the present time.<br>"
			return
		if(HelpResult == "Carpentry")
			usr << "<font color = teal><font size = 3><u><b>.:Carpentry:.</u></b> <p> <font color = teal>In order to create wooden items using Planks you will first need to know how to create them. Using the Examine button, Click Wooden items that are close by. This will add the items to your Memory and allow you to craft them any time you wish. To use Carpentry you must first have a Saw. Once you have a Saw, Equip it then Interact with a Wooden Plank, then click the Saw. This will open up the Carpentry menu. From here you simply click which wooden item you want to craft and you will begin doing so. If you create a Wooden Door, you can Place it by Interacting with it in your Inventory.<br>"
			return
		if(HelpResult == "Repair")
			usr << "<font color = teal><font size = 3><u><b>.:Repair:.</u></b> <p> <font color = teal>When your items break you will need to repair them. Use some Coal on a Forge, then use a Lit Torch on the Forge to light it, stand between the Forge and the Anvil, then Equip a Hammer. Now all you have to do is Interact with the broken item, then click the Hammer<br>"
			return

/obj/HUD/Buttons/SkillInfo
	name = "SkillInformation-(A)"
	icon_state = "skills off"
	Type = "Skill"
	screen_loc = "6,1"
	layer = 10

/obj/HUD/Buttons/SkillInfo/Click()
	if(usr.Job)
		usr << "<b>You cant open or close this while busy!<br>"
		return
	if(usr.InvenUp)
		usr << "<b>Close your inventory first!<br>"
		return
	if(src.icon_state == "skills off")
		usr.Function = "Skill"
		usr.ResetButtons()
		src.icon_state = "skills on"
		usr.CreateSkillDisplay()
		return
	if(src.icon_state == "skills on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "skills off"
		usr.Delete("SkillDisplay","SkillDisplay")
		return

/obj/HUD/Buttons/HealthInfo
	name = "HealthInformation-(H)"
	icon_state = "health off"
	Type = "Health"
	screen_loc = "7,1"
	layer = 10

/obj/HUD/Buttons/HealthInfo/Click()
	if(usr.Job)
		usr << "<b>You cant open or close this while busy!<br>"
		return
	if(usr.InvenUp)
		usr << "<b>Close your inventory first!<br>"
		return
	if(src.icon_state == "health off")
		usr.Function = "Health"
		usr.ResetButtons()
		src.icon_state = "health on"
		usr.CreateHealthDisplay()
		return
	if(src.icon_state == "health on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "health off"
		usr.Delete("HealthDisplay","HealthDisplay")
		return

/obj/HUD/Buttons/CharacterInfo
	name = "CharacterInformation-(C)"
	icon_state = "stats off"
	Type = "Stats"
	screen_loc = "8,1"
	layer = 10

/obj/HUD/Buttons/CharacterInfo/Click()
	if(usr.Job)
		usr << "<b>You cant open or close this while busy!<br>"
		return
	if(usr.InvenUp)
		usr << "<b>Close your inventory first!<br>"
		return
	if(src.icon_state == "stats off")
		usr.ResetButtons()
		usr.Function = "Stats"
		src.icon_state = "stats on"
		usr.CreateInfoDisplay()
		return
	if(src.icon_state == "stats on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "stats off"
		usr.Delete("InfoDisplay","InfoDisplay")
		return

/obj/HUD/Buttons/Inventory
	name = "Inventory-(I)"
	icon_state = "inv off"
	Type = "Inventory"
	screen_loc = "9,1"
	layer = 10

/obj/HUD/Buttons/Inventory/Click()
	if(usr.Job)
		usr << "<b>You cant open or close this while busy!<br>"
		return
	if(src.icon_state == "inv off")
		usr.ResetButtons()
		usr.Function = "Inventory"
		src.icon_state = "inv on"
		usr.InvenUp = 1
		usr.CreateInventory()
		return
	if(src.icon_state == "inv on")
		if(usr.Container)
			var/obj/C = usr.Container
			if(C.ClosedState)
				C.icon_state = C.ClosedState
		if(usr.Function != "Eat")
			if(usr.Function != "Interact")
				usr.ResetButtons()
				usr.Function = null
		usr.InvenUp = 0
		src.icon_state = "inv off"
		usr.DeleteInventoryMenu()
		return

/obj/HUD/Buttons/CombatMode
	name = "CombatMode-(D)"
	icon_state = "combat off"
	Type = "Combat"
	screen_loc = "11,1"
	layer = 10

/obj/HUD/Buttons/CombatMode/Click()
	if(usr.Dead)
		return
	if(usr.Job)
		usr.Job = null
		usr << "<font color=green>You stop doing a task and must wait to do another!<br>"
		usr.CantDoTask = 1
		spawn(301)
			if(usr)
				usr.CantDoTask = 0
		usr.MovementCheck()
	if(src.icon_state == "combat off")
		usr.ResetButtons()
		usr.Function = "Combat"
		src.icon_state = "combat on"
		usr << "<b>Combat Mode On, Click an enemy once to start attacking<br>"
		return
	if(src.icon_state == "combat on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "combat off"
		usr << "<b>Combat Mode Off<br>"
		if(usr.Target)
			usr << "Target lost...<br>"
			var/mob/m = usr.Target
			usr.client.images -= m.TargetIcon
			usr.Target = null
		return

/obj/HUD/Buttons/RolePlay
	name = "RolePlay-(R)"
	icon_state = "Emote"
	Type = "RP"
	screen_loc = "3,1"
	layer = 10

/obj/HUD/Buttons/RolePlay/Click()
	var/T = input("Role Play - In Character")as null|message
	if(!T)
		return
	if(usr.OrginalName == null)
		hearers(usr) << "<font color =yellow>[usr] [T]<br>"
	else
		hearers(usr) << "<font color=yellow>([usr.OrginalName])[usr] [T]<br>"
	var/Cant = 0
	if(findtext(T,"(",1,0))
		Cant = 1
	if(findtext(T,")",1,0))
		Cant = 1
	if(findtext(T,"{",1,0))
		Cant = 1
	if(findtext(T,"}",1,0))
		Cant = 1
	if(Cant == 0)
		var/TextLength = lentext(T)
		while(TextLength)
			TextLength -= 1
			usr.RPpoints += 0.001
	if(usr)
		usr.Log_player("{Year-[Year], Month-[Month], RP-[usr.RPpoints]}([usr.key])[usr] RP - [T]")

/obj/HUD/Buttons/OOC
	name = "OutOfCharacter-(O)"
	icon_state = "OOC"
	Type = "OOC"
	screen_loc = "1,1"
	layer = 10

/obj/HUD/Buttons/OOC/Click()
	if(Mute)
		usr << "<font color = red>OOC Disabled!<br>"
		return
	var/T = input("OOC - Out of Character")as null|text
	if(!T)
		return
	if(Mute)
		usr << "<font color = red>OOC Disabled!<br>"
		return
	if(usr.Muted)
		usr << "<font color =red>You cant talk, you're Muted!<br>"
		return
	if(usr)
		for(var/mob/M in Players)
			if(M.client && M.OOC)
				M << "<font color =green>-OOC- [usr.key]: [Safe_Guard(T)]<br>"
		usr.Log_player("([usr.key])[usr] OOC - [T]")
	return

/obj/HUD/Buttons/Say
	name = "InCharacterChat-(S)"
	icon_state = "say"
	Type = "Say"
	screen_loc = "2,1"
	layer = 10

/obj/HUD/Buttons/Say/Click()
	if(usr.Fainted)
		usr << "<font color =red>You cant speak while un-conscious!<br>"
		return
	if(usr.CurrentLanguage == null)
		usr << "<font color =red>Select a Language to speak first!<br>"
		return
	var/T = input("Say - In Character")as null|text
	if(!T)
		return
	if(usr && usr.invisibility && usr.Admin == 0)
		view(1,usr) << "<font color = teal>[usr] whispers:Wooooo....."
		return
	var/obj/SL = usr.CurrentLanguage
	for(var/mob/M in hearers(6,usr))
		var/NewText = null
		var/Text = null
		var/TextLength = lentext(T)
		var/Understands = 0
		if(usr.CurrentLanguage)
			for(var/obj/Misc/Languages/HL in M.LangKnow)
				if(SL.name == HL.name)
					Understands = HL.SpeakPercent
					if(HL.SpeakPercent <= 100)
						var/NotSpeaker = 1
						if(HL in usr.LangKnow)
							NotSpeaker = 0
						if(NotSpeaker)
							if(SL.SpeakPercent >= HL.SpeakPercent && HL.SpeakPercent <= 97)
								HL.SpeakPercent += M.Intelligence / 20
								if(M.Intelligence <= M.IntCap && M.Intelligence <= WorldIntCap && M.Intelligence <= M.IntelligenceMax)
									M.Intelligence += M.IntelligenceMulti / 10
		if(Understands == 0)
			M.LearnRaceLanguages("[usr.CurrentLanguage]")
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
		if(usr.OrginalName == null)
			M << "<font color=teal>[usr] says in [SL.name]: [Safe_Guard(NewText)]<br>"
		else
			M << "<font color=teal>([usr.OrginalName])[usr] says in [SL.name]: [Safe_Guard(NewText)]<br>"
		var/Cant = 0
		if(findtext(T,"(",1,0))
			Cant = 1
		if(findtext(T,")",1,0))
			Cant = 1
		if(findtext(T,"{",1,0))
			Cant = 1
		if(findtext(T,"}",1,0))
			Cant = 1
		if(Cant == 0)
			var/SayLength = lentext(T)
			while(SayLength)
				SayLength -= 1
				usr.RPpoints += 0.0005
	usr.Log_player("([usr.key])[usr] IC - [T]")

/obj/HUD/Buttons/LeftHand
	name = "LeftHand"
	icon_state = "left hand"
	Type = "LeftHand"
	screen_loc = "13,2"
	layer = 10

/obj/HUD/Buttons/LeftHand/Click()
	if(usr.LeftArm)
		if(usr.CurrentHand == "Right")
			usr.CurrentHand = "Left"
			src.icon_state = "left hand on"
			for(var/obj/HUD/Buttons/RightHand/R in usr.client.screen)
				R.icon_state = "right hand"
			return
	else
		usr << "<font color = red>Your Left Arm is gone!<br>"
		return

/obj/HUD/Buttons/RightHand
	name = "RightHand"
	icon_state = "right hand"
	Type = "RightHand"
	screen_loc = "14,2"
	layer = 10

/obj/HUD/Buttons/RightHand/Click()
	if(usr.RightArm)
		if(usr.CurrentHand == "Left")
			usr.CurrentHand = "Right"
			src.icon_state = "right hand on"
			for(var/obj/HUD/Buttons/LeftHand/L in usr.client.screen)
				L.icon_state = "left hand"
			return
	else
		usr << "<font color = red>Your Right Arm is gone!<br>"
		return

/obj/HUD/Buttons/Examine
	name = "Examine-(E)"
	icon_state = "examine off"
	Type = "Examine"
	screen_loc = "12,1"
	layer = 10

/obj/HUD/Buttons/Examine/Click()
	if(usr.Job)
		usr << "<b>You cant use this while busy!<br>"
		return
	if(usr.CanSee == 0)
		usr << "<font color=red>You are blind and can not see objects!<br>"
		return
	if(src.icon_state == "examine off")
		usr.ResetButtons()
		usr.Function = "Examine"
		src.icon_state = "examine on"
		usr << "<b>Examine Mode On - (Location - [usr.x],[usr.y],[usr.z]. Temp feature.)<br>"
		usr.client.mouse_pointer_icon = 'IntCursor.dmi'
		return
	if(src.icon_state == "examine on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "examine off"
		usr << "<b>Examine Mode Off - (Location - [usr.x],[usr.y],[usr.z]. Temp feature.)<br>"
		usr.client.mouse_pointer_icon = 'Cursor.dmi'
		return

/obj/HUD/Buttons/PickUp
	name = "PickUp-(U)"
	icon_state = "pick off"
	Type = "PickUp"
	screen_loc = "14,1"
	layer = 10

/obj/HUD/Buttons/PickUp/Click()
	if(usr.Dead)
		usr << "<b>You cant do that while dead!<br>"
		return
	if(usr.Job)
		usr << "<b>You cant open or close this while busy!<br>"
		return
	if(usr.LeftArm == 0)
		if(usr.RightArm == 0)
			usr << "<font color=red>You have no hands to pick anything up with!<br>"
			return
	if(usr.CanSee == 0)
		usr << "<font color=red>You are blind and can not see objects!<br>"
		return
	if(src.icon_state == "pick off")
		usr.ResetButtons()
		usr.Function = "PickUp"
		src.icon_state = "pick on"
		usr << "<b>Pick Up Mode On<br>"
		usr.client.mouse_pointer_icon = 'IntCursor.dmi'
		return
	if(src.icon_state == "pick on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "pick off"
		usr << "<b>Pick Up Mode Off<br>"
		usr.client.mouse_pointer_icon = 'Cursor.dmi'
		return

/obj/HUD/Buttons/Pull
	name = "Pull-(P)"
	icon_state = "pull off"
	Type = "Pull"
	screen_loc = "10,1"
	layer = 10

/obj/HUD/Buttons/Pull/Click()
	if(usr.Job)
		usr << "<b>You cant use this while busy!<br>"
		return
	if(usr.CanSee == 0)
		usr << "<font color=red>You are blind and can not see objects!<br>"
		return
	if(src.icon_state == "pull off")
		usr.ResetButtons()
		usr.Function = "Pull"
		src.icon_state = "pull on"
		usr << "<b>Pull Mode On<br>"
		usr.client.mouse_pointer_icon = 'IntCursor.dmi'
		return
	if(src.icon_state == "pull on")
		usr.ResetButtons()
		usr.Function = null
		if(usr.Pull)
			var/obj/O = usr.Pull
			usr << "<b>You stop pulling [O]!<br>"
			O.Pull = null
		src.icon_state = "pull off"
		usr << "<b>Pull Mode Off<br>"
		usr.client.mouse_pointer_icon = 'Cursor.dmi'
		return

/obj/HUD/Buttons/Build
	name = "Build-(B)"
	icon_state = "build off"
	Type = "Build"
	screen_loc = "5,1"
	layer = 10

/obj/HUD/Buttons/Build/Click()
	if(usr.Job)
		usr << "<b>You cant open or close this while busy!<br>"
		return
	if(usr.CanSee == 0)
		usr << "<font color=red>You are blind and can not see objects!<br>"
		return
	if(src.icon_state == "build off")
		usr.ResetButtons()
		usr.Function = "Build"
		src.icon_state = "build on"
		usr.CreateBuildMenu()
		usr << "<b>Click an icon to build, make sure you have the right materials!<br>"
		return
	if(src.icon_state == "build on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "build off"
		usr << "<b>Build Mode Off<br>"
		usr.DeleteInventoryMenu()
		return

/obj/HUD/Buttons/Interact
	name = "Interact-(Z)"
	icon_state = "int off"
	Type = "Interact"
	screen_loc = "13,1"
	layer = 10

/obj/HUD/Buttons/Interact/Click()
	if(usr.Job)
		usr << "<b>You cant use this while busy!<br>"
		return
	if(usr.Dead)
		usr << "<b>You cant do that while dead!<br>"
		return
	if(usr.CanSee == 0)
		usr << "<font color=red>You are blind and can not see objects!<br>"
		return
	if(src.icon_state == "int off")
		usr.ResetButtons()
		usr.Function = "Interact"
		src.icon_state = "int on"
		usr << "<b>Interact Mode On<br>"
		usr.client.mouse_pointer_icon = 'IntCursor.dmi'
		return
	if(src.icon_state == "int on")
		usr.ResetButtons()
		usr.Function = null
		src.icon_state = "int off"
		if(usr.Ref)
			usr << "<font color = teal>Interaction with [usr.Ref] lost.<br>"
		usr.Ref = null
		usr << "<b>Interact Mode Off<br>"
		usr.client.mouse_pointer_icon = 'Cursor.dmi'
		return
