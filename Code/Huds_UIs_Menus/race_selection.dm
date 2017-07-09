/obj/HUD/RaceSelection
	icon = 'menu.dmi'
	layer = 100

/obj/HUD/RaceSelection/Male
	icon_state = "male off"
	Type = "male"

/obj/HUD/RaceSelection/Male/Click()
	if(usr.Race)
		if(usr.Gender == null)
			src.icon_state = "male on"
			usr.Gender = "Male"
	else
		usr << "<b>Choose a race first!<br>"
		return

/obj/HUD/RaceSelection/Female
	icon_state = "female off"
	Type = "female"

/obj/HUD/RaceSelection/Female/Click()
	if(usr.Race)
		if(usr.Gender == null)
			src.icon_state = "female on"
			usr.Gender = "Female"
	else
		usr << "<b>Choose a race first!<br>"
		return

/obj/HUD/RaceSelection/Accept
	icon = 'books.dmi'
	icon_state = "accept"
	Type = "DontChange"

/obj/HUD/RaceSelection/Accept/Click()
	if(usr.Race)
		if(usr.Gender)
			usr << sound(null)
			usr.MusicProc()
			usr.density = 1
			usr.CreateCharacter()
		else
			usr << "<b>Choose a gender first!<br>"
			return
	else
		usr << "<b>Choose a race by clicking a portrait!<br>"
		return

/obj/HUD/RaceSelection/Cancel
	icon = 'books.dmi'
	icon_state = "cancel"
	Type = "DontChange"

/obj/HUD/RaceSelection/Cancel/Click()
	usr.ResetSelections()

/obj/HUD/RaceSelection/Human
	icon_state = "human off"
	Type = "human"

/obj/HUD/RaceSelection/Human/Click()
	if(usr.Race ==null)
		src.icon_state = "human on"
		usr.Race = "Human"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Humans--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Humans are the most balanced of all the races.")
		usr.Text("RaceInfo",usr,2,11,10,14,"Within the Empire there are various guilds")
		usr.Text("RaceInfo",usr,2,10,10,14,"Most of which revolve around the worship of")
		usr.Text("RaceInfo",usr,2,9,10,14,"the God of Order. Humans have average Strength,")
		usr.Text("RaceInfo",usr,2,8,10,14,"Agility, Endurance and slightly above average")
		usr.Text("RaceInfo",usr,2,7,10,14,"Intelligence. They have good skill in swords and")
		usr.Text("RaceInfo",usr,2,6,10,14,"shields and are also very good at carpentry and")
		usr.Text("RaceInfo",usr,2,5,10,14,"farming. Humans tend to live for around 85 years.")

/obj/HUD/RaceSelection/Giant
	icon_state = "giant off"
	Type = "giant"

/obj/HUD/RaceSelection/Giant/Click()
	if(usr.Race ==null)
		src.icon_state = "giant on"
		usr.Race = "Giant"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Giants--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Giants are a strong but dim race. They")
		usr.Text("RaceInfo",usr,2,11,10,14,"tend to live in caves or small villages. Due")
		usr.Text("RaceInfo",usr,2,10,10,14,"to their intelligence they tend to worship any")
		usr.Text("RaceInfo",usr,2,9,10,14,"God they hear of. Giants have very good Strength,")
		usr.Text("RaceInfo",usr,2,8,10,14,"Endurance and very bad Agility and Intelligence.")
		usr.Text("RaceInfo",usr,2,7,10,14,"They have very good skill with blunt weapons but")
		usr.Text("RaceInfo",usr,2,6,10,14,"lack skill with others.Giants are very skilled at")
		usr.Text("RaceInfo",usr,2,5,10,14,"tree chopping and mining,aswell as contruction.")
		usr.Text("RaceInfo",usr,2,4,10,14,"They tend to live for 100 years.")

/obj/HUD/RaceSelection/Stahlite
	icon_state = "dwarf off"
	Type = "dwarf"

/obj/HUD/RaceSelection/Stahlite/Click()
	if(usr.Race ==null)
		src.icon_state = "dwarf on"
		usr.Race = "Stahlite"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Stahlites--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Stahlite are a very reclusive race of short")
		usr.Text("RaceInfo",usr,2,11,10,14,"beared humans. They love to mine for riches and")
		usr.Text("RaceInfo",usr,2,10,10,14,"constantly drink to keep their spirits high, the")
		usr.Text("RaceInfo",usr,2,9,10,14,"Stahlite tend to worship the God of Crafts,Stahlite")
		usr.Text("RaceInfo",usr,2,8,10,14,"have good Strength and Endurance but slightly poor")
		usr.Text("RaceInfo",usr,2,7,10,14,"Agility.They are as smart as humans. They are very")
		usr.Text("RaceInfo",usr,2,6,10,14,"good with Axes and Blunts,as well as ranged weapons")
		usr.Text("RaceInfo",usr,2,5,10,14,"Stahlite are good at most crafting skill,especially")
		usr.Text("RaceInfo",usr,2,4,10,14,"contruction.Stahlite tend to live for 150 years.")

