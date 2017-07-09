/obj/HUD/Menus/Admin
	layer = 100
	icon = 'adminhud.dmi'
	Type = "AdminHuds"

/obj/HUD/Menus/Admin/BackGround
	icon_state = "background"

/obj/HUD/Menus/Admin/TMiddle
	icon_state = "Tmiddle"

/obj/HUD/Menus/Admin/Left
	icon_state = "L"

/obj/HUD/Menus/Admin/Right
	icon_state = "R"

/obj/HUD/Menus/Admin/Top
	icon_state = "T"

/obj/HUD/Menus/Admin/Bottom
	icon_state = "B"

/obj/HUD/Menus/Admin/TR
	icon_state = "TR"

/obj/HUD/Menus/Admin/TL
	icon_state = "TL"

/obj/HUD/Menus/Admin/BL
	icon_state = "BL"

/obj/HUD/Menus/Admin/BR
	icon_state = "BR"

/obj/HUD/AdminButtons
	icon = 'adminhud.dmi'

/obj/HUD/AdminButtons/AdminSummon
	icon_state = "summon off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminSummon/Click()
	if(usr.Admin)
		src.icon_state = "summon on"
		var/list/menu = new()
		var/Mobs = list()
		for(var/mob/M in world)
			menu += "[M.name]"
			if(M.OrginalName)
				menu += "[M.OrginalName]"
			Mobs += M
		menu += "Cancel"
		var/Result = input("Who do you wish to summon?", "Choose", null) in menu
		if (Result == "Cancel")
			src.icon_state = "summon off"
			return
		if(Result)
			var/mob/Found = null
			for(var/mob/M in Mobs)
				if(M.name == Result)
					Found = M
				if(M.OrginalName == Result)
					Found = M
			if(Found)
				Found.loc = usr.loc
				Found.overlays -= /obj/Misc/Bubbles/
				Found.overlays -= /obj/Misc/Swim/
				Found.InWater = 0
				src.icon_state = "summon off"
				Found << "<font color =yellow>[usr] summons you!<br>"
				usr << "<font color =green>You summon [Found]!<br>"
				usr.Log_admin("([usr.key])[usr] summons [Found] to [usr.x],[usr.y],[usr.z]")

/obj/HUD/AdminButtons/AdminTeleport
	icon_state = "teleport off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminTeleport/Click()
	if(usr.Admin)
		usr << "<font color = yellow>Location - [usr.x],[usr.y],[usr.z]<br>"
		switch(alert("Teleport to Object? Or Teleport to location?",,"Object","Location"))
			if("Location")
				var/X=input("X Location??")as num
				var/Y=input("Y Location??")as num
				var/Z=input("Z Location??")as num
				if(X)
					if(Y)
						if(Z)
							usr.loc = locate(X,Y,Z)
							usr.overlays -= /obj/Misc/Bubbles/
							usr.overlays -= /obj/Misc/Swim/
							usr.InWater = 0
							usr << "<font color = green>You teleport to [X],[Y],[Z]!<br>"
							usr.Log_admin("([usr.key])[usr] teleports to [X],[Y],[Z]")
				return
			if("Object")
				src.icon_state = "teleport on"
				var/list/menu = new()
				var/Mobs = list()
				for(var/mob/M in world)
					menu += "[M.name]"
					if(M.OrginalName)
						menu += "[M.OrginalName]"
					Mobs += M
				menu += "Cancel"
				var/Result = input("Who do you wish to teleport to?", "Choose", null) in menu
				if (Result == "Cancel")
					src.icon_state = "teleport off"
					return
				if(Result)
					var/mob/Found = null
					for(var/mob/M in Mobs)
						if(M.name == Result)
							Found = M
						if(M.OrginalName == Result)
							Found = M
					if(Found)
						usr.loc = Found.loc
						usr.overlays -= /obj/Misc/Bubbles/
						usr.overlays -= /obj/Misc/Swim/
						usr.InWater = 0
						src.icon_state = "teleport off"
						usr.Log_admin("([usr.key])[usr] teleports to [Found]")

/obj/HUD/AdminButtons/AdminCreate
	icon_state = "create off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminCreate/Click()
	if(usr.Admin >= 2)
		src.icon_state = "create on"
		var/T=input("Create what??")as null|anything in typesof(/obj,/mob)
		if(T == null)
			src.icon_state = "create off"
			return
		if(T)
			var/N=input("How many?? No more than 50")as null|num
			if(N == 0)
				return
			if(N >= 51)
				usr << "That number is too high!<br>"
				return
			if(N == null)
				return
			if(N)
				usr.Log_admin("([usr.key])[usr] creates [N] [T] at [usr.x],[usr.y],[usr.z]")
				while(N)
					N -= 1
					var/obj/O = new T()
					O.loc = usr.loc
					src.icon_state = "create off"
	else
		usr << "<font color = teal>Your Admin Level is not High enough.<br>"
		return

/obj/HUD/AdminButtons/AdminEdit
	icon_state = "edit off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminEdit/Click()
	src.icon_state = "edit on"
	if(usr.AdminDelete)
		usr << "<font color = green>Admin Delete Mode Off!<br>"
		usr.AdminDelete = 0
		src.icon_state = "edit off"
		return
	if(usr.AdminEdit)
		usr << "<font color = green>Admin Edit Mode Off!<br>"
		usr.AdminEdit = 0
		src.icon_state = "edit off"
		return
	switch(alert("Double Click an object to Delete? Or Double Click an object to Edit?",,"DoubleClick","Delete"))
		if("Delete")
			if(usr.Admin >= 2)
				usr.AdminDelete = 1
				usr << "<font color = green> Double Click an object to Delete/Boot it!<br>"
				return
			else
				usr << "<font color = teal>Your Admin Level is not High enough.<br>"
				return
		if("DoubleClick")
			if(usr.Admin >= 3)
				usr.AdminEdit = 1
				usr << "<font color = green> Double Click an object to Edit it!<br>"
				return
			else
				usr << "<font color = teal>Your Admin Level is not High enough.<br>"
				return

