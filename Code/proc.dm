/proc/RuinAll()
	Ruining = 1
	fdel("players/")
	fdel("map/")
	fdel("logs/")
	fdel("backups/")
	world << "<font color = teal><b><font size = 3>Deleting all Player Saves...<br>"
	world << "<font color = teal><b><font size = 3>Done...<br>"
	spawn(10)
		world << "<font color = teal><b><font size = 3>Deleting all Map Saves...<br>"
		world << "<font color = teal><b><font size = 3>Done...<br>"
		spawn(10)
			world << "<font color = teal><b><font size = 3>Deleting Logs...<br>"
			world << "<font color = teal><b><font size = 3>Done...<br>"
			spawn(10)
				world << "<font color = teal><b><font size = 3>Shutting Down...<br>"
				del(world)

/proc/AutoReboot()
	spawn(216000)
		world << "<font color=yellow><font size =3>Server will reboot in 5 minutes!<br>"
		spawn(3000)
			world << "<font color=yellow><font size =3>Server will reboot in 30 seconds!<br>"
			SaveMap()
			SaveMisc()
			spawn(300)
				world << "<font color =yellow>World rebooting!<br>"
				world.Reboot()

/proc/RebootProc()
	SaveMap()
	spawn(300)
		world << "<font color=yellow><font size =3>Server will reboot in 30 seconds!<br>"
		spawn(300)
			world << "<font color =yellow>World rebooting!<br>"
			world.Reboot()

/proc/CreateOre()
	for(var/turf/Walls/SolidStone/S in block(locate(1,1,1),locate(300,300,3)))
		if(S.density && S.opacity)
			var/Ore = prob(1)
			if(Ore)
				var/OreType = rand(1,5)
				var/Path = null
				if(OreType == 1)
					var/Choose = prob(25)
					if(Choose)
						OreType = "Gold"
						Path = /obj/Items/Resources/GoldOre/
					else
						OreType = 4
				if(OreType == 2)
					var/Choose = prob(25)
					if(Choose)
						OreType = "Silver"
						Path = /obj/Items/Resources/SilverOre/
					else
						OreType = 3
				if(OreType == 3)
					OreType = "Copper"
					Path = /obj/Items/Resources/CopperOre/
				if(OreType == 4)
					OreType = "Iron"
					Path = /obj/Items/Resources/IronOre/
				if(OreType == 5)
					OreType = "Coal"
					Path = /obj/Items/Resources/Coal/
				for(var/turf/Walls/SolidStone/W in range(rand(4,6),S))
					if(W.density && W.opacity && W.Material != OreType)
						var/Choose = prob(25)
						if(Choose)
							W.Material = OreType
							W.icon_state = "[OreType]"
							W.OrePath = Path
							W.name = "[OreType] Vein"
							W.Dura += 50

/proc/Populate()
	world.Repop()
	for(var/turf/T in world)
		if(T in Tiles)
			for(var/obj/Items/Plants/P in T)
				if(P.icon_state != "big stump" && P.icon_state != "small stump")
					del(P)
	world << "<font color =yellow>Evil stirs in the land, monsters of all shapes and sizes begin to awaken and hunt for victims...<br>"

/proc/LoadMisc()
	var/ban_sav = "players/bans.sav"
	if(length(file(ban_sav)))
		var/savefile/B = new(ban_sav)
		B["Bans"] >> BanList

	var/admin_sav = "players/admins.sav"
	if(length(file(admin_sav)))
		var/savefile/A = new(admin_sav)
		A["Admins"] >> Admins

	var/time_sav = "map/time.sav"
	if(length(file(time_sav)))
		var/savefile/Z = new(time_sav)
		Z["Month"] >> Month
		Z["Year"] >> Year
		Z["WorldSkillsCap"] >> WorldSkillsCap
		Z["WorldStrCap"] >> WorldStrCap
		Z["WorldEndCap"] >> WorldEndCap
		Z["WorldAgilCap"] >> WorldAgilCap
		Z["WorldIntCap"] >> WorldIntCap
		Z["GainRate"] >> GainRate

	var/ranks_sav = "map/ranks.sav"
	if(length(file(ranks_sav)))
		var/savefile/R = new(ranks_sav)
		R["Ranks"] >> Ranks

	var/notes_sav = "map/notes.sav"
	if(length(file(notes_sav)))
		var/savefile/N = new(notes_sav)
		N["Notes"] >> Notes

	var/pub_notes_sav = "map/pubnotes.sav"
	if(length(file(pub_notes_sav)))
		var/savefile/P = new(pub_notes_sav)
		P["Public Notes"] >> PublicNotes

	var/story_sav = "map/story.sav"
	if(length(file(story_sav)))
		var/savefile/S = new(story_sav)
		S["Story"] >> Story