/obj/HUD/RaceSelection/Cyclops
	icon_state = "cyclops off"
	Type = "cyclops"

/obj/HUD/RaceSelection/Cyclops/Click()
	if(usr.Race ==null)
		src.icon_state = "cyclops on"
		usr.Race = "Cyclops"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Cyclops--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Cyclops are a primitive race of cave dwellers")
		usr.Text("RaceInfo",usr,2,11,10,14,"who love to raid other settlements. They are very")
		usr.Text("RaceInfo",usr,2,10,10,14,"anti social and incredibily stupid. They only")
		usr.Text("RaceInfo",usr,2,9,10,14,"worship the God of Destruction. Cyclops have good")
		usr.Text("RaceInfo",usr,2,8,10,14,"Strength and Endurance but bad Agility and very")
		usr.Text("RaceInfo",usr,2,7,10,14,"bad Intelligence. They are very skilled in blunt")
		usr.Text("RaceInfo",usr,2,6,10,14,"weapons but lack the skill of others. They are")
		usr.Text("RaceInfo",usr,2,5,10,14,"also good at hunting and trap making.")
		usr.Text("RaceInfo",usr,2,4,10,14,"They tend to live for 90 years.")

/obj/HUD/RaceSelection/Frogman
	icon_state = "frogman off"
	Type = "frogman"

/obj/HUD/RaceSelection/Frogman/Click()
	if(usr.Race ==null)
		src.icon_state = "frogman on"
		usr.Race = "Frogman"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Frogmen--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Frogmen are a very agile race of swamp dwellers")
		usr.Text("RaceInfo",usr,2,11,10,14,"who constantly fight over breeding grounds. They")
		usr.Text("RaceInfo",usr,2,10,10,14,"tend to worship the Gods of Harvest and Beasts.")
		usr.Text("RaceInfo",usr,2,9,10,14,"Frogmen have very good Agility but poor Strength")
		usr.Text("RaceInfo",usr,2,8,10,14,"and Endurnace they also have poor Intelligence.They")
		usr.Text("RaceInfo",usr,2,7,10,14,"are skilled with spears,shields and ranged weapons.")
		usr.Text("RaceInfo",usr,2,6,10,14,"They have good skills at trap making,hunting")
		usr.Text("RaceInfo",usr,2,5,10,14,"and Swimming. Frogmen tend to live for 80 years.")

/obj/HUD/RaceSelection/Wolfman
	icon_state = "wolfman off"
	Type = "wolfman"

/obj/HUD/RaceSelection/Wolfman/Click()
	if(usr.Race ==null)
		src.icon_state = "wolfman on"
		usr.Race = "Wolfman"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Wolfmen--")
		usr.Text("RaceInfo",usr,2,12,10,14,"Wolfmen are a brutal race of hunters and stalkers")
		usr.Text("RaceInfo",usr,2,11,10,14,"of the night. Their great strength and speed")
		usr.Text("RaceInfo",usr,2,10,10,14,"make them a worthy foe for any opponent. Wolfmen")
		usr.Text("RaceInfo",usr,2,9,10,14,"worship the gods of Beasts, Destruction and")
		usr.Text("RaceInfo",usr,2,8,10,14,"rarely Death. They have amazing un-armed skill,but")
		usr.Text("RaceInfo",usr,2,7,10,14,"below average weapon skill in all other areas.")
		usr.Text("RaceInfo",usr,2,6,10,14,"They are great trackers, skinners, and fishers")
		usr.Text("RaceInfo",usr,2,5,10,14,"and tend to live for around 90 years.")

/obj/HUD/RaceSelection/Snakeman
	icon_state = "snakeman off"
	Type = "snakeman"

/obj/HUD/RaceSelection/Snakeman/Click()
	if(usr.Race ==null)
		src.icon_state = "snakeman on"
		usr.Race = "Snakeman"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Snakemen--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Snakemen are one of the oldest races in")
		usr.Text("RaceInfo",usr,2,11,10,14,"the world,third to the Stahlites and Altherians.")
		usr.Text("RaceInfo",usr,2,10,10,14,"They are a desert dwelling nomad race, with no")
		usr.Text("RaceInfo",usr,2,9,10,14,"true home or loyalties. They tend to worship the")
		usr.Text("RaceInfo",usr,2,8,10,14,"gods of Wisdom, Blood and Death, but are not truly")
		usr.Text("RaceInfo",usr,2,7,10,14,"good or evil. Snakeman are strong and fast,but lack")
		usr.Text("RaceInfo",usr,2,6,10,14,"the endruance of others. They have great skills in")
		usr.Text("RaceInfo",usr,2,5,10,14,"most weapons.They are good at stone work & alchemy.")
		usr.Text("RaceInfo",usr,2,4,10,14,"Snakemen tend to live for around 100 years.")

/obj/HUD/RaceSelection/Lizardman
	icon_state = "lizardman off"
	Type = "lizardman"

