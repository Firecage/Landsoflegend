/mob/proc/AnimalAI()
	var/Delay = rand(15,30)
	if(src.Fainted == 0 && src.Stunned == 0)
		if(src.InWater)
			Delay += 10
		if(src.CancelDefaultProc)
			return
		if(src.Dead)
			return
		else
			if(src.Target)
				if(ismob(src.Target))
					var/mob/M = src.Target
					if(M.z != src.z)
						var/Dis = get_dist(src,M)
						if(Dis >= 2)
							src.Target = null
						if(M.Dead)
							src.Target = null
					else
						src.Target = null
			if(src.Target == null)
				step_rand(src)
	spawn(Delay) AnimalAI()

/mob/proc/GuardAI()
	var/Delay = rand(20,40)
	if(src.InWater)
		Delay += 10
	if(src.CancelDefaultProc)
		return
	if(src.Dead)
		return
	if(src.Owner)
		return
	if(src.loc == src.GuardLoc)
		src.dir = src.GuardDir
	if(src.Fainted == 0 && src.Stunned == 0)
		if(src.Target == null)
			for(var/mob/M in oview(6,src))
				if(M.Dead == 0)
					if(M.Faction in src.HateList)
						src.Target = M
					if(M.name in src.HateList)
						src.Target = M
					if(M.Target)
						if(ismob(M.Target))
							var/mob/T = M.Target
							if(T.Faction == src.Faction && T.client == null)
								src.Target = M
		if(src.Target)
			Delay = 8
			step_towards(src,src.Target)
			if(ismob(src.Target))
				var/mob/M = src.Target
				var/Dis = get_dist(src,M)
				if(Dis >= 6)
					src.Target = null
				if(M.Dead)
					src.Target = null
				if(M.z != src.z)
					src.Target = null
		if(src.Target == null)
			step_towards(src,src.GuardLoc)
	spawn(Delay) GuardAI()

/mob/proc/FollowAI()
	if(src.CancelDefaultProc)
		return
	if(src.Dead)
		return
	if(src.Fainted == 0)
		if(src.Stunned == 0)
			if(src.Owner)
				var/mob/M = src.Owner
				if(M.Faction != src.Faction)
					return
				if(M.Dead)
					src.Owner = null
					src.NormalAI()
					return
				if(M.Target)
					src.Target = M.Target
					step_towards(src,src.Target)
				if(M.Target == null)
					src.Target = null
					step_towards(src,M)
			else
				src.NormalAI()
				return
	spawn(9) FollowAI()

/mob/proc/InquisitiveGuardAI(var/mob/Suspect)
	var/Delay = rand(20,40)
	if(src.InWater)
		Delay += 10
	if(src.CancelDefaultProc)
		return
	if(src.Dead)
		return
	if(src.Owner)
		return
	if(src.loc == src.GuardLoc)
		src.dir = src.GuardDir
	if(src.Fainted == 0 && src.Stunned == 0)
		if(isturf(src.Target))
			if(src.Target in range(1,src))
				if(Suspect in range(1,src))
					if(Suspect.WBack)
						var/obj/O = Suspect.WBack
						O.layer = O.ItemLayer
						Suspect.overlays-=image(O.icon,O.icon_state,O.ItemLayer)
						Suspect.WBack = null
						O.suffix = "Carried"
						O.overlays-=image(/obj/HUD/E/)
						O.overlays+=image(/obj/HUD/C/)
						O.icon_state = O.CarryState
						O.layer = 20
						Suspect.DeleteInventoryMenu()
						if(Suspect.OrginalName)
							Suspect.name = Suspect.OrginalName
							Suspect.OrginalName = null
						if(Suspect.StoredFaction)
							Suspect.Faction = Suspect.StoredFaction
							Suspect.StoredFaction = null
						view(6,src) << "<font color = yellow>[src] pulls off [Suspect]'s Cloak.<br>"
					src.Target = null
					Suspect = null
				else
					var/DIST = get_dist(src,Suspect)
					if(DIST <= 3)
						src.Target = Suspect.loc
					else if(Suspect)
						if(Suspect.WBack)
							Suspect << "<font color = teal>[src] points at you, and shouts for everyone to attack. You dident stop to let [src] remove your cloak."
							for(var/mob/M in oview(8,src))
								if(M.Target == null && M.Faction == src.Faction)
									M.Target = Suspect
							src.Target = Suspect
							Suspect = null
		if(src.Target == null)
			for(var/mob/M in oview(6,src))
				if(M.Dead == 0)
					if(M.Faction == "None" && Suspect == null)
						Suspect = M
						src.Target = M.loc
						M << "<font color = teal>[src] is coming to remove your cloak!<br>"
					if(M.Faction in src.HateList)
						src.Target = M
					if(M.name in src.HateList)
						src.Target = M
					if(M.Target)
						if(ismob(M.Target))
							var/mob/T = M.Target
							if(T.Faction == src.Faction && T.client == null)
								src.Target = M
		if(src.Target)
			Delay = 8
			step_towards(src,src.Target)
			if(ismob(src.Target))
				var/mob/M = src.Target
				var/Dis = get_dist(src,M)
				if(Dis >= 6)
					src.Target = null
				if(M.Dead)
					src.Target = null
				if(M.z != src.z)
					src.Target = null
		if(src.Target == null)
			step_towards(src,src.GuardLoc)
	spawn(Delay) InquisitiveGuardAI(Suspect)