/proc/LoadMap()
	for(var/turf/T in world)
		var/map_sav = "map/[T.x],[T.y],[T.z].sav"
		if(length(file(map_sav)))
			var/savefile/F = new(map_sav)
			F >> T
			Tiles += T
		for(var/obj/Items/Misc/StoneForge/S in T)
			if(S.icon_state == "forge lit")
				S.icon_state = "forge"
				S.Type = "Not Lit"
	world << "<font color = teal><b>Map Loaded!<br>"

/proc/SaveMap(var/Time)
	if(Time == null)
		Time = 1
	world << "<font color = teal><b>Map Saving Soon...<br>"
	spawn(Time)
		var/Mobs = list()
		var/Objects = list()
		var/Turfs = list()
		for(var/turf/T in Tiles)
			var/In = 0
			if(T in Turfs)
				In = 1
			if(In == 0)
				Turfs += T
		for(var/turf/T in Turfs)
			spawn(1)
				for(var/mob/M in locate(T.x,T.y,T.z))
					M.LastLoc = M.loc
					M.loc = locate(0,0,0)
					Mobs += M
				for(var/obj/O in locate(T.x,T.y,T.z))
					for(var/V in O.vars)
						var/variable = V
						var/typeof=O.vars[variable]
						if(istype(typeof,/atom/))
							if(O.LastLoc == null && typeof != T)
								O.LastLoc = O.loc
								O.loc = locate(0,0,0)
								Objects += O
					if(O.name == "Rock")
						del(O)
				T.overlays -= /obj/Misc/Weather/Snow/
				T.overlays -= /obj/Misc/Weather/Rain/
				var/tile_sav = "map/[T.x],[T.y],[T.z].sav"
				var/savefile/F = new(tile_sav)
				F << T
				for(var/mob/M in Mobs)
					M.loc = M.LastLoc
				for(var/obj/O in Objects)
					O.loc = O.LastLoc
		world << "<font color = teal><b>Map Saving...<br>"

/proc/SaveMisc()
	var/ban_sav = "players/bans.sav"
	var/savefile/B = new(ban_sav)
	B["Bans"] << BanList

	var/admin_sav = "players/admins.sav"
	var/savefile/A = new(admin_sav)
	A["Admins"] << Admins

	var/time_sav = "map/time.sav"
	var/savefile/Z = new(time_sav)
	Z["Month"] << Month
	Z["Year"] << Year
	Z["WorldSkillsCap"] << WorldSkillsCap
	Z["WorldStrCap"] << WorldStrCap
	Z["WorldEndCap"] << WorldEndCap
	Z["WorldAgilCap"] << WorldAgilCap
	Z["WorldIntCap"] << WorldIntCap
	Z["GainRate"] << GainRate

	var/ranks_sav = "map/ranks.sav"
	var/savefile/R = new(ranks_sav)
	R["Ranks"] << Ranks

	var/notes_sav = "map/notes.sav"
	var/savefile/N = new(notes_sav)
	N["Notes"] << Notes

	var/pub_notes_sav = "map/pubnotes.sav"
	var/savefile/P = new(pub_notes_sav)
	P["Public Notes"] << PublicNotes

	var/story_sav = "map/story.sav"
	var/savefile/S = new(story_sav)
	S["Story"] << Story

/proc/Weather()
	if(Season == "Winter")
		if(Weather == null)
			Weather = "Snow"
			for(var/turf/T in block(locate(1,1,1),locate(215,250,1)))
				T.overlays -= /obj/Misc/Weather/Rain/
				if(T.Type != "Dark" && T.density == 0 && T.Type != "Inside")
					T.overlays += /obj/Misc/Weather/Snow/
			return
		else
			Weather = null
			for(var/turf/T in block(locate(1,1,1),locate(215,250,1)))
				T.overlays -= /obj/Misc/Weather/Snow/
			return

	if(Season == "Spring")
		Weather = null
		for(var/turf/T in block(locate(1,1,1),locate(215,250,1)))
			T.overlays -= /obj/Misc/Weather/Snow/
		return

	if(Season == "Autumn")
		if(Weather == null)
			Weather = "Rain"
			for(var/turf/T in block(locate(1,1,1),locate(215,250,1)))
				if(T.Type != "Dark" && T.density == 0 && T.Type != "Inside")
					T.overlays += /obj/Misc/Weather/Rain/
			CreateLightening()
			return
		else
			Weather = null
			for(var/turf/T in block(locate(1,1,1),locate(215,250,1)))
				T.overlays -= /obj/Misc/Weather/Rain/
			return

