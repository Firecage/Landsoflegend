/obj/HUD/LoadGame
	icon = 'menu.dmi'
	icon_state = "Load"

/obj/HUD/LoadGame/Click()
	if(usr in range(8,src))
		if(usr.Ready == 0)
			var/player_sav = "players/[usr.ckey].sav"
			if(length(file(player_sav)))
				usr << sound(null)
				usr.MusicProc()
				usr.LoggedIn = 1
				usr.Load()
				if(usr.Admin)
					var/html_doc="<head><title>Notes</title></head><body bgcolor=#000000 text=#FFFF00><center>[Notes]"
					usr<<browse(html_doc,"window=Notes")
				if(usr)
					if(usr.x == 0)
						if(usr.y == 0)
							if(usr.z == 0)
								usr.loc = locate(1,1,1)
								usr << "<font color = teal>Possible Save Error, please report to an Admin.<br>"
			else
				usr << "<b>You have no save!<br>"
				return
		else
			usr << "<font color = teal>Please relog if you wish to load a game now.<br>"
			return

/obj/HUD/NewGame
	icon = 'menu.dmi'
	icon_state = "New"

/obj/HUD/NewGame/Click()
	if(usr in range(8,src))
		usr.Ready = 1
		switch(alert("Start a new game?",,"Yes","No"))
			if("No")
				usr.Ready = 0
				return
			if("Yes")
				usr.CreateRaceSelection()
				usr.loc = locate(28,91,1)
				alert("Choose a race by clicking on a face portrait! Once your happy with your selection choose a Gender and click Accept!")
/**
			usr << "<font color = green>You arrive in Holthormus and decide to seek shelter in the Chapel of Order<br>"
*//