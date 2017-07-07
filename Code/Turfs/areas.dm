/area/
	luminosity = 0

/area/MapEdge/
	name = "Dense"

/area/Cave/
	name = "Cave"
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			var/Exit = prob(0.05)
			if(M.Type != "HatesLight")
				return(1)
			if(M.Type == "HatesLight" && Night == 1 && Exit == 1)
				return(1)
		else
			return(1)

/area/DragonDen/
	name = "Dense"
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			if(M.Race != "Dragon")
				return(1)
		else
			return(1)

/area/SpiderInfest/
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			var/Exit = prob(0.1)
			if(M.Race != "GiantSpider")
				return(1)
			if(M.Race == "GiantSpider" && Exit != 1)
				return
			if(M.Race == "GiantSpider" && Exit == 1)
				return(1)
		else
			return(1)

/area/Haunted/
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			var/Exit = prob(0.1)
			if(M.Race != "Skeleton")
				return(1)
			if(M.Race == "Skeleton" && Exit != 1)
				return
			if(M.Race == "Skeleton" && Exit == 1)
				return(1)
			if(M.Owner)
				return(1)
		else
			return(1)

/area/Shop/
	Exited(atom/a)
		if(ismob(a))
			var/mob/M = a
			var/Attack = 0
			for(var/mob/Z in view(7,M))
				if(Z.Type == "Merchant")
					for(var/obj/I in M)
						if(I in Z.Selling)
							Attack = 1
					if(M.Pull)
						if(isobj(M.Pull))
							var/obj/O = M.Pull
							for(var/obj/I in O)
								if(I in Z.Selling)
									Attack = 1
					if(Attack)
						view(7,Z) << "<font color = yellow>[Z] notices [M] stealing and alerts the guards!<br>"
						for(var/mob/G in hearers(7,M))
							if(G.Faction == Z.Faction)
								if(G.Target)
									if(ismob(G.Target))
										var/mob/T = G.Target
										if(T.client == null)
											G.Target = null
								if(G.Target == null)
									G.Target = M
								if(M.name != "Unknown")
									G.HateList += M.name
			return(1)
		else
			return(1)

/area/Swamp/
	Type = "SwampArea"
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			if(M.Type != src.Type)
				return(1)
			else
				return
		else
			return(1)

/area/Desert/
	Type = "DesertArea"
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			if(M.Type != src.Type)
				return(1)
			else
				return
		else
			return(1)

/area/SnowArea/
	Type = "SnowArea"
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			if(M.Type != src.Type)
				return(1)
			else
				return
		else
			return(1)

/area/BanditCamp/
	Type = "Bandits"
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			var/Leave = prob(1)
			if(M.Type != src.Type && Leave != 1)
				return(1)
			else
				return
		else
			return(1)

/area/Town/
	Type = "Town"
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			if(M.Type != src.Type)
				return(1)
			else
				return
		else
			return(1)

/area/DeepWater/
	Enter(atom/a)
		if(ismob(a))
			var/mob/M = a
			if(M.client == null)
				return
			else
				return(1)
		else
			return(1)