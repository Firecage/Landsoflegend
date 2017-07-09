/obj/HUD/Menus/Inventory

/obj/HUD/Menus/Inventory/BottomRight
	icon_state = "BR"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/BottomLeft
	icon_state = "BL"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/TopRight
	icon_state = "TR"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/TopLeft
	icon_state = "TL"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/TopMiddle
	icon_state = "TM"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/BottomMiddle
	icon_state = "BM"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/LeftMiddle
	icon_state = "LM"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/RightMiddle
	icon_state = "RM"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/Middle
	icon_state = "M"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/CloseMasonary
	icon_state = "close"
	Type = "Close"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/CloseMasonary/Click()
	usr.Delete("Masonary","Masonary")
	usr.Ref = null
	for(var/obj/I in usr.client.screen)
		if(I in usr.CreateList)
			usr.client.screen -= I
	del(src)

/obj/HUD/Menus/Inventory/CloseCarpentry
	icon_state = "close"
	Type = "Close"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/CloseCarpentry/Click()
	usr.Delete("Carpentry","Carpentry")
	usr.Ref = null
	for(var/obj/I in usr.client.screen)
		if(I in usr.CreateList)
			usr.client.screen -= I
	del(src)

/obj/HUD/Menus/Inventory/CloseBone
	icon_state = "close"
	Type = "Close"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/CloseBone/Click()
	usr.Delete("Bone","Bone")
	usr.Ref = null
	for(var/obj/I in usr.client.screen)
		if(I in usr.CreateList)
			usr.client.screen -= I
	del(src)

/obj/HUD/Menus/Inventory/CloseLeather
	icon_state = "close"
	Type = "Close"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/CloseLeather/Click()
	usr.Delete("Leather","Leather")
	usr.Ref = null
	for(var/obj/I in usr.client.screen)
		if(I in usr.CreateList)
			usr.client.screen -= I
	del(src)

/obj/HUD/Menus/Inventory/CloseForgeing
	icon_state = "close"
	Type = "Close"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/CloseForgeing/Click()
	usr.Delete("Forge","Forge")
	usr.Ref = null
	for(var/obj/I in usr.client.screen)
		if(I in usr.CreateList)
			usr.client.screen -= I
	del(src)

/obj/HUD/Menus/Inventory/Close
	icon_state = "close"
	Type = "Close"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/Close/Click()
	if(usr.Container)
		var/obj/C = usr.Container
		if(C.ClosedState)
			C.icon_state = C.ClosedState
			C.overlays = null
			for(var/obj/Items/Misc/Lock/L in C)
				if(L.suffix == "Fitted")
					L.icon_state = "[L.Material] lock fitted chest"
					C.overlays += L
	if(usr.Function == "Transfer")
		usr.ResetButtons()
	usr.DeleteInventoryMenu()

/obj/HUD/Menus/Inventory/Transfer
	icon_state = "trade button off"
	Type = "Transfer"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/Transfer/Click()
	if(usr.Sleeping || usr.Dead || usr.Fainted || usr.Job)
		usr << "<font color = red>You are busy doing somthing else!<br>"
		return
	if(usr.Dead)
		usr << "<b>Cant do that while dead!<br>"
		return
	if(src.icon_state == "trade button off")
		usr.Function = "Transfer"
		src.icon_state = "trade button on"
		usr << "Click an item to transfer it between you and a container!<br>"
		return
	if(src.icon_state == "trade button on")
		usr.Function = null
		src.icon_state = "trade button off"
		return

/obj/HUD/Menus/Inventory/Eat
	icon_state = "eat button off"
	Type = "Eat"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/Eat/Click()
	if(usr.Sleeping || usr.Dead || usr.Fainted || usr.Job)
		usr << "<font color = red>You are busy doing somthing else!<br>"
		return
	if(usr.Dead)
		usr << "<b>Cant do that while dead!<br>"
		return
	if(usr.CanEat == 0)
		usr << "<font color =red>You cant eat anything!<br>"
		return
	if(src.icon_state == "eat button off")
		usr.Function = "Eat"
		src.icon_state = "eat button on"
		usr << "Click food to eat it!<br>"
		return
	if(src.icon_state == "eat button on")
		usr.Function = null
		src.icon_state = "eat button off"
		return

/obj/HUD/Menus/Inventory/Equip
	icon_state = "equip button off"
	Type = "Equip"
	icon = 'HUD.dmi'

/obj/HUD/Menus/Inventory/Equip/Click()
	if(usr.Sleeping || usr.Dead || usr.Fainted || usr.Job)
		usr << "<font color = red>You are busy doing somthing else!<br>"
		return
	if(usr.Dead)
		usr << "<b>Cant do that while dead!<br>"
		return
	if(src.icon_state == "equip button off")
		usr.ResetButtons()
		usr.Function = "Equip"
		src.icon_state = "equip button on"
		return
	if(src.icon_state == "equip button on")
		usr.Function = null
		src.icon_state = "equip button off"
		return

/obj/HUD/Menus/Inventory/Slot
	icon_state = "inv slot"
	icon = 'HUD.dmi'