/obj/HUD/AdminButtons/AdminBan
	icon_state = "ban off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminBan/Click()
	if(usr.Admin >= 1)
		src.icon_state = "ban on"
		switch(alert("Ban or Un-Ban?",,"Ban","Un-Ban"))
			if("Un-Ban")
				var/T=input("Which address would you like to unban?")as null|anything in BanList
				BanList -= T
				src.icon_state = "ban off"
				SaveMisc()
				return
			if("Ban")
				switch(alert("Ban or Manual Ban?",,"Ban","Manual Ban"))
					if("Manual Ban")
						var/B = input("Enter the IP or Key of a Player to Ban","Ban")as null|text
						if(!B)
							src.icon_state = "ban off"
							return
						BanList += B
						src.icon_state = "ban off"
						world << "<font color = teal>[B] was Manually Banned by [usr]<br>"
						SaveMisc()
						return
					if("Ban")
						var/Ban = list()
						var/list/menu = new()
						for(var/mob/M in world)
							if(M.client)
								usr << "([M.key])[M]<br>"
								menu += "[M.key]"
								Ban += M
						menu += "Cancel"
						var/Result = input("Who do you wish to Ban?", "Choose", null) in menu
						if (Result == "Cancel")
							src.icon_state = "ban off"
							return
						if(Result)
							if(Result == "Ginseng")
								world << "<font color = teal><b><font size = 6>[usr] Tried to Ban Ginseng, but fails!<br>"
								src.icon_state = "ban off"
								return
							if(Result == "Ginseng")
								src.icon_state = "ban off"
								return
							var/R = input("Reason")as null|text
							for(var/mob/M in Ban)
								if(M.key == Result)
									BanList += M.client.address
									world << "<font color = teal>([Result]) [M] has been Banned by ([usr.key])[usr] for [R]!<br>"
									src.icon_state = "ban off"
									usr.Log_admin("([usr.key])[usr] bans ([M.key])[M] for [R]")
									del(M)
									SaveMisc()
							return
	else
		usr << "<font color = teal>Your Admin Level is not High enough.<br>"
		return

/obj/HUD/AdminButtons/AdminInprison
	icon_state = "prison off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminInprison/Click()
	if(usr.Admin)
		src.icon_state = "prison on"
		var/list/menu = new()
		var/Mobs = list()
		for(var/mob/M in world)
			menu += "[M.name]"
			if(M.OrginalName)
				menu += "[M.OrginalName]"
			Mobs += M
		menu += "Cancel"
		var/Result = input("Who do you wish to In-Prison?", "Choose", null) in menu
		if (Result == "Cancel")
			src.icon_state = "prison off"
			return
		if(Result)
			var/mob/Found = null
			for(var/mob/M in Mobs)
				if(M.name == Result)
					Found = M
				if(M.OrginalName == Result)
					Found = M
			if(Found)
				switch(alert("Send them to a Prison, or to Hell?",,"Prison","Hell"))
					if("Prison")
						var/R = input("Reason")as null|text
						world << "<font color = teal>([Found.key]) [Found] has been In-Prisoned by ([usr.key]) [usr] for [R]!<br>"
						Found << "<font color = teal><font size = 3>You will be automatically released after one in game month!<br>"
						src.icon_state = "prison off"
						var/LOC = rand(1,6)
						if(LOC == 1)
							Found.loc = locate(25,105,1)
						if(LOC == 2)
							Found.loc = locate(25,103,1)
						if(LOC == 3)
							Found.loc = locate(25,100,1)
						if(LOC == 4)
							Found.loc = locate(31,105,1)
						if(LOC == 5)
							Found.loc = locate(31,103,1)
						if(LOC == 6)
							Found.loc = locate(31,100,1)
						Found.overlays -= /obj/Misc/Bubbles/
						Found.overlays -= /obj/Misc/Swim/
						Found.InWater = 0
						Found.Jailed = 1
						Found.JailTime()
						usr.Log_admin("([usr.key])[usr] jails [Found] for [R]")
						return
					if("Hell")
						usr << "Not added Hell yet."
						return
						var/R = input("Reason")as null|text
						world << "<font color = teal>([Found.key]) [Found] has been sent to Hell by ([usr.key]) [usr] for [R]!<br>"
						src.icon_state = "prison off"
						Found.loc = locate(250,250,4)
						usr.Log_admin("([usr.key])[usr] sends [Found] to Hell.")