/mob/proc/InquisitiveAI(var/mob/Suspect)
	var/Delay = rand(15,30)
	if(src.InWater)
		Delay += 10
	if(src.CancelDefaultProc)
		return
	if(src.Dead)
		return
	if(src.Fainted == 0 && src.Stunned == 0)
		src.LastLoc = src.loc
		if(isturf(src.Target))
			if(src.Target in range(1,src))
				if(Suspect in range(1,src))
					if(Suspect.WBack)
						view(6,src) << "<font color = yellow>[src] pulls off [Suspect]'s Cloak.<br>"
						var/obj/O = Suspect.WBack
						O.layer = O.ItemLayer
						Suspect.overlays-=image(O.icon,O.icon_state,O.ItemLayer)
						Suspect.WBack = null
						O.suffix = "Carried"
						O.overlays-=image(/obj/HUD/E/)
						O.overlays+=image(/obj/HUD/C/)
						O.icon_state = O.CarryState
						O.layer = 20
						Suspect.DeleteInventoryMenu()
						if(Suspect.OrginalName)
							Suspect.name = Suspect.OrginalName
							Suspect.OrginalName = null
						if(Suspect.StoredFaction)
							Suspect.Faction = Suspect.StoredFaction
							Suspect.StoredFaction = null
					src.Target = null
					Suspect = null
				else
					var/DIST = get_dist(src,Suspect)
					if(DIST <= 3)
						src.Target = Suspect.loc
					else if(Suspect)
						if(Suspect.WBack)
							Suspect << "<font color = teal>[src] points at you, and shouts for everyone to attack. You dident stop to let [src] remove your cloak."
							for(var/mob/M in oview(8,src))
								if(M.Target == null && M.Faction == src.Faction)
									M.Target = Suspect
							src.Target = Suspect
							Suspect = null
		if(src.Target == null)
			for(var/mob/M in oview(6,src))
				if(M.Dead == 0)
					if(M.Faction == "None" && Suspect == null)
						Suspect = M
						src.Target = M.loc
						M << "<font color = teal>[src] is coming to remove your cloak!<br>"
					if(M.Faction in src.HateList)
						src.Target = M
					if(M.Target)
						if(ismob(M.Target))
							var/mob/T = M.Target
							if(T.Faction == src.Faction && T.client == null)
								src.Target = M
		if(src.Target)
			Delay = 8
			step_towards(src,src.Target)
			if(ismob(src.Target))
				var/mob/M = src.Target
				var/Dis = get_dist(src,M)
				if(Dis >= 6)
					src.Target = null
				if(M.Dead)
					src.Target = null
				if(M.z != src.z)
					src.Target = null
		if(src.Target == null)
			step_rand(src)
	spawn(Delay) InquisitiveAI(Suspect)

