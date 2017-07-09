/obj/proc/ChaosGate()
	spawn(rand(5000,10000))
		if(src)
			var/mob/NPC/Evil/Chaos/Chaos_Entity/C = new
			C.loc = src.loc
			view(src) << "<font color = purple>The [src] swirls and crackles with chaotic energy, suddenly the [src] flares violently and expells a strange dark mist of pure energy!<br>"
			ChaosGate()

/obj/proc/GateFunctions(var/J)
	if(J == "Open")
		for(var/obj/Items/Furniture/Doors/IronGate/G in range(1,src))
			if(G.Type != "Busy")
				G.Type = "Busy"
				G.GateFunctions("Open")
				flick("gate opening",G)
				spawn(12)
					if(G)
						G.icon_state = "gate open"
						G.density = 0
						G.Type = null
		spawn(100)
			for(var/obj/Items/Furniture/Doors/IronGate/G in range(1,src))
				if(G.Type != "Busy" && G.icon_state != "gate")
					G.Type = "Busy"
					G.GateFunctions("Close")
					flick("gate closing",G)
					spawn(12)
						if(G)
							G.icon_state = "gate"
							G.density = 1
							G.Type = null
		return
	if(J == "Close")
		for(var/obj/Items/Furniture/Doors/IronGate/G in range(1,src))
			if(G.Type != "Busy")
				G.Type = "Busy"
				G.GateFunctions("Close")
				flick("gate closing",G)
				spawn(12)
					if(G)
						G.icon_state = "gate"
						G.density = 1
						G.Type = null
		return

/obj/proc/ForgeBurn(var/Time)
	spawn(Time)
		if(src)
			view(src) << "<font color = yellow>The [src] begins to run out of fuel!<br>"
			src.desc = "This Stone Forge seems to be very low on fuel!<br>"
			spawn(500)
				if(src)
					var/Burn = 0
					for(var/obj/Items/Resources/Coal/C in src)
						Burn += 2000
						del(C)
					for(var/obj/Items/Resources/Charcoal/Ch in src)
						Burn += 500
						del(Ch)
					if(Burn >= 1)
						src.ForgeBurn(Burn)
					else
						view(src) << "<font color = red>The [src] burns out!<br>"
						src.desc = "This Stone Forge seems to have been lit recently, but ran out of fuel!<br>"
						src.icon_state = "forge"
						src.Type = "Not Lit"
						return