/obj/HUD/AdminButtons/AdminMute
	icon_state = "mute off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminMute/Click()
	if(usr.Admin)
		src.icon_state = "mute on"
		switch(alert("Mute a Player? Or Mute the World?",,"Player","World"))
			if("World")
				if(Mute)
					Mute = 0
					world << "<font color = teal>OOC is now Enabled!<br>"
					src.icon_state = "mute off"
					usr.Log_admin("([usr.key])[usr] turns on OOC")
					return
				if(Mute == 0)
					Mute = 1
					world << "<font color = teal>OOC is now Disabled!<br>"
					src.icon_state = "mute off"
					usr.Log_admin("([usr.key])[usr] turns off OOC")
					return
			if("Player")
				var/list/menu = new()
				var/Mobs = list()
				for(var/mob/M in Players)
					menu += "[M.name]"
					if(M.OrginalName)
						menu += "[M.OrginalName]"
					Mobs += M
				menu += "Cancel"
				var/Result = input("Who do you wish to Mute?", "Choose", null) in menu
				if (Result == "Cancel")
					src.icon_state = "mute off"
					return
				if(Result)
					var/mob/Found = null
					for(var/mob/M in Mobs)
						if(M.name == Result)
							Found = M
						if(M.OrginalName == Result)
							Found = M
					if(Found)
						if(Found.Muted == 0)
							Found.Muted = 1
							world << "<font color = teal>([Found.key]) [Found] has been Muted!<br>"
							src.icon_state = "mute off"
							usr.Log_admin("([usr.key])[usr] mutes [Found]")
							return
						if(Found.Muted)
							Found.Muted = 0
							world << "<font color = teal>([Found.key]) [Found] has been Un-Muted!<br>"
							src.icon_state = "mute off"
							usr.Log_admin("([usr.key])[usr] un-mutes [Found]")
							return

/obj/HUD/AdminButtons/AdminChangeDensity
	icon_state = "turn non-dense off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminChangeDensity/Click()
	if(usr.Admin)
		if(usr.density)
			src.icon_state = "turn non-dense on"
			usr.density = 0
			usr << "<font color = green>You are now non-dense!<br>"
			usr.Log_admin("([usr.key])[usr] turns non-dense")
			return
		if(usr.density == 0)
			src.icon_state = "turn non-dense off"
			usr.density = 1
			usr << "<font color = green>You are now dense!<br>"
			usr.Log_admin("([usr.key])[usr] turns dense")
			return

/obj/HUD/AdminButtons/AdminInvisibility
	icon_state = "turn invisible off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminInvisibility/Click()
	if(usr.Admin)
		if(usr.AdminInvis)
			src.icon_state = "turn invisible off"
			usr.icon = usr.AdminInvis
			usr.AdminInvis = null
			if(usr.Hair)
				usr.overlays += usr.Hair
			if(usr.Beard)
				usr.overlays += usr.Beard
			for(var/obj/Items/I in usr)
				if(I.suffix == "Equip")
					usr.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
			usr.Faction = usr.StoredFaction
			usr << "<font color = green>You can now be seen by others!<br>"
			usr.Log_admin("([usr.key])[usr] turns visible")
			return
		if(usr.AdminInvis == null)
			src.icon_state = "turn invisible on"
			usr.AdminInvis = usr.icon
			usr.icon = null
			usr.overlays = null
			if(usr.StoredFaction == null)
				usr.StoredFaction = usr.Faction
			usr.Faction = "Admin"
			for(var/obj/I in usr)
				usr.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
			usr << "<font color = green>You are now invisible!<br>"
			usr.Log_admin("([usr.key])[usr] turns invisible")
			return