/mob/proc/NormalAI()
	if(src.client)
		return
	var/Delay = rand(15,30)
	if(src.InWater)
		Delay += 10
	if(src.CancelDefaultProc)
		return
	if(src.Dead)
		return
	if(src.Fainted == 0 && src.Stunned == 0)
		src.LastLoc = src.loc
		if(src.Target == null)
			for(var/mob/M in oview(6,src))
				if(M.Dead == 0)
					if(M.Faction in src.HateList)
						src.Target = M
					if(M.Target)
						if(ismob(M.Target))
							var/mob/T = M.Target
							if(T.Faction == src.Faction && T.client == null)
								src.Target = M
		if(src.Target == null)
			step_rand(src)
		if(src.Target)
			Delay = 9
			step_towards(src,src.Target)
			if(ismob(src.Target))
				var/mob/M = src.Target
				var/Dis = get_dist(src,M)
				if(Dis >= 6)
					src.Target = null
				if(M.Dead)
					src.Target = null
				if(M.z != src.z)
					src.Target = null
	spawn(Delay) NormalAI()

/mob/proc/FleshAI()
	src.LastLoc = src.loc
	if(src.Type >= 6)
		view(src) << "<font color =purple>[src] begins to bubble and swell, blood guts and pus spew everywhere as they expand to a massive size<br>"
		var/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast/C = new
		C.Owner = src.Owner
		C.Move(src.loc)
		C.name = src.name
		var/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_BR/F1 = new
		var/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_TL/F2 = new
		var/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_TR/F3 = new
		C.overlays += F1
		C.overlays += F2
		C.overlays += F3
		C.Type = -999999999
		del(src)
		return
	if(src.Target == null)
		for(var/obj/Items/Body/B in oview(src.Vision,src))
			if(B.Owner == null && B.Race != src.Race)
				src.Target = B
	if(src.Target == null)
		for(var/mob/M in oview(src.Vision,src))
			if(M.Dead == 0)
				if(M.Faction != src.Faction)
					if(M.Faction in src.HateList)
						src.Target = M
	if(src.Target)
		if(src.Fainted == 0)
			if(Stunned == 0)
				step_towards(src,src.Target)
				if(ismob(src.Target))
					var/mob/M = src.Target
					var/Dis = get_dist(src,M)
					if(Dis >= 5)
						src.Target = null
					if(M.Dead)
						src.Target = null
				else
					if(src.Target in range(0,src))
						if(isobj(src.Target))
							view(src) << "<font color = red>[src] grasps hold of [src.Target] and begins to absorb it into their disgusting mass of bodies...<br>"
							src.Type += 1
							del(src.Target)
	if(src.Target == null)
		step_rand(src)
	spawn(9) FleshAI()

/mob/proc/ChaosAI()
	if(src.Target == null)
		for(var/obj/Items/Body/B in oview(src.Vision,src))
			if(B.Owner == null && B.Race != src.Race)
				src.Target = B
	if(src.Target == null)
		for(var/mob/M in oview(src.Vision,src))
			if(M.Dead == 0)
				if(M.Faction != src.Faction)
					if(M.Faction in src.HateList)
						src.Target = M
	if(src.Target)
		if(src.Fainted == 0)
			if(Stunned == 0)
				step_towards(src,src.Target)
				if(ismob(src.Target))
					var/mob/M = src.Target
					var/Dis = get_dist(src,M)
					if(Dis >= 5)
						src.Target = null
					if(M.Dead)
						src.Target = null
				else
					if(src.Target in range(0,src))
						if(isobj(src.Target))
							view(src) << "<font color = red>[src] decends upon [src.Target] and begins to smother it, suddenly the body begins to twist and mutate into a digusting bubbling mass of blood and guts!<br>"
							var/mob/NPC/Evil/Chaos/Flesh_Beast/B = new
							B.Move(src.loc)
							del(src.Target)
	if(src.Target == null)
		step_rand(src)
	spawn(9) ChaosAI()

/mob/proc/PlaceWantedPoster(var/mob/Wanted)
	if(src.Race == "Human")
		var/Town = 1
		if(Town == 1)
			for(var/turf/T in block(locate(2,67,1),locate(55,111,1)))
				if(T.icon_state == "bulky brick wall")
					for(var/turf/Floors/F in range(1,T))
						var/CanPlace = 1
						if(F.y == T.y - 1 && F.density == 0)
							for(var/obj/O in T.loc)
								CanPlace = 0
							if(CanPlace)
								var/Place = prob(1)
								if(Place)
									var/obj/Items/Books_Scrolls/WantedPoster/P = new
									P.Move(locate(F.x,F.y,F.z))
									world << "Poster at [P.x],[P.y]"
									return

