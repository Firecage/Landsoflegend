/obj/Items/Altars
	icon = 'altars.dmi'
	suffix = "Stuck"

/obj/Items/Altars/Altar_of_Wisdom
	icon_state = "wisdom altar"

/obj/Items/Altars/Altar_of_Crafts
	icon_state = "crafts altar"

/obj/Items/Altars/Altar_of_Harvest
	icon_state = "harvest altar"

/obj/Items/Altars/Altar_of_Beasts
	icon_state = "beast altar"

/obj/Items/Altars/Altar_of_Order
	icon_state = "order altar"

/obj/Items/Altars/Altar_of_Death
	icon_state = "death altar"

/obj/Items/Altars/Altar_of_Blood
	icon_state = "blood altar"

/obj/Items/Altars/Well_of_Destruction
	icon_state = "well of destruction"
	luminosity = 5

/obj/Items/Altars/Well_of_Destruction/Click()
	if(usr.Function == "Interact")
		if(src in range(1,usr))
			if(usr.Fainted)
				usr << "<font color =red>You have fainted and cant do that!<br>"
				return
			if(usr.Stunned)
				usr << "<font color =red>You are stunned and cant do that!<br>"
				return
			if(usr.Weapon)
				var/obj/I = usr.Weapon
				if(I.Type == "Torch")
					view(usr) << "<font color = yellow>[usr] places the Torch into the Well of Destruction!<br>"
					usr.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					I.CarryState = "torch lit"
					I.EquipState = "torch lit equip"
					I.icon_state = I.EquipState
					I.Type = "Torch Lit"
					I.LightProc(usr)
					usr.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
					return
			if(usr.Weapon2)
				var/obj/I = usr.Weapon2
				if(I.Type == "Torch")
					view(usr) << "<font color = yellow>[usr] places the Torch into the Well of Destruction!<br>"
					usr.overlays-=image(I.icon,"[I.icon_state] left",I.ItemLayer)
					I.CarryState = "torch lit"
					I.EquipState = "torch lit equip"
					I.icon_state = I.EquipState
					I.Type = "Torch Lit"
					I.LightProc(usr)
					usr.overlays+=image(I.icon,"[I.icon_state] left",I.ItemLayer)
					return