/obj/HUD/AdminButtons/AdminServerOptions
	icon_state = "options off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminServerOptions/Click()
	if(usr.Admin)
		src.icon_state = "options on"
		var/list/menu = new()
		menu += "Read Admin Logs"
		menu += "Read Player Logs"
		menu += "Read/Edit Notes"
		menu += "Read/Edit Public Notes"
		menu += "Read Bugs/Player Reports"
		menu += "Read Map Logs"
		menu += "Read Errors"
		menu += "Edit Rules"
		menu += "Mob/Obj Count"
		menu += "Save Map"
		menu += "Load Map"
		menu += "Wipe Map"
		menu += "Set Server Status"
		menu += "Set Year"
		menu += "Set World Skill/Stat Cap"
		menu += "Set Gain Bonus"
		menu += "Force Repop"
		menu += "Check Players Contents"
		menu += "Cancel"
		var/Result = input("Choose a option?", "Choose", null) in menu
		if (Result == "Cancel")
			src.icon_state = "options off"
			return
		if(Result == "Read Admin Logs")
			usr<<browse(file("logs/Adminlog.html"))
			return
		if(Result == "Check Players Contents")
			var/list/menu2 = new()
			var/Mobs = list()
			for(var/mob/M in world)
				menu2 += "[M.name]"
				if(M.OrginalName)
					menu2 += "[M.OrginalName]"
				Mobs += M
			menu2 += "Cancel"
			var/Result2 = input("Who do you wish to Check?", "Choose", null) in menu2
			if (Result2 == "Cancel")
				src.icon_state = "options off"
				return
			if(Result2)
				var/mob/Found = null
				for(var/mob/M in Mobs)
					if(M.name == Result2)
						Found = M
					if(M.OrginalName == Result2)
						Found = M
				if(Found)
					for(var/obj/Items/I in Found)
						usr << "<font color = teal>[Found] has [I] [I.suffix]<br>"
					return
		if(Result == "Force Repop")
			Populate()
			usr << "<font color = teal>Repopulation of NPC sucessful, please remember that this happens every in game year automatically.<br>"
			usr.Log_admin("([usr.key])[usr] Forces a Repop.")
		if(Result == "Load Map")
			LoadMap()
			SaveMisc()
			src.icon_state = "options off"
			usr.Log_admin("([usr.key])[usr] loads the map.")
			return
		if(Result == "Save Map")
			SaveMap()
			SaveMisc()
			src.icon_state = "options off"
			usr.Log_admin("([usr.key])[usr] saves the map.")
			return
		if(Result == "Read Map Logs")
			usr << browse(file("logs/Maplog.html"))
			src.icon_state = "options off"
			return
		if(Result == "Read Errors")
			usr << browse(file("ErrorLog.txt"))
			src.icon_state = "options off"
			return
		if(Result == "Edit Rules")
			for(var/mob/M in Players)
				if(M.Admin)
					M << "([usr.key])[usr] is Editing the Rules...<br>"
			var/N = input("Please do not delete the current Rules when you are finished editing","Rules","[Rules]")as null|message
			if(!N)
				src.icon_state = "options off"
				for(var/mob/M in Players)
					if(M.Admin)
						M << "([usr.key])[usr] has Finished Editing the Rules...<br>"
				return
			else
				switch(alert("Are you sure you are done editing the Rules correctly?",,"Yes","No"))
					if("Yes")
						Rules = N
						src.icon_state = "options off"
						for(var/mob/M in Players)
							if(M.Admin)
								M << "[usr] has Finished Editing the Rules...<br>"
						return
					if("No")
						src.icon_state = "options off"
						for(var/mob/M in Players)
							if(M.Admin)
								M << "[usr] has Canceled Editing the Rules...<br>"
						return
		if(Result == "Read/Edit Public Notes")
			switch(alert("Read or Edit?",,"Read","Edit"))
				if("Read")
					var/html_doc="<head><title>Public Notes</title></head><body bgcolor=#000000 text=#FFFF00><center>[PublicNotes]"
					usr<<browse(html_doc,"window=Public Notes")
					src.icon_state = "options off"
					return
				if("Edit")
					for(var/mob/M in Players)
						if(M.Admin)
							M << "([usr.key])[usr] is Editing the Public Notes...<br>"
					var/N = input("Please do not delete the current Public Notes when you are finished editing","Public Notes","[PublicNotes]")as null|message
					if(!N)
						src.icon_state = "options off"
						for(var/mob/M in Players)
							if(M.Admin)
								M << "([usr.key])[usr] has Finished Editing the Public Notes...<br>"
						return
					else
						switch(alert("Are you sure you are done editing the Public Notes correctly?",,"Yes","No"))
							if("Yes")
								PublicNotes = N
								src.icon_state = "options off"
								for(var/mob/M in Players)
									if(M.Admin)
										M << "[usr] has Finished Editing the Public Notes...<br>"
								return
							if("No")
								src.icon_state = "options off"
								for(var/mob/M in Players)
									if(M.Admin)
										M << "[usr] has Canceled Editing the Public Notes...<br>"
								return
		if(Result == "Read/Edit Notes")
			switch(alert("Read or Edit?",,"Read","Edit"))
				if("Read")
					var/html_doc="<head><title>Notes</title></head><body bgcolor=#000000 text=#FFFF00><center>[Notes]"
					usr<<browse(html_doc,"window=Notes")
					src.icon_state = "options off"
					return
				if("Edit")
					for(var/mob/M in Players)
						if(M.Admin)
							M << "([usr.key])[usr] is Editing the Notes...<br>"
					var/N = input("Please do not delete the current Notes when you are finished editing","Notes","[Notes]")as null|message
					if(!N)
						src.icon_state = "options off"
						for(var/mob/M in Players)
							if(M.Admin)
								M << "([usr.key])[usr] has Finished Editing the Notes...<br>"
						return
					else
						switch(alert("Are you sure you are done editing the Notes correctly?",,"Yes","No"))
							if("Yes")
								Notes = N
								src.icon_state = "options off"
								for(var/mob/M in Players)
									if(M.Admin)
										M << "[usr] has Finished Editing the Notes...<br>"
								return
							if("No")
								src.icon_state = "options off"
								for(var/mob/M in Players)
									if(M.Admin)
										M << "[usr] has Canceled Editing the Notes...<br>"
								return
		if(Result == "Wipe Map")
			switch(alert("Wipe Map?",,"Yes","No"))
				if("No")
					src.icon_state = "options off"
					return
				if("Yes")
					if(usr.Admin >= 1)
						fdel("map/")
						world << "<font color = teal><font size = 4>Map has been wiped by [usr]!<br>"
						usr.Log_admin("([usr.key])[usr] Wipes the Map Save Files.")
						src.icon_state = "options off"
						return
					else
						usr << "<font color = teal>Your Admin Level is not High enough.<br>"
						return
		if(Result == "Set Gain Bonus")
			var/S = input("The default gain chance for players is 22% per hit on a mob. Raising this will increase the speed they gain by the percent you enter. Current Gains are [GainRate].")as null|num
			if(!S)
				src.icon_state = "options off"
				return
			if(S)
				GainRate = S
				src.icon_state = "options off"
				world << "<font color = teal>World Gain Bonus has been set to [S] by ([usr.key])[usr], Now saving map!<br>"
				SaveMap()
				SaveMisc()
				usr.Log_admin("([usr.key])[usr] sets the Bonus Gain to [S].")
				return
		if(Result == "Set World Skill/Stat Cap")
			var/S = input("This sets the games World Skill/Stat Cap, the Default is 11, at year 0.Current is [WorldSkillsCap].")as null|num
			if(!S)
				src.icon_state = "options off"
				return
			if(S)
				WorldSkillsCap = S
				WorldStrCap = S
				WorldAgilCap = S
				WorldEndCap = S
				WorldIntCap = S
				src.icon_state = "options off"
				world << "<font color = teal>World Skill/Stat Cap has been set to [S] by ([usr.key])[usr], Now saving map!<br>"
				SaveMap()
				SaveMisc()
				usr.Log_admin("([usr.key])[usr] sets the Worlds Skill Cap to [S].")
				return
		if(Result == "Set Year")
			var/S = input("This sets the game year.")as null|num
			if(!S)
				src.icon_state = "options off"
				return
			if(S)
				Year = S
				WorldSkillsCap = 0
				WorldStrCap = 0
				WorldAgilCap = 0
				WorldEndCap = 0
				WorldIntCap = 0
				WorldSkillsCap += 36 * S
				WorldStrCap += 36 * S
				WorldAgilCap += 36 * S
				WorldEndCap += 36 * S
				WorldIntCap += 36 * S
				src.icon_state = "options off"
				world << "<font color = teal>Year as been set to [Year] by ([usr.key])[usr], Now saving map!<br>"
				SaveMap()
				SaveMisc()
				usr.Log_admin("([usr.key])[usr] sets the Worlds Year to [Year].")
				return
		if(Result == "Set Server Status")
			var/S = input("This sets the status of the game on someones pager.")as null|text
			if(!S)
				src.icon_state = "options off"
				return
			if(S)
				world.status = S
				src.icon_state = "options off"
				world << "World status set to [S] by [usr]<br>"
				usr.Log_admin("([usr.key])[usr] sets the Server Status to [S]")
				return
		if(Result == "Mob/Obj Count")
			var/mobs = 0
			var/objs = 0
			for(var/mob/m in world)
				mobs += 1
			for(var/obj/I in world)
				objs += 1
			usr << "<font color = teal> There are [mobs] Mobs and [objs] Objs!<br>"
			src.icon_state = "options off"
			return
		if(Result == "Read Bugs/Player Reports")
			usr<<browse(file("logs/Reports.html"))
			src.icon_state = "options off"
			return
		if(Result == "Read Error Logs")
			usr<<browse(file("logs/Errorlog.html"))
			src.icon_state = "options off"
			return
		if(Result == "Read Player Logs")
			var/list/players = new()
			var/Mobs = list()
			for(var/mob/M in Players)
				players += "[M.name]"
				if(M.OrginalName)
					players += "[M.OrginalName]"
				Mobs += M
			players += "Cancel"
			var/Results = input("Read Which Log?", "Choose", null) in players
			if (Results == "Cancel")
				src.icon_state = "options off"
				return
			if(Results)
				var/mob/Found = null
				for(var/mob/M in Mobs)
					if(M.name == Results)
						Found = M
					if(M.OrginalName == Results)
						Found = M
				if(Found)
					usr<<browse(file("logs/Log([Found.key]).html"))
					src.icon_state = "options off"
				return