/mob/proc/CallForHelp(var/mob/T)
	if(src.Faction == "Undead")
		return
	if(src.client)
		return
	if(src.Humanoid && src.Fainted == 0)
		view(src) << "<font color = yellow>[src] calls out for help!<br>"
		for(var/mob/NPC/N in range(8,src))
			var/Helps = 1
			if(N.Faction in src.HateList)
				Helps = 0
			if(Helps)
				if(N.Target == null)
					N.Target = T

/mob/proc/SpiderAI()
	var/N = prob(5)
	if(N)
		view(5) << 'Hiss.wav'
	if(src.Type >= 4)
		var/Lay = prob(2)
		if(Lay)
			view(src) << "<font color =purple>[src] fangs twitch and create a loud pitch noise as [src] lays low to the ground. Suddenly [src] begins to lay a massive egg that flops to the floor!<br>"
			src.Type -= 4
			var/mob/NPC/Evil/Misc/Spider_Egg/C = new
			C.Owner = src.Owner
			C.Move(src.loc)
	if(src.Target == null)
		for(var/obj/Items/Body/B in oview(src.Vision,src))
			if(B.Race != src.Race && B.Owner == null)
				src.Target = B
	if(src.Target == null)
		for(var/mob/M in oview(src.Vision,src))
			if(M.Dead == 0)
				if(M.Faction != src.Faction)
					if(M.Faction in src.HateList)
						src.Target = M
	if(src.Target)
		if(src.Fainted == 0)
			if(Stunned == 0)
				step_towards(src,src.Target)
				if(ismob(src.Target))
					var/mob/M = src.Target
					var/Dis = get_dist(src,M)
					if(Dis >= 5)
						src.Target = null
					if(M.Dead)
						src.Target = null
				else
					if(src.Target in range(0,src))
						if(isobj(src.Target))
							view(src) << "<font color = red>[src] grabs hold of [src.Target] and tears it to shreds, they then begin to eat the remains...<br>"
							src.Type += 1
							del(src.Target)
	if(src.Target == null)
		step_rand(src)
	spawn(9) SpiderAI()

/mob/proc/DevourerAI()
	if(src.Type >= 2)
		view(src) << "<font color =purple>[src] gurgles and splutters violently then spits out a large sack of goo, the sack lands on the ground and begins to harden!<br>"
		src.Type -= 2
		var/mob/NPC/Evil/Undead/Corpse_Devourer_Cacoon/C = new
		C.Owner = src.Owner
		C.Move(src.loc)
	if(src.Target == null)
		for(var/obj/Items/Body/B in oview(src.Vision,src))
			if(B.Owner == null && B.Race != src.Race)
				src.Target = B
	if(src.Target == null)
		for(var/mob/M in oview(src.Vision,src))
			if(M.Dead == 0)
				if(M.Faction != src.Faction)
					if(M.Faction in src.HateList)
						src.Target = M
	if(src.Target)
		if(src.Fainted == 0)
			if(Stunned == 0)
				step_towards(src,src.Target)
				if(ismob(src.Target))
					var/mob/M = src.Target
					var/Dis = get_dist(src,M)
					if(Dis >= 5)
						src.Target = null
					if(M.Dead)
						src.Target = null
				else
					if(src.Target in range(0,src))
						if(isobj(src.Target))
							view(src) << "<font color = red>[src] grabs hold of [src.Target] and tears it to shreds, they then begin to eat the remains...<br>"
							src.Type += 1
							del(src.Target)
	if(src.Target == null)
		step_rand(src)
	spawn(9) DevourerAI()

