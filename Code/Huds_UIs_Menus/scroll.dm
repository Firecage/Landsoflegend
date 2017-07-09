/obj/HUD/Menus/Scroll
	layer = 100
	name = ""

/obj/HUD/Menus/Scroll/ScrollTrans
	icon = 'books.dmi'
	icon_state = "transparent"

/obj/HUD/Menus/Scroll/ScrollLeft
	icon = 'books.dmi'
	icon_state = "Left"

/obj/HUD/Menus/Scroll/ScrollLeft/Click()
	if(src.Type == "Book" && usr.UsingBook)
		var/obj/Book = usr.UsingBook
		for(var/obj/Misc/Spells/S in usr.client.screen)
			usr.client.screen -= S
			Book.FuturePages += S
		for(var/obj/Misc/SpellText/T in usr.client.screen)
			usr.client.screen -= T
		var/Num = 0
		var/X = 9
		var/Y = 14
		for(var/obj/Misc/Spells/S in Book.PreviousPages)
			if(Num != 4)
				if(Y != 12)
					Num += 1
					S.screen_loc = "[X],[Y]"
					usr.client.screen += S
					var/obj/Misc/SpellText/T = new
					T.icon_state = "[S.icon_state] text"
					T.screen_loc = "[X - 1],[Y]"
					usr.client.screen += T
					Book.PreviousPages -= S
					Y -= 1
				else
					Y = 14
					X = 11
					Num += 1
					S.screen_loc = "[X],[Y]"
					usr.client.screen += S
					var/obj/Misc/SpellText/T = new
					T.icon_state = "[S.icon_state] text"
					T.screen_loc = "[X - 1],[Y]"
					usr.client.screen += T
					Book.PreviousPages -= S
					Y -= 1
			else
				return

/obj/HUD/Menus/Scroll/ScrollRight
	icon = 'books.dmi'
	icon_state = "Right"

/obj/HUD/Menus/Scroll/ScrollRight/Click()
	if(src.Type == "Book" && usr.UsingBook)
		var/obj/Book = usr.UsingBook
		for(var/obj/Misc/Spells/S in usr.client.screen)
			usr.client.screen -= S
			Book.PreviousPages += S
		for(var/obj/Misc/SpellText/T in usr.client.screen)
			usr.client.screen -= T
		var/Num = 0
		var/X = 9
		var/Y = 14
		for(var/obj/Misc/Spells/S in Book.FuturePages)
			if(Num != 4)
				if(Y != 12)
					Num += 1
					S.screen_loc = "[X],[Y]"
					usr.client.screen += S
					var/obj/Misc/SpellText/T = new
					T.icon_state = "[S.icon_state] text"
					T.screen_loc = "[X - 1],[Y]"
					usr.client.screen += T
					Book.FuturePages -= S
					Y -= 1
				else
					Y = 14
					X = 11
					Num += 1
					S.screen_loc = "[X],[Y]"
					usr.client.screen += S
					var/obj/Misc/SpellText/T = new
					T.icon_state = "[S.icon_state] text"
					T.screen_loc = "[X - 1],[Y]"
					usr.client.screen += T
					Book.FuturePages -= S
					Y -= 1
			else
				return

/obj/HUD/Menus/Scroll/Scroll
	icon = 'books.dmi'
	icon_state = "Scroll"

/obj/HUD/Menus/Scroll/ScrollRight2
	icon = 'books.dmi'
	icon_state = "ScrollRight"

/obj/HUD/Menus/Scroll/ScrollLeft2
	icon = 'books.dmi'
	icon_state = "ScrollLeft"

/obj/HUD/Menus/Scroll/ScrollMiddle
	icon_state = "Middle"
	icon = 'books.dmi'