/obj/HUD/AdminButtons/AdminReboot
	icon_state = "reboot off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminReboot/Click()
	if(usr.Admin >= 1)
		src.icon_state = "reboot on"
		switch(alert("Choose Option",,"Reboot","Shut Down","Ruin All"))
			if("Ruin All")
				if(usr.Admin == 4)
					switch(alert("Ruin Server?",,"Yes","No"))
						if("No")
							src.icon_state = "reboot off"
							return
						if("Yes")
							RuinAll()
							return
				else
					usr << "<font color = red><b>Only the owner can Ruin a Server!<br>"
					return
			if("Reboot")
				switch(alert("Reboot Server?",,"Yes","No"))
					if("No")
						src.icon_state = "reboot off"
						return
					if("Yes")
						src.icon_state = "reboot off"
						world << "<font color=yellow><font size =10>Server will reboot in one minute!<br>"
						usr.Log_admin("([usr.key])[usr] reboots world")
						RebootProc()
						return
			if("Shut Down")
				switch(alert("Shut Server?",,"Yes","No"))
					if("No")
						src.icon_state = "reboot off"
						return
					if("Yes")
						src.icon_state = "reboot off"
						world << "<font color=yellow><font size =10>Server will now shut down - ([usr.key])[usr] - [usr.OrginalName]<br>"
						usr.Log_admin("([usr.key])[usr] shuts the world down")
						SaveMap()
						SaveMisc()
						del(world)
	else
		usr << "<font color = teal>Your Admin Level is not High enough.<br>"
		return

/obj/HUD/AdminButtons/AdminEditStory
	icon_state = "edit story off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminEditStory/Click()
	if(usr.Admin)
		src.icon_state = "edit story on"
		switch(alert("Edit Story?? Or Edit Ranks??",,"Story","Ranks"))
			if("Story")
				for(var/mob/M in Players)
					if(M.Admin)
						M << "([usr.key])[usr] is Editing the Story...<br>"
				var/N = input("Please do not delete the current Story when you are finished editing","Story","[Story]")as null|message
				if(!N)
					src.icon_state = "edit story off"
					for(var/mob/M in Players)
						if(M.Admin)
							M << "([usr.key])[usr] has Finished Editing the Story...<br>"
					return
				else
					switch(alert("Are you sure you are done editing the Story correctly?",,"Yes","No"))
						if("Yes")
							Story = N
							src.icon_state = "edit story off"
							for(var/mob/M in Players)
								if(M.Admin)
									M << "([usr.key])[usr] has Finished Editing the Story...<br>"
							return
						if("No")
							src.icon_state = "edit story off"
							for(var/mob/M in Players)
								if(M.Admin)
									M << "([usr.key])[usr] has Canceled Editing the Story...<br>"
							return
			if("Ranks")
				for(var/mob/M in Players)
					if(M.Admin)
						M << "([usr.key])[usr] is Editing the Ranks...<br>"
				var/N = input("Please do not delete the current Ranks when you are finished editing","Ranks","[Ranks]")as null|message
				if(!N)
					src.icon_state = "edit story off"
					for(var/mob/M in Players)
						if(M.Admin)
							M << "([usr.key])[usr] has Finished Editing the Ranks...<br>"
					return
				else
					switch(alert("Are you sure you are done editing the Ranks correctly?",,"Yes","No"))
						if("Yes")
							Ranks = N
							src.icon_state = "edit story off"
							for(var/mob/M in Players)
								if(M.Admin)
									M << "([usr.key])[usr] has Finished Editing the Ranks...<br>"
							return
						if("No")
							src.icon_state = "edit story off"
							for(var/mob/M in Players)
								if(M.Admin)
									M << "([usr.key])[usr] has Canceled Editing the Ranks...<br>"
							return
		return