/mob/proc/SpiderEggHatch()
	spawn(5000)
		if(src)
			view(src) << "<font color = red>[src] begins to stir with life...<br>"
			src.icon_state = "spider egg stir"
			spawn(2500)
				if(src)
					view(src) << "<font color = red>[src] cracks and explodes open!<br>"
					view(src) << 'Hatch.wav'
					if(src)
						src.icon_state = "spider egg hatched"
						src.Dura = 10
						var/num = rand(1,2)
						while(num)
							num -= 1
							var/mob/NPC/Evil/Misc/Baby_Giant_Spider/C = new
							C.Owner = src.Owner
							C.Move(src.loc)
						spawn(1500)
							if(src)
								del(src)
						return

/mob/proc/DevourerCacoonHatch()
	spawn(5000)
		if(src)
			view(src) << "<font color = red>[src] begins to stir with life...<br>"
			src.icon_state = "devourer cacoon stir"
			spawn(5000)
				if(src)
					view(src) << "<font color = red>[src] cracks and explodes open!<br>"
					view(src) << 'Hatch.wav'
					flick("devourer hatch",src)
					spawn(18)
						if(src)
							src.icon_state = "devourer cacoon hatched"
							src.Dura = 10
							var/mob/NPC/Evil/Undead/Corpse_Devourer/C = new
							C.Owner = src.Owner
							C.Move(src.loc)
							spawn(1500)
								if(src)
									del(src)
							return

/mob/proc/ElderGodAI()
	var/WillSpeak = prob(15)
	if(WillSpeak)
		for(var/mob/M in view(6,src))
			if(M != src)
				if(M.Race == "Illithid")
					var/Speaks = rand(1,5)
					if(Speaks == 1)
						Speaks = "Enslave the lesser beings of this world [M]..."
					if(Speaks == 2)
						Speaks = "Bring me nurishment..."
					if(Speaks == 3)
						Speaks = "May the star empower us..."
					if(Speaks == 4)
						Speaks = "Bring me brains, [M]!"
					if(Speaks == 5)
						Speaks = "May the void guide us all..."
					src.Speak(Speaks,6)
					break
	for(var/mob/M in view(6,src))
		if(M.Race != "Illithid")
			var/Resist = 0
			Resist = prob(0 + M.Intelligence)
			if(Resist)
				M << "<font color = red>You block [src]'s mental attack!<br>"
			else
				M << "<font color = red>[src] attacks your mind!<br>"
				M.Pain += rand(10,20)
				M.Brain -= rand(5,7)
				M.Brain -= src.Intelligence / 5
				M.CanMove = 0
				if(M.Fainted == 0)
					M.Stunned = 1
					M.Stun()
				if(M.Target == null && M.client == null)
					M.Target = src
				view(6,M) << "<font color=red>[M] has been stunned!<br>"
				var/Critical = prob(5 + src.Intelligence / 3)
				if(Critical)
					M.Brain -= rand(5,7)
					M.Brain -= src.Intelligence / 10
					view(6,M) << "<font color = yellow>[M]'s head becomes ruptured!<br>"
					M.Blood -= rand(15,30)
					M.Bleed()
					M.Splat()
				if(M.Brain <= 1 && M.Humanoid)
					view(6,M) << "<font color = yellow>[M]'s Brain begins to leak through their nose! Slowly they drop down to the ground, dead.<br>"
					M.Brain = 0
					M.Death()
	for(var/obj/Items/Foods/Brain/B in view(3,src))
		if(B.suffix == null)
			view(6,src) << "<font color=yellow>[src] pulls the [B] in and eats it!<br>"
			src.Hunger += 33
			if(src.Hunger >= 100)
				src.Hunger = 100
			del(B)
			break
	spawn(100) ElderGodAI()

