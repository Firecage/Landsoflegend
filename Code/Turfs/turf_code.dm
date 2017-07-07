/turf/
	luminosity = 1
	icon = 'terrain.dmi'
/*
/turf/DblClick()
	if(src.density == 0 && usr.Ref)
		if(src in range(1,usr))
			var/obj/O = usr.Ref
			var/MakeSpill = 0
			if(O.ObjectTag == "Berry" && O.Type == "Dye/Ink/Food")
				MakeSpill = 1
			if(MakeSpill)
				var/obj/Misc/LiquidSplatter/LS = new
				LS.Red = O.Red
				LS.Green = O.Green
				LS.Blue = O.Blue
				LS.icon += rgb(LS.Red,LS.Green,LS.Blue)
				LS.name = "[O.ObjectTag] Splatter"
				LS.loc = locate(src.x,src.y,src.z)
				view(usr) << "<font color = yellow>[usr] empties the [O] onto the [src].<br>"
				O.ObjectTag = null
				O.Type = null
				O.overlays = null
				O.Red = 0
				O.Green = 0
				O.Blue = 0
				if(usr.InvenUp)
					usr.DeleteInventoryMenu()
					usr.CreateInventory()
				return
*/
/turf/proc/Regrow()
	spawn(rand(300,600))
		if(src.name == "Dead Grass")
			src.name = "Grass"
			src.icon_state = "grass"