/obj/HUD/AdminButtons/AdminReward
	icon_state = "max stats off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminReward/Click()
	if(usr.Admin)
		src.icon_state = "max stats on"
		var/list/rewards = new()
		rewards += "Reward Rank"
		rewards += "Reward Language"
		rewards += "Reward Stats"
		rewards += "Reward Race"
		rewards += "Cancel"
		var/Rewarded = input("Choose a Reward to give.", "Choose", null) in rewards
		if(Rewarded == "Reward Race")
			if(usr.Admin >= 3)
				var/list/menu = new()
				var/Mobs = list()
				for(var/mob/M in world)
					if(M.client)
						menu += "[M.name]"
						if(M.OrginalName)
							menu += "[M.OrginalName]"
						Mobs += M
				menu += "Cancel"
				var/Result = input("Who do you wish to Reward with a Race?", "Choose", null) in menu
				if (Result == "Cancel")
					src.icon_state = "max stats off"
					return
				if(Result)
					var/mob/Found = null
					for(var/mob/M in Mobs)
						if(M.name == Result)
							Found = M
						if(M.OrginalName == Result)
							Found = M
					if(Found)
						var/list/races = new()
						races += "Lizardmen"
						races += "Illithids"
						races += "Cancel"
						var/R = input("Choose a Race to give.", "Choose", null) in races
						if(R == "Cancel")
							return
						if(R == "Illithids")
							IllithidList += Found.key
							src.icon_state = "max stats off"
							usr.Log_admin("([usr.key])[usr] gives [Found] the ability to create Illithids.")
							usr << "<font color = teal>([Found.key])[Found] was added to the list of keys allowed to create Illithids. This will not save and only be available until a reboot.<br>"
							Found << "<font color = teal><b>([usr.key])[usr] gave you the ability to create Illithids. This will not save and only be available until a reboot.<br>"
						if(R == "Lizardmen")
							LizardmanList += Found.key
							src.icon_state = "max stats off"
							usr.Log_admin("([usr.key])[usr] gives [Found] the ability to create Lizardmen.")
							usr << "<font color = teal>([Found.key])[Found] was added to the list of keys allowed to create Lizardmen. This will not save and only be available until a reboot.<br>"
							Found << "<font color = teal><b>([usr.key])[usr] gave you the ability to create Lizardmen. This will not save and only be available until a reboot.<br>"
		if(Rewarded == "Reward Language")
			var/list/menu = new()
			var/Mobs = list()
			for(var/mob/M in world)
				if(M.client)
					menu += "[M.name]"
					if(M.OrginalName)
						menu += "[M.OrginalName]"
					Mobs += M
			menu += "Cancel"
			var/Result = input("Who do you wish to Reward with a Language?", "Choose", null) in menu
			if (Result == "Cancel")
				src.icon_state = "max stats off"
				return
			if(Result)
				var/mob/Found = null
				for(var/mob/M in Mobs)
					if(M.name == Result)
						Found = M
					if(M.OrginalName == Result)
						Found = M
				if(Found)
					var/Langs = list()
					Langs += typesof(/obj/Misc/Languages/)
					var/list/menu2 = new()
					for(var/O in Langs)
						menu2 += O
					menu2 += "Cancel"
					var/Result2 = input("Choose a Language to Give", "Choose", null) in menu2
					if(Result2 == "Cancel")
						return
					if(Result2)
						var/obj/I = new Result2()
						if(Found.LangKnow == null)
							Found.LangKnow = list()
						for(var/obj/L in Found.LangKnow)
							if(I.type == L.type)
								del(L)
								break
						I.SpeakPercent = 100
						I.WritePercent = 100
						Found.LangKnow += I
						Found.CurrentLanguage = I
						Found << "<font color = purple>[usr] gave you the [I] language!<br>"
						usr.Log_admin("([usr.key])[usr] gives [Found] the [I] language.")
						src.icon_state = "max stats off"
						return
		if(Rewarded == "Reward Rank")
			if(usr.Admin >= 1)
				var/list/menu = new()
				menu += "BlackSmith"
				menu += "King/Queen"
				menu += "Weapon Master"
				menu += "Diplomat"
				menu += "Human Empire Priest"
				menu += "Cancel"
				var/Result = input("Choose a Rank to give.", "Choose", null) in menu
				if(Result)
					var/list/menu2 = new()
					var/Mobs = list()
					for(var/mob/M in world)
						menu2 += "[M.name]"
						if(M.OrginalName)
							menu2 += "[M.OrginalName]"
						Mobs += M
					menu2 += "Cancel"
					var/Result2 = input("Who do you wish to Rank as [Result]?", "Choose", null) in menu2
					if (Result2 == "Cancel")
						src.icon_state = "max stats off"
						return
					if(Result2)
						var/mob/Found = null
						for(var/mob/M in Mobs)
							if(M.name == Result2)
								Found = M
							if(M.OrginalName == Result2)
								Found = M
						if(Found)
							Found.GiveRank(Result)
							src.icon_state = "max stats off"
							usr.Log_admin("([usr.key])[usr] gives [Found] the [Result] Rank.")
					if(Result2 == "Cancel")
						src.icon_state = "max stats off"
						return
		if(Rewarded == "Reward Stats")
			switch(alert("Manually Reward Players or Auto-Reward?",,"Manual","Auto"))
				if("Auto")
					for(var/mob/M in Players)
						if(M.RPpoints >= 1)
							while(M.RPpoints >= 1)
								M.RPpoints -= 1
								M.Strength += M.StrengthMulti
								M.WeightMax += 1
								if(M.Strength >= M.StrengthMax)
									M.Strength = M.StrengthMax
								M.Endurance += M.EnduranceMulti
								if(M.Endurance >= M.EnduranceMax)
									M.Endurance = M.EnduranceMax
								M.Agility += M.AgilityMulti
								if(M.Agility >= M.AgilityMax)
									M.Agility = M.AgilityMax
								M.Intelligence += M.IntelligenceMulti
								if(M.Intelligence >= M.IntelligenceMax)
									M.Intelligence = M.IntelligenceMax
					usr << "<font color = teal>Stats have been rewarded based on RP Points.<br>"
					return
				if("Manual")
					var/list/menu = new()
					var/Mobs = list()
					for(var/mob/M in Players)
						menu += "[M.name]"
						if(M.OrginalName)
							menu += "[M.OrginalName]"
						Mobs += M
					menu += "Cancel"
					var/Result = input("Who do you wish to Reward?", "Choose", null) in menu
					if (Result == "Cancel")
						src.icon_state = "max stats off"
						return
					if(Result)
						var/mob/Found = null
						for(var/mob/M in Mobs)
							if(M.name == Result)
								Found = M
							if(M.OrginalName == Result)
								Found = M
						if(Found)
							usr << "<font color = teal>[Found] has [Found.Strength] Strength<br>"
							usr << "<font color = teal>[Found] has [Found.Endurance] Endurance<br>"
							usr << "<font color = teal>[Found] has [Found.Agility] Agility<br>"
							usr << "<font color = teal>[Found] has [Found.Intelligence] Intelligence<br>"
							usr << "<font color = teal>[Found] has [Found.RPpoints] RP Points<br>"
							var/S = input("Enter the ammount of Strength you want to reward [Found], this number will be times by their Strength Mod then added.")as null|num
							if(S)
								Found.Strength += Found.StrengthMulti * S
								Found.WeightMax += S * 2
								Found.RPpoints -= S / 4
								if(Found.Strength >= Found.StrengthMax)
									Found.Strength = Found.StrengthMax
							var/E = input("Enter the ammount of Endurance you want to reward [Found], this number will be times by their Endurance Mod then added.")as null|num
							if(E)
								Found.Endurance += Found.EnduranceMulti * E
								Found.RPpoints -= S / 4
								if(Found.Endurance >= Found.EnduranceMax)
									Found.Endurance = Found.EnduranceMax
							var/A = input("Enter the ammount of Agility you want to reward [Found], this number will be times by their Agility Mod then added.")as null|num
							if(A)
								Found.Agility += Found.AgilityMulti * A
								Found.RPpoints -= S / 4
								if(Found.Agility >= Found.AgilityMax)
									Found.Agility = Found.AgilityMax
							var/I = input("Enter the ammount of Intelligence you want to reward [Found], this number will be times by their Intelligence Mod then added.")as null|num
							if(I)
								Found.Intelligence += Found.IntelligenceMulti * I
								Found.RPpoints -= S / 4
								if(Found.Intelligence >= Found.IntelligenceMax)
									Found.Intelligence = Found.IntelligenceMax
							if(S)
								Found.StrCap += Found.StrengthMulti * S
							if(E)
								Found.EndCap += Found.EnduranceMulti * E
							if(A)
								Found.AgilCap += Found.AgilityMulti * A
							if(I)
								Found.IntCap += Found.IntelligenceMulti * I
							if(Found.RPpoints <= 0)
								Found.RPpoints = 0
							usr.Log_admin("([usr.key])[usr] Rewards ([Found.key])[Found] with [S] Strength, [E] Endurance, [I] Intelligence and [A] Agility")
	else
		usr << "<font color = teal>Your Admin Level is not High enough.<br>"
		return