/proc/RandomEvents(var/EventNum)
	if(EventNum == null)
		EventNum = rand(1,5)
	if(EventNum == 1)
		world << "<font color = yellow><b>From under the ground, hundreds upon hundreds of sounds could be heard. Thumps and pitter pattering of tiny feet, hordes of Ratling invaders forming an army and rushing through the dark underpaths of the known world. From every passage leading to the upper kingdoms, these creatures pour forth and attack the surface dwellers.<br>"
		for(var/obj/Misc/SewerGrate/G in world)
			var/Invaders = rand(35,50)
			while(Invaders)
				Invaders -= 1
				var/mob/NPC/Evil/Chaos/Ratling_Invader/I = new
				I.loc = G.loc
			var/Assassins = rand(5,10)
			while(Assassins)
				Assassins -= 1
				var/mob/NPC/Evil/Chaos/Ratling_Assassin/A = new
				A.loc = G.loc
	if(EventNum == 2)
		world << "<font color = yellow><b>A strange cold wind begins to blow as dark clouds form. Strange noises from under the ground could be heard across the country side. Dealthly screams, moans and voices echoe in all directions as the wind settles and a faint mist begins to set. From ancient graves the deceased begin to rise, grouping together and heading towards the living, hungry for flesh and vengence.<br>"
		for(var/obj/Items/Misc/GraveStone/G in world)
			var/Skeletons = rand(2,5)
			while(Skeletons)
				Skeletons -= 1
				var/mob/NPC/Evil/Undead/Undead_Skeleton/S = new
				S.loc = G.loc
	if(EventNum == 3)
		world << "<font color = yellow><b>The number of bandits in the area begins to steadily increase accross the land. After a while, it becomes apprant to those who wander the country side that all is not well. Once in a while, the Bandit leaders decide to form up and attack the Human Kingdom and anyone else who got in their way, and this was one such gathering. The massive, but sligthly clunky and un-organised army, begins to decend down upon the inhabbitants of the world.<br>"
		var/Bandits = rand(40,60)
		var/mob/NPC/Evil/Misc/Human_Bandit/B = new
		B.Type = "Leader"
		B.FindSuitableLocation()
		spawn(10)
			if(B)
				while(Bandits)
					Bandits -= 1
					var/mob/NPC/Evil/Misc/Human_Bandit/Ba = new
					Ba.loc = B.loc
	if(EventNum == 4)
		world << "<font color = yellow><b>Goblin numbers start to rise frantically, signs of a large horde begin to show. After some time, a rag tag squabble forms and starts to roam the country side in search of shiney objects. The Goblins leave destruction in their wake and appear to be following a large Troll.<br>"
		var/Gobs = rand(40,60)
		var/mob/NPC/Evil/Misc/Troll/Troll/T = new
		T.Type = "Leader"
		T.FindSuitableLocation()
		spawn(10)
			if(T)
				while(Gobs)
					Gobs -= 1
					var/mob/NPC/Evil/Misc/Goblin/G = new
					G.loc = T.loc
	if(EventNum == 5)
		world << "<font color = yellow><b>Like a torrent, hundreds of Kobold suddenly burst forth from a cave that leads to a vast underground network. After many years of inner fighting, this immense disgusting force of creatures had finally reached the limit on living space and had little choice to venture out. However, food was short and before long the horde was massing upon the country side in search of Nurishment.<br>"
		var/Bandits = rand(50,70)
		var/mob/NPC/Evil/Misc/Kobold/KL = new
		KL.Type = "Leader"
		KL.FindSuitableLocation()
		spawn(10)
			if(KL)
				while(Bandits)
					Bandits -= 1
					var/mob/NPC/Evil/Misc/Kobold/K = new
					K.loc = KL.loc

/proc/CreateLightening()
	if(Season == "Autumn" && Weather == "Rain")
		var/X = rand(1,215)
		var/Y = rand(1,250)
		var/obj/Misc/Layer/L = new
		L.loc = locate(X,Y,1)
		for(var/turf/T in range(0,L))
			if(T.Type != "Dark" && T.density == 0)
				var/obj/Misc/Weather/LighteningHit/LH = new
				LH.loc = locate(X,Y,1)
				for(var/mob/M in range(0,LH))
					view(6,LH) << "<font color = yellow>[M] is struck by [LH]!<br>"
					M.Blood -= 33
					M.Pain += 50
					M.Bleed()
				var/obj/Items/Resources/Ash/A = new
				A.loc = LH.loc
		del(L)
	else
		return
	spawn(100) CreateLightening()

/proc/Seasons()
	if(Month == 3)
		Season = "Spring"
		world << "<font color = green><font size = 4><b>It is now Spring<br>"
		Populate()
	if(Month == 6)
		Season = "Summer"
		world << "<font color = yellow><font size = 4><b>It is now Summer<br>"
		Populate()
	if(Month == 9)
		Season = "Autumn"
		world << "<font color = red><font size = 4><b>It is now Autumn<br>"
		Populate()
	if(Month == 12)
		Season = "Winter"
		world << "<font color = blue><font size = 4><b>It is now Winter<br>"
		Populate()