/obj/HUD/RaceSelection/Lizardman/Click()
	if(usr.Race ==null)
		src.icon_state = "lizardman on"
		usr.Race = "Illithid"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Lizardmen--")
		usr.Text("RaceInfo",usr,2,12,10,14,"Illithids are not native to this world, coming")
		usr.Text("RaceInfo",usr,2,11,10,14,"from a strange star long ago.They are super")
		usr.Text("RaceInfo",usr,2,10,10,14,"Intelligent and rather agile, but lack strength")
		usr.Text("RaceInfo",usr,2,9,10,14,"and endurance.They gain in every skill at an")
		usr.Text("RaceInfo",usr,2,8,10,14,"above average rate and start with some Astral")
		usr.Text("RaceInfo",usr,2,7,10,14,"Magic.They speak Ancient,regrow lost limbs and")
		usr.Text("RaceInfo",usr,2,6,10,14,"need not breathe.They make excellent magic users")
		usr.Text("RaceInfo",usr,2,5,10,14,"and learn it with great speed.Illithids live for")
		usr.Text("RaceInfo",usr,2,4,10,14,"200 years and worship no earthly god.")

/obj/HUD/RaceSelection/Illithid
	icon_state = "illithid off"
	Type = "illithid"

/obj/HUD/RaceSelection/Illithid/Click()
	if(usr.Race ==null)
		src.icon_state = "illithid on"
		usr.Race = "Illithid"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Illithids--")
		usr.Text("RaceInfo",usr,2,12,10,14,"Illithids are not native to this world, coming")
		usr.Text("RaceInfo",usr,2,11,10,14,"from a strange star long ago.They are super")
		usr.Text("RaceInfo",usr,2,10,10,14,"Intelligent and rather agile, but lack strength")
		usr.Text("RaceInfo",usr,2,9,10,14,"and endurance.They gain in every skill at an")
		usr.Text("RaceInfo",usr,2,8,10,14,"above average rate and start with some Astral")
		usr.Text("RaceInfo",usr,2,7,10,14,"Magic.They speak Ancient,regrow lost limbs and")
		usr.Text("RaceInfo",usr,2,6,10,14,"need not breathe.They make excellent magic users")
		usr.Text("RaceInfo",usr,2,5,10,14,"and learn it with great speed.Illithids live for")
		usr.Text("RaceInfo",usr,2,4,10,14,"200 years and worship no earthly god.")

/obj/HUD/RaceSelection/Alther
	icon_state = "elf off"
	Type = "elf"

/obj/HUD/RaceSelection/Alther/Click()
	if(usr.Race ==null)
		src.icon_state = "elf on"
		usr.Race = "Alther"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Altherions--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Altherions are a highly intelligent race")
		usr.Text("RaceInfo",usr,2,11,10,14,"who specialize in magical and spiritial culture.")
		usr.Text("RaceInfo",usr,2,10,10,14,"They worship the Gods of Harvest,Beasts and")
		usr.Text("RaceInfo",usr,2,9,10,14,"Wisdom and somtimes the God of Order.They have good")
		usr.Text("RaceInfo",usr,2,8,10,14,"Agility and very good intelligence but lack in")
		usr.Text("RaceInfo",usr,2,7,10,14,"Strength and Endurance. Altherions have good skill")
		usr.Text("RaceInfo",usr,2,6,10,14,"in all weapons except axes.They are skilled at")
		usr.Text("RaceInfo",usr,2,5,10,14,"Stone Work,Contruction and Hunting.They tend to")
		usr.Text("RaceInfo",usr,2,4,10,14,"live for 200 years.")

/obj/HUD/RaceSelection/Ratling
	icon_state = "ratling off"
	Type = "ratling"

/obj/HUD/RaceSelection/Click()
	if(usr.Race ==null)
		src.icon_state = "ratling on"
		usr.Race = "Ratling"
		usr.Text("RaceInfo",usr,7,13,10,14,"--Ratlings--")
		usr.Text("RaceInfo",usr,2,12,10,14,"The Ratlings are a disgusting race of warped rodent")
		usr.Text("RaceInfo",usr,2,11,10,14,"who specialize in death and detruction. They were")
		usr.Text("RaceInfo",usr,2,10,10,14,"created by Chaos Energy and worship the Gods of")
		usr.Text("RaceInfo",usr,2,9,10,14,"Destruction,Death and Chaos. They have incredible")
		usr.Text("RaceInfo",usr,2,8,10,14,"Agility, but very poor Strength and Endurance.They")
		usr.Text("RaceInfo",usr,2,7,10,14,"have average Intelligence and are very skilled with")
		usr.Text("RaceInfo",usr,2,6,10,14,"Daggers, Spears and Ranged weapons.They are good at")
		usr.Text("RaceInfo",usr,2,5,10,14,"making traps, hunting and stealth.Ratlings tend to")
		usr.Text("RaceInfo",usr,2,4,10,14,"live for 75 years.")