/obj/HUD/AdminButtons/AdminHeal
	icon_state = "heal off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminHeal/Click()
	if(usr.Admin)
		src.icon_state = "heal on"
		switch(alert("Revive a Player? Or Heal a Player?",,"Revive","Heal"))
			if("Heal")
				var/list/menu = new()
				var/Mobs = list()
				for(var/mob/M in world)
					menu += "[M.name]"
					if(M.OrginalName)
						menu += "[M.OrginalName]"
					Mobs += M
				menu += "Cancel"
				var/Result = input("Who do you wish to Heal?", "Choose", null) in menu
				if (Result == "Cancel")
					src.icon_state = "heal off"
					return
				if(Result)
					var/mob/Found = null
					for(var/mob/M in Mobs)
						if(M.name == Result)
							Found = M
						if(M.OrginalName == Result)
							Found = M
					if(Found)
						src.icon_state = "heal off"
						Found.Heal()
						Found << "<font color = blue>[usr] Heals you!<br>"
						usr << "<font color = blue>You Heal [Found]!<br>"
						usr.Log_admin("([usr.key])[usr] heals [Found]")
						return
			if("Revive")
				var/list/menu = new()
				var/Mobs = list()
				for(var/mob/M in Players)
					if(M.Dead && M.client)
						menu += "[M.name]"
						if(M.OrginalName)
							menu += "[M.OrginalName]"
						Mobs += M
				menu += "Cancel"
				var/Result = input("Who do you wish to Revive?", "Choose", null) in menu
				if (Result == "Cancel")
					src.icon_state = "heal off"
					return
				if(Result)
					var/mob/Found = null
					for(var/mob/M in Mobs)
						if(M.name == Result)
							Found = M
						if(M.OrginalName == Result)
							Found = M
					if(Found)
						var/Bod = 0
						for(var/obj/Items/Body/B in world)
							if(B.Owner == Found.name)
								Found.GoodRevive(B)
								Found << "<font color = blue>A mysterious force fills your dead body, as it does you begin to feel life flow through your veins once more, it seems the gods have blessed you with new life!<br>"
								usr << "<font color = blue>You Revived [Found]!<br>"
								usr.Log_admin("([usr.key])[usr] revive [Found]")
								Bod = 1
								del(B)
						if(Bod == 0)
							usr << "<font color = red>[Found] has no Body to Revive!<br>"
							switch(alert("Make a new body for [Found]?",,"Yes","No"))
								if("Yes")
									var/obj/Items/Body/B = new
									B.loc = usr.loc
									B.icon = Found.DeadIcon
									B.Owner = Found.name
									Found.GoodRevive(B)
							usr.Log_admin("([usr.key])[usr] tried to revive [Found]")
						src.icon_state = "heal off"
						return