/proc/DayNightCyle()
	var/Delay
	if(Night == 0)
		Night = 1
		world << "<font color =teal>The sun sets<br>"
		Delay = 10000
		for(var/turf/T in block(locate(1,1,1),locate(300,300,1)))
			if(T.OnFire == 0)
				T.luminosity = 0
		spawn(Delay)
			DayNightCyle()
		return
	if(Night)
		Night = 0
		world << "<font color =teal>The sun rises<br>"
		Delay = 20000
		for(var/turf/T in block(locate(1,1,1),locate(300,300,1)))
			if(T.Type != "Dark")
				if(T.OnFire == 0)
					T.luminosity = 1
		spawn(Delay)
			DayNightCyle()
		return

/proc/Time()
	Month += 1
	Seasons()
	Weather()
	var/NeedRewards = list()
	WorldSkillsCap += 3
	WorldStrCap += 3
	WorldAgilCap += 3
	WorldEndCap += 3
	WorldIntCap += 3
	for(var/mob/M in Players)
		if(M.LoggedIn)
			M.SkillCap += 3
			M.StrCap += 3
			M.AgilCap += 3
			M.EndCap += 3
			M.IntCap += 3
			M.HairGrowth()
			if(M.RPpoints >= 1)
				NeedRewards += M
				if(M.RPpoints >= 100)
					M.RPpoints = 100
	for(var/mob/M in Players)
		if(M.Admin)
			var/RPers = 0
			for(var/mob/Z in NeedRewards)
				M << "<font color = teal><b>([Z.key])[Z] has [Z.RPpoints] RP Points.<br>"
				RPers = 1
			if(RPers)
				M << "<font color = teal><b>Check their logs to make sure they did not spam the Emote button, then reward them +1 in each stat for every 1 RP Point they have.<br>"
	if(Month == 12)
		Month = 0
		Year += 1
		RandomEvents()
		SaveMap(600)
		for(var/mob/M in Players)
			if(M.LoggedIn)
				M.Age += 1
				if(M.Age >= M.DieAge && M.client)
					if(M.Faction != "Undead")
						view(M) << "<font color = yellow>[M] suddenly falls to the ground grasping their heart. It seems they have died of old age and suffered a massive heart attack!<br>"
						M.Death()
	world << "<font color =green><b>It is now Year [Year], Month [Month]<br>"
	world << "<font color = teal><font size = 3>Visit <a href=http://z4.invisionfree.com/Lands_of_Legend/index.php?showtopic=264>This Guide</a> for help on how to play Lands of Legend! Or press G for an in game Help Menu.<br>"

/proc/Edit_null_display(typeof)
	if(typeof=="")
		return"and currently equals null"
	else
		return"and currently equals [typeof]"

//////////////////////ANTI SPAM PROCS/////////////////////

/proc/SGS_Filter_txt(txt)
	var/stars
	var/s_amount
	var/mem
	var/find_t
	var/txtLen
	var/Words[]
	Words = new /list/
	Words = list("<p>","\n",",raping","rape","fuck","shit","bitch","whore","fag","dick","gay","lesbian","faggot","fag","pussy","cunt","cock","nigger","asshole","<br>")
	if(Words.len)
		memo:
			for(mem = 1,mem < Words.len + 1,mem++)
				find_t = findtext(txt,Words[mem])
				if(find_t)
					txtLen = length(Words[mem])
					stars = null
					s_amount = null
					for(s_amount = 0,s_amount < txtLen,s_amount++)
						stars += "*"
					txt = copytext(txt,1,find_t) + stars + copytext(txt,find_t+txtLen,0)
					if(findtext(txt,Words[mem]))
						goto memo
	return txt

/proc/SGS_AntiSpam(txt)
	var/spam = list("<beep>")
	for(var/m in spam)
		if(SGS_allow_beep == 0)
			if(findtext(txt,m))
				return ""
			else if(SGS_allowhtml == 0)
				return SGS_AntiSpam2(copytext(html_encode(txt),1,SGS_Brake_txt))
			else if(SGS_allowhtml == 1)
				return SGS_AntiSpam2(copytext(html_encode(txt),1,SGS_Brake_txt))

/proc/SGS_AntiSpam2(txt)
	if(usr.SGS_locked == 0)
		if(usr.SGS_remember_txt == txt)
			usr.SGS_kick_for_repeat ++
		else
			usr.SGS_remember_txt = txt
			usr.SGS_kick_for_repeat = null
			usr.SGS_kick_for_repeat ++
		return txt
		SGS_reset()

/proc/SGS_reset()
	spawn(SGS_Waittime) usr.SGS_kick_for_repeat = null

/proc/Safe_Guard(txt)
	return SGS_Filter_txt(SGS_AntiSpam(txt))

//////////////////////END OF ANTI SPAM PROCS/////////////////////