/mob/proc/AITalk(var/T,var/mob/Speaker)
	var/Facing = 0
	if(Speaker.loc == locate(src.x,src.y-1,src.z) && src.dir == SOUTH)
		Facing = 1
	if(Speaker.loc == locate(src.x,src.y+1,src.z) && src.dir == NORTH)
		Facing = 1
	if(Speaker.loc == locate(src.x+1,src.y,src.z) && src.dir == EAST)
		Facing = 1
	if(Speaker.loc == locate(src.x-1,src.y,src.z) && src.dir == WEST)
		Facing = 1
	if(Facing && T)
		var/Knows = null
		for(var/obj/Misc/Contact/C in src.KnowList)
			if(C.name == Speaker.name)
				Knows = C
		var/Type = null
		var/L = lowertext(T)
		var/Message = null
		if(findtext(L,"i am [Speaker.name]",1,0))
			Type = "Intro"
		if(findtext(L,"my names [Speaker.name]",1,0))
			Type = "Intro"
		if(findtext(L,"[Speaker.name] is my name",1,0))
			Type = "Intro"
		if(findtext(L,"i'm [Speaker.name]",1,0))
			Type = "Intro"
		if(findtext(L,"i am called [Speaker.name]",1,0))
			Type = "Intro"
		if(findtext(L,"names [Speaker.name]",1,0))
			Type = "Intro"
		if(findtext(L,"hello",1,0))
			Type = "Greeting"
		if(findtext(L,"hi",1,0))
			Type = "Greeting"
		if(findtext(L,"hey",1,0))
			Type = "Greeting"
		if(findtext(L,"who are you",1,0))
			Type = "Question - Identity"
		if(findtext(L,"whats your name",1,0))
			Type = "Question - Identity"
		if(findtext(L,"who are you",1,0))
			Type = "Question - Identity"
		if(findtext(L,"your history",1,0))
			Type = "Question - History"
		if(findtext(L,"about yourself",1,0))
			Type = "Question - History"
		if(findtext(L,"of yourself",1,0))
			Type = "Question - History"
		if(findtext(L,"know about you",1,0))
			Type = "Question - History"
		if(findtext(L,"know your history",1,0))
			Type = "Question - History"
		if(findtext(L,"me about you",1,0))
			Type = "Question - History"
		if(Type == "Intro")
			var/AskedForName = 0
			if(src.FollowUp == "Asking Name - Hello")
				AskedForName = 1
			if(src.FollowUp == "Asking Name - History")
				AskedForName = 1
			if(AskedForName)
				Message = "<font color = teal>[src] says: Its nice to meet you [Speaker]!<br>"
				var/obj/Misc/Contact/C = new
				C.name = Speaker.name
				C.Standing += 1
				src.KnowList += C
				if(src.FollowUp == "Asking Name")
					src.FollowUp = null
			if(Knows && Message == null)
				Message = "<font color = teal>[src] says: I know your name already [Speaker]<br>"
				src.SpeakingWith = Speaker
			if(Knows == null && Message == null)
				Message = "<font color = teal>[src] says: [Speaker.name]? Very well. I am [src]<br>"
				src.SpeakingWith = Speaker
				var/obj/Misc/Contact/C = new
				C.name = Speaker.name
				C.Standing += 1
				src.KnowList += C
				if(src.FollowUp == "Asking Name")
					src.FollowUp = null
		if(Type == "Question - History")
			if(src.FollowUp == "Asking Name")
				Message = "<font color = teal>[src] says: Yes yes, You have already asked about my history, now what is your name?<br>"
			if(Speaker.name in src.KnowList)
				Knows = Speaker.name
			if(Knows && Message == null)
				Message = "<font color = teal>[src] says: Well, I'm part of the [src.Faction].<br>"
				src.SpeakingWith = Speaker
			if(Knows == null && Message == null)
				Message = "<font color = teal>[src] says:First tell me your name, then maybe we can discuss such things.<br>"
				src.SpeakingWith = Speaker
				src.FollowUp = "Asking Name"
		if(Type == "Question - Identity")
			if(Knows && Message == null)
				Message = "<font color = teal>[src] says: Why do you ask my name [Speaker] when I,ve already told you it!<br>"
				src.SpeakingWith = Speaker
			if(Knows == null && Message == null)
				Message = "<font color = teal>[src] says:Whats your name first?<br>"
				src.SpeakingWith = Speaker
				src.FollowUp = "Asking Name"
		if(Type == "Greeting")
			if(src.FollowUp == "Asking Name")
				Message = "<font color = teal>[src] says: I asked for your name.<br>"
			if(Knows && Message == null)
				Message = "<font color = teal>[src] says: Hello [Knows]...<br>"
				src.SpeakingWith = Speaker
			if(Knows == null && Message == null)
				Message = "<font color = teal>[src] says: Hello...<br>"
				src.SpeakingWith = Speaker
		if(Message)
			view() << "[Message]"