/obj/HUD/AdminButtons/AdminGiveAdmin
	icon_state = "give admin off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminGiveAdmin/Click()
	if(usr.Admin >= 3)
		src.icon_state = "give admin on"
		switch(alert("Give or Remove Admin?",,"Give","Remove"))
			if("Give")
				var/T = input("Type the key of the person you wish to give Admin to")as null|text
				if(!T)
					src.icon_state = "give admin off"
					return
				if(T in Admins)
					usr << "<font color = teal><b>They already have Admin!<br>"
					return
				for(var/mob/M in Players)
					if(T == M.key && M.client)
						var/N = input("Which Level should this Admin be? Level 1 are Basics, Level 3 are all Commands.")as null|num
						if(N >= 3)
							N = 3
						var/obj/Misc/Admins/Ad = new
						Ad.name = M.key
						Ad.Value = N
						Admins += Ad
						M.Admin = N
						var/obj/HUD/AdminButtons/AdminButton/Z = new
						M.client.screen += Z
						M << "<font color = teal><b><font size = 4>([usr.key])[usr] has given you Admin!<br>"
						usr << "<font color = teal>You gave [T] Admin level [N]<br>"
						var/admin_sav = "players/admins.sav"
						var/savefile/A = new(admin_sav)
						A["Admins"] << Admins
						src.icon_state = "give admin off"
						usr.Log_admin("([usr.key])[usr] gives ([M.key]) [M] Admin level [N]")
						return
				src.icon_state = "give admin off"
				return
			if("Remove")
				var/T = input("Type the key of the person you wish to remove Admin from")as null|text
				if(!T)
					src.icon_state = "give admin off"
					return
				if(T == "Ginseng")
					usr << "<font color = teal><b><font size = 4>You can -NOT- Remove the Owners Admin....<br>"
					for(var/mob/M in world)
						if(M.key == "Ginseng")
							M << "<font color = teal><b><font size = 6>[usr] Tried to Remove your Admin!<br>"
					return
				if(T == "Ginseng")
					usr << "<font color = teal><b><font size = 4>You can -NOT- Remove that Admins powers....<br>"
					for(var/mob/M in world)
						if(M.key == "Ginseng")
							M << "<font color = teal><b><font size = 6>[usr] Tried to Remove your Admin!<br>"
					return
				world << "<font color = teal><b><font size = 4>[T] was removed as an Admin!<br>"
				for(var/obj/Z in Admins)
					if(Z.name == T)
						del(Z)
				for(var/mob/M in Players)
					if(T == M.key && M.client)
						M.Admin = 0
						M.Save()
						usr.Log_admin("([usr.key])[usr] removes [M] as Admin")
						del(M)
						src.icon_state = "give admin off"
				src.icon_state = "give admin off"
				return
	else
		usr << "<font color = teal>Your Admin Level is not High enough.<br>"
		return

/obj/HUD/AdminButtons/AdminAnnounce
	icon_state = "announce off"
	Type = "AdminHuds"
	layer = 100

/obj/HUD/AdminButtons/AdminAnnounce/Click()
	if(usr.Admin)
		switch(alert("Normal Announce, or Role Play Announce??",,"Normal","RolePlay"))
			if("RolePlay")
				var/T = input("Announce")as null|message
				if(!T)
					return
				world << "<font color = yellow><font size = 3><center>[T]"
				usr.Log_admin("([usr.key])[usr] role play announces [T]")
			if("Normal")
				var/T = input("Announce")as null|message
				if(!T)
					return
				world << "<font color = teal><font size = 3><center>.:([usr.key]) [usr] Announces:.<br> [T]"
				usr.Log_admin("([usr.key])[usr] announce [T]")

/obj/HUD/AdminButtons/AdminButton
	icon_state = "admin button off"
	Type = "AdminButton"
	screen_loc = "1,2"
	layer = 10

/obj/HUD/AdminButtons/AdminButton/Click()
	if(usr.Admin)
		if(usr.InvenUp)
			usr << "<b>Close your inventory first!<br>"
			return
		if(src.icon_state == "admin button off")
			usr.ResetButtons()
			if(usr.Function != "Burn")
				usr.Function = "AdminButton"
			src.icon_state = "admin button on"
			usr.CreateAdminMenu()
			return
		if(src.icon_state == "admin button on")
			usr.ResetButtons()
			if(usr.Function != "Burn")
				usr.Function = null
			src.icon_state = "admin button off"
			usr.Delete("AdminHuds","AdminHuds")
			return