/obj/proc/RangedMove()
	if(src)
		if(src.Target)
			var/turf/T = src.Target
			step_towards(src,T)
			for(var/atom/A in range(0,src))
				if(ismob(A) && A != src.Owner)
					var/mob/M = A
					if(M.Dead == 0)
						var/mob/Own = src.Owner
						if(M.Target == null)
							M.Target = Own
						if(M.Weapon)
							var/obj/S = M.Weapon
							if(S.Type == "Shield")
								var/Block = 0 + M.Agility / 3 + M.ShieldSkill / 3
								var/Blocks = prob(Block)
								if(Blocks)
									view(6,src) << "<font color = red>[M] blocks the [src] using their [S]!<br>"
									Own.CombatSkillTransfer(M)
									if(M && M.Target == null)
										M.Target = src.Owner
									del(src)
									return
						if(M.Weapon2)
							var/obj/S = M.Weapon2
							if(S.Type == "Shield")
								var/Block = 0 + M.Agility / 3 + M.ShieldSkill / 3
								var/Blocks = prob(Block)
								if(Blocks)
									view(6,src) << "<font color = red>[M] blocks the [src] using their [S]!<br>"
									Own.CombatSkillTransfer(M)
									if(M && M.Target == null)
										M.Target = src.Owner
									del(src)
									return
						var/Dodge = 0 + M.Agility / 2
						var/DodgeMath = 0
						for(var/obj/Items/Armour/Ar in M)
							if(Ar.suffix == "Equip")
								DodgeMath += Ar.Weight / 3
						if(M.Strength <= DodgeMath)
							Dodge -= DodgeMath
						var/Dodges = prob(Dodge)
						if(Dodges && M.Fainted == 0 && M.Stunned == 0)
							view(6,src) << "<font color = red>[M] dodges the [src]!<br>"
							src.suffix = null
							src.Target = null
							Own.CombatSkillTransfer(M)
							if(M && M.Target == null)
								M.Target = src.Owner
							src.Owner = null
							return
						var/Bat = 0 + M.CurrentSkillLevel / 5 + M.Agility / 2.5
						var/BatMath = 0
						for(var/obj/Items/Armour/Ar in M)
							if(Ar.suffix == "Equip")
								BatMath += Ar.Weight / 3
						if(M.Strength <= BatMath)
							Bat -= BatMath
						var/Bats = prob(Bat)
						if(Bats && M.Fainted == 0 && M.Stunned == 0)
							view(6,src) << "<font color = red>[M] bats [src] away!<br>"
							src.suffix = null
							src.Target = null
							Own.CombatSkillTransfer(M)
							if(M && M.Target == null)
								M.Target = src.Owner
							src.Owner = null
							return
						var/Miss = 60 - Own.RangedSkill * 2
						if(Miss <= 5)
							Miss = 5
						var/Misses = prob(Miss)
						if(Misses)
							view(6,src) << "<font color = red>[src] misses its target!<br>"
							src.suffix = null
							src.Target = null
							Own.CombatSkillTransfer(M)
							if(M && M.Target == null)
								M.Target = src.Owner
							src.Owner = null
							return
						view(6,src) << "<font color = red>[src] flies into [M]!<br>"
						src.suffix = null
						if(src.Type >= 1)
							M.ArrowDamage(src.Type,src)
						if(M && M.Target == null)
							M.Target = src.Owner
						var/Gain = 25 - Own.RangedSkill / 3
						if(Gain <= 2)
							Gain = 2
						var/Gains = prob(Gain)
						if(Gains)
							if(Own.RangedSkill <= Own.SkillCap && Own.RangedSkill <= WorldSkillsCap)
								Own.RangedSkill += Own.RangedSkillMulti
						Own.CombatSkillTransfer(M)
						src.Owner = null
						return
				if(isturf(A))
					if(A.density && A.opacity)
						view(6,src) << "<font color = red>[src] hits [A] and breaks!<br>"
						del(src)
						return
			if(src && src.Target in range(0,src))
				src.suffix = null
				src.Owner = null
				return
		else
			src.suffix = null
			src.Owner = null
			return
	spawn(1) src.RangedMove()

/obj/proc/Rot()
	spawn(2000)
		if(src)
			view(src) << "<font color = yellow>The stump rots and falls apart!<br>"
			src.icon = null
			src.Fuel = 0

/obj/proc/SkeletonRaise()
	spawn(rand(300,600))
		if(src)
			var/Rise = 0
			Rise = prob(50)
			if(Rise == 0)
				return
			if(Rise)
				var/HasBones = null
				for(var/obj/Items/Misc/Bones/B in range(0,src))
					if(B.suffix == null)
						HasBones = B
						break
				if(HasBones)
					view(src) << "<font color =purple>[src] begins to shake violently for a moment. Suddenly all the bones around it begin to animate and turn into an undead skeleton!<br>"
					var/mob/NPC/Evil/Undead/Undead_Skeleton/S = new
					S.loc = src.loc
					S.PickUpObjects()
					del(HasBones)
					del(src)
					return

/obj/proc/MoveRand()
	step_rand(src)
	spawn(5) MoveRand()

/obj/Misc/Gates/AstralGate
	icon = 'fx.dmi'
	icon_state = "astral gate"
	luminosity = 3
	suffix = "Stuck"

/obj/Misc/Gates/AstralGate/New()
	spawn(300)
		if(src)
			view(6,src) << "<font color = yellow>[src] slams shut and vanishes!<br>"
			del(src)

/obj/Misc/Gates/AstralGate/Click()
	if(usr.Function == "Interact")
		if(src.GoesTo && usr.Fainted == 0)
			view(6,usr) << "<font color = yellow>[usr] enters the [src]!<br>"
			usr.loc = src.GoesTo
			view(6,usr) << "<font color = yellow>[usr] appears from the [src]!<br>"
			usr.overlays -= /obj/Misc/Bubbles/
			usr.overlays -= /obj/Misc/Swim/
			usr.InWater = 0
			return

/obj/Misc/Gates/ChaosGate
	icon = 'fx.dmi'
	icon_state = "chaos gate"
	suffix = "Stuck"

/obj/Misc/Gates/ChaosGate/New()
	spawn(1)
		src.ChaosGate()
		src.CreateChaos()

/obj/Misc/Gates/BloodGate
	icon = 'fx.dmi'
	icon_state = "blood portal"
	suffix = "Stuck"