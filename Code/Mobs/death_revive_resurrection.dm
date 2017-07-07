/mob/proc/MortallyWounded()
	if(src.Dead)
		return
	if(src.MortalWound)
		if(src.Faction == "Undead")
			return
		var/Rec = prob(2)
		if(Rec)
			return
		var/Die = prob(1)
		if(Die)
			view(src) << "<font color = purple>[src] dies from Mortals Wounds to their Organs!<br>"
			src.Death()
			return
	else
		return
	spawn(50) src.MortallyWounded()

/mob/proc/Heal()
	if(src.Humanoid && src.Dead == 0)
		src.Head = 100
		src.Torso = 100
		src.LeftArm = 100
		src.RightArm = 100
		src.LeftLeg = 100
		src.RightLeg = 100
		src.Skull = 100
		src.Brain = 100
		src.LeftEye = 100
		src.RightEye = 100
		src.LeftEar = 100
		src.RightEar = 100
		src.Teeth = 100
		src.Nose = 100
		src.Tongue = 100
		src.Throat = 100
		src.Heart = 100
		src.LeftLung = 100
		src.RightLung = 100
		src.Spleen = 100
		src.Intestine = 100
		src.LeftKidney = 100
		src.RightKidney = 100
		src.Liver = 100
		src.Bladder = 100
		src.Stomach = 100
		src.CanSee = 1
		src.Pain = 0
		src.MortalWound = 0
		var/HasArms = 0
		if(src.RightArm)
			HasArms = 1
		if(src.LeftArm)
			HasArms = 1
		var/ClawList = list("Wolfman","Illithid","Ratling")
		if(HasArms)
			if(src.Race in ClawList)
				src.Claws = 100
		if(src.BloodMax)
			src.Blood = src.BloodMax
			src.Bleed()
		if(src.Faction != "Undead")
			src.MoveSpeed = 2
		else
			src.MoveSpeed = 3
		src.LimbLoss()
	else
		src.HP = src.HPMAX

/mob/proc/Death()
	for(var/obj/I in src)
		I.suffix = null
		I.overlays = null
		I.Move(locate(src.x,src.y,src.z))
		if(I.icon_state == "mystical ball glow")
			I.icon_state = "mystical ball"
		src.Weight -= I.Weight
		src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
		src.overlays-=image(I.icon,"[I.icon_state] left",I.ItemLayer)
		I.layer = 4
		if(I.CarryState)
			I.icon_state = I.CarryState
		if(I.Delete)
			del(I)
	if(src.OrginalName)
		src.name = src.OrginalName
		src.OrginalName = null
	if(src.StoredFaction)
		src.Faction = src.StoredFaction
		src.StoredFaction = null
	src.Ref = null
	src.Bleed = null
	src.WHead = null
	src.WBack = null
	src.WExtra = null
	src.WChest = null
	src.WUpperBody = null
	src.WShoulders = null
	src.WLeftHand = null
	src.WRightHand = null
	src.WLeftFoot = null
	src.WRightFoot = null
	src.WLegs = null
	src.WWaist = null
	src.Weapon = null
	src.Weapon2 = null
	src.MoveSpeed = 2
	if(src.client)
		src.ResetButtons()
	src.overlays = null
	src.Function = null
	src.luminosity = 0
	src.Fainted = 0
	src.Sleeping = 0
	src.invisibility  = 50
	src.see_invisible = 50
	src.Stunned = 0
	src.Fuel = 0
	src.OnFire = 0
	src.overlays -= /obj/Misc/Fire/
	src.Target = null
	src.CanMove = 1
	src.Blood = 0
	src.CanEat = 0
	src.Dead = 1
	src.CanSleep = 0
	src.CanEat = 0
	src.Pain = 0
	src.CanAttack = 0
	src.Pull = null
	src.density = 0
	if(src.Race != "Skeleton")
		var/obj/Items/Body/B = new
		B.icon = src.DeadIcon
		B.Humanoid = src.Humanoid
		B.Strength = src.Strength
		B.Agility = src.Agility
		B.Endurance = src.Endurance
		B.BloodMax = src.BloodMax
		B.Hair = src.Hair
		B.Beard = src.Beard
		B.Race = src.Race
		if(src.Beard)
			var/obj/Brd = src.Beard
			var/icon/BI = new(Brd.icon)
			BI.Turn(90)
			Brd.icon = BI
		if(src.Hair)
			var/obj/Hir = src.Hair
			var/icon/HI = new(Hir.icon)
			HI.Turn(90)
			Hir.icon = HI
		B.AddBodyWounds(src)
		B.overlays += src.Beard
		B.overlays += src.Hair
		B.LeftArm = src.LeftArm
		B.RightArm = src.RightArm
		B.Torso = src.Torso
		B.Head = src.Head
		B.LeftLeg = src.LeftLeg
		B.RightLeg = src.RightLeg
		B.Skull = src.Skull
		B.Brain = src.Brain
		B.LeftEye = src.LeftEye
		B.RightEye = src.RightEye
		B.LeftEar = src.LeftEar
		B.RightEar = src.RightEar
		B.Nose = src.Nose
		B.Teeth = src.Teeth
		B.Tongue = src.Tongue
		B.Throat = src.Throat
		B.Heart = src.Heart
		B.LeftLung = src.LeftLung
		B.RightLung = src.RightLung
		B.Spleen = src.Spleen
		B.Intestine = src.Intestine
		B.LeftKidney = src.LeftKidney
		B.RightKidney = src.RightKidney
		B.Liver = src.Liver
		B.Bladder = src.Bladder
		B.Stomach = src.Stomach
		B.BloodColour = src.BloodColour
		B.Faction = src.Faction

		src.Hair = null
		src.Beard = null
		src.BloodMax = 0
		src.see_in_dark = 8
		if(src.DeadState)
			B.icon_state = src.DeadState
			if(src.Race == "Large Flesh Beast")
				B.overlays += /obj/Misc/Gore/FleshBeastCorpse/
			if(src.Race == "Dragon")
				B.overlays += /obj/Misc/Gore/DrakeCorpse/
			if(src.Race == "Yeti")
				B.overlays += /obj/Misc/Gore/YetiCorpse/
			if(src.Race == "Troll")
				B.overlays += /obj/Misc/Gore/TrollCorpse/
			if(src.Race == "GiantSnake")
				B.overlays += /obj/Misc/Gore/GiantSnakeCorpse/
		else
			B.icon_state = src.icon_state
		B.name = "[src]'s Corpse"
		B.Owner = src
		if(src.client)
			B.Owner = src.name
			B.BodysKey = src.key
			B.BodyKeyCheck()
		B.Move(src.loc)
		var/icon/I = new(B.icon)
		I.Turn(90)
		B.icon = I
		if(src.Faction == "Undead")
			if(src.icon_state != "None")
				var/Rise = prob(50)
				if(Rise)
					spawn(rand(300,600))
						if(B && src && src.Dead && src.Brain >= 0)
							src.EvilRevive(B)
							src.Faction = "Undead"
							src.HateList = null
							src.HateList = list("Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")
							view(src) << "<font color = purple>[B] rises from the dead!<br>"
							del(B)
							if(src.client == null)
								src.NormalAI()
	else
		src.Hair = null
		src.Strength = 0
		src.Agility = 0
		src.Endurance = 0
		src.BloodMax = 0
		var/obj/Items/Misc/Bones/B = new
		B.Move(src.loc)
		B.name = "[src]'s bones"
		var/obj/Items/Misc/Skull/S = new
		S.Move(src.loc)
		S.name = "[src]'s skull"
		S.SkeletonRaise()
	src << "<font color=red>You have died!<br>"
	if(src.Soul)
		src.icon = 'characters.dmi'
		src.icon_state = "ghost"
	else
		del(src)
	if(src.client)
		src.RemakeChoice()
	return

/mob/proc/EvilRessurect()
	if(src.Dead == 0 && src.Job == null && src.Target == null)
		for(var/obj/Items/Body/B in view(6,src))
			var/CanRes = 1
			if(B.LeftArm == 0 && B.RightArm == 0 && B.LeftLeg == 0 && B.RightLeg == 0)
				CanRes = 0
			if(B.Brain <= 20)
				CanRes = 0
			if(CanRes)
				var/mob/HasOwner = null
				if(B.Owner)
					if(ismob(B.Owner))
						HasOwner = B.Owner
					else
						for(var/mob/M in Players)
							if(M.name == B.Owner)
								HasOwner = M
				if(HasOwner)
					view(src) << "<font color = yellow>[src] begins to call upon their Un-Holy Powers, as they do the energies begin to revive [B] back to life!<br>"
					src.Job = "Revive"
					src.overlays += /obj/Misc/SpellEffects/Evil/
					spawn(1000)
						if(src)
							src.overlays -= /obj/Misc/SpellEffects/Evil/
							src.Job = null
							if(B)
								if(HasOwner)
									if(B in range(6,src))
										view(src) << "<font color = yellow>[HasOwner] is raised into un-death by [src]'s Un-Holy Powers!<br>"
										HasOwner.EvilRevive(B)
										del(B)
									else
										src.overlays -= /obj/Misc/SpellEffects/Evil/
								else
									src.overlays -= /obj/Misc/SpellEffects/Evil/
							else
								src.overlays -= /obj/Misc/SpellEffects/Evil/
	spawn(100) EvilRessurect()

/mob/proc/Ressurect()
	if(src.Dead == 0 && src.Job == null && src.Target == null)
		for(var/obj/Items/Body/B in view(6,src))
			var/mob/HasOwner = null
			if(B.Owner)
				if(ismob(B.Owner))
					HasOwner = B.Owner
				else
					for(var/mob/M in Players)
						if(M.name == B.Owner)
							HasOwner = M
			if(HasOwner)
				var/WillRevive = 1
				if(HasOwner.Faction in src.HateList)
					WillRevive = 0
				if(WillRevive && HasOwner.Faction != "Undead" && HasOwner.CanBeRevived != 0)
					view(src) << "<font color = yellow>[src] begins to call upon their healing powers, as they do the energies begin to revive [B] back to life!<br>"
					src.Job = "Revive"
					src.overlays += /obj/Misc/SpellEffects/Dispel/
					spawn(1000)
						if(src)
							src.overlays -= /obj/Misc/SpellEffects/Dispel/
							src.Job = null
							if(B)
								if(HasOwner)
									if(B in range(6,src))
										HasOwner.GoodRevive(B)
										HasOwner.Heal()
										del(B)
										if(HasOwner.Age >= HasOwner.DieAge)
											HasOwner.CanBeRevived -= 1
										view(src) << "<font color = yellow>[HasOwner] is raised from the dead by [src]'s healing powers!<br>"
									else
										src.overlays -= /obj/Misc/SpellEffects/Dispel/
								else
									src.overlays -= /obj/Misc/SpellEffects/Dispel/
							else
								src.overlays -= /obj/Misc/SpellEffects/Dispel/
	spawn(100) Ressurect()

/mob/proc/GoodRevive(var/obj/Body)
	src.loc = Body.loc
	src.Hair = Body.Hair
	src.Strength = Body.Strength
	src.Agility = Body.Agility
	src.Endurance = Body.Endurance
	src.luminosity = 0
	src.see_in_dark = src.DarkVision
	src.invisibility  = 0
	src.see_invisible = 0
	src.Fuel = 100
	src.Target = null
	src.CanMove = 1
	src.Dead = 0
	src.BloodMax = Body.BloodMax
	if(src.BloodMax <= 1)
		src.BloodMax = 100
	src.Blood = src.BloodMax
	src.Bleed = null
	src.Bleed()
	src.BloodFlow()
	src.CanSleep = 1
	src.CanEat = 1
	src.Pain = 0
	src.CanAttack = 1
	src.density = 1
	src.LeftArm = Body.LeftArm
	src.RightArm = Body.RightArm
	src.Torso = Body.Torso
	src.Head = Body.Head
	src.LeftLeg = Body.LeftLeg
	src.RightLeg = Body.RightLeg
	src.Skull = Body.Skull
	src.Brain = Body.Brain
	src.LeftEye = Body.LeftEye
	src.RightEye = Body.RightEye
	src.LeftEar = Body.LeftEar
	src.RightEar = Body.RightEar
	src.Nose = Body.Nose
	src.Teeth = Body.Teeth
	src.Tongue = Body.Tongue
	src.Throat = Body.Throat
	src.Heart = Body.Heart
	src.LeftLung = Body.LeftLung
	src.RightLung = Body.RightLung
	src.Spleen = Body.Spleen
	src.Intestine = Body.Intestine
	src.LeftKidney = Body.LeftKidney
	src.RightKidney = Body.RightKidney
	src.Liver = Body.Liver
	src.Bladder = Body.Bladder
	src.Stomach = Body.Stomach
	src.Faction = Body.Faction
	src.GoreCheck()
	if(src.client)
		src.Update()
		if(src.CanEat)
			src.HungerTick()
		if(src.CanSleep)
			src.SleepTick()
	if(Body.Hair)
		var/obj/Hir = Body.Hair
		var/icon/I
		I = initial(Hir.icon)
		Hir.icon = I
		src.overlays += Hir
		src.Hair = Hir
	if(Body.Beard)
		var/obj/Brd = Body.Beard
		var/icon/I
		I = initial(Brd.icon)
		Brd.icon = I
		src.overlays += Brd
		src.Beard = Brd
	src.icon = Body.icon
	src.LimbLoss()
	var/icon/I = new(src.icon)
	I.Turn(270)
	src.icon = I
	if(src.client == null)
		src.CancelDefaultProc = 1
		spawn(50)
			if(src)
				src.CancelDefaultProc = 0
				src.PickUpObjects()
				src.NormalAI()

/mob/proc/EvilRevive(var/obj/Body)
	src.loc = Body.loc
	src.Hair = Body.Hair
	src.Strength = Body.Strength * 1.1
	src.Agility = Body.Agility / 2
	src.Endurance = Body.Endurance * 1.2
	if(Body.Faction != "Undead")
		src.UndeadReset()
	src.luminosity = 0
	src.see_in_dark = 6
	src.invisibility  = 0
	src.see_invisible = 0
	src.CanEatRawMeats = 2
	src.DieAge = 1000
	src.Fuel = 100
	src.Target = null
	src.CanEatBodies = 1
	src.CanMove = 1
	src.BloodMax = 0
	src.Blood = 0
	src.Bleed = null
	src.Bleed()
	src.Dead = 0
	src.CanSleep = 0
	src.CanEat= 1
	src.Pain = 0
	src.CanAttack = 1
	src.density = 1
	src.LeftArm = Body.LeftArm
	src.RightArm = Body.RightArm
	src.Torso = Body.Torso
	src.Head = Body.Head
	src.LeftLeg = Body.LeftLeg
	src.RightLeg = Body.RightLeg
	src.Skull = Body.Skull
	src.Brain = Body.Brain
	src.LeftEye = Body.LeftEye
	src.RightEye = Body.RightEye
	src.LeftEar = Body.LeftEar
	src.RightEar = Body.RightEar
	src.Nose = Body.Nose
	src.Teeth = Body.Teeth
	src.Tongue = Body.Tongue
	src.Throat = Body.Throat
	src.Heart = Body.Heart
	src.LeftLung = Body.LeftLung
	src.RightLung = Body.RightLung
	src.Spleen = Body.Spleen
	src.Intestine = Body.Intestine
	src.LeftKidney = Body.LeftKidney
	src.RightKidney = Body.RightKidney
	src.Liver = Body.Liver
	src.Bladder = Body.Bladder
	src.Stomach = Body.Stomach
	src.SpreadsAffliction = "Undead Bite"
	src.Faction = "Undead"
	src.MoveSpeed = 3
	src.UndeadProc()
	src.GoreCheck()
	if(src.client)
		src.Update()
		if(src.CanEat)
			src.HungerTick()
	if(src.client == null)
		src.CancelDefaultProc = 1
		spawn(50)
			if(src)
				src.CancelDefaultProc = 0
				src.PickUpObjects()
				src.HateList = list("Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")
				src.NormalAI()
				src.name = "{NPC} Zombie"
	if(Body.Hair)
		var/obj/Hir = Body.Hair
		var/icon/I
		I = initial(Hir.icon)
		Hir.icon = I
		src.overlays += Hir
		src.Hair = Hir
	if(Body.Beard)
		var/obj/Brd = Body.Beard
		var/icon/I
		I = initial(Brd.icon)
		Brd.icon = I
		src.overlays += Brd
		src.Beard = Brd
	src.icon = Body.icon
	src.LimbLoss()
	var/icon/I = new(src.icon)
	I.Turn(270)
	src.icon = I
	src.icon += rgb(50,50,50)

/mob/proc/FleshBurst()
	spawn(10000)
		if(src)
			view(src) << "<font color=red>[src] begins to bubble and twitch violently as their innards tear open and spew disgusting fluids everywhere, suddenly three new born flesh beasts appear from the mess!<br>"
			var/mob/NPC/Evil/Chaos/Flesh_Beast/B1 = new
			B1.Move(src.loc)
			var/mob/NPC/Evil/Chaos/Flesh_Beast/B2 = new
			B2.Move(src.loc)
			var/mob/NPC/Evil/Chaos/Flesh_Beast/B3 = new
			B3.Move(src.loc)
			src.Death()
			return

/mob/proc/Regen()
	if(src.Faction == "Undead")
		return
	if(src.Stunned == 0 && src.Dead != 1)
		if(src.Fainted == 0)
			if(src.MortalWound)
				var/Heal = prob(10)
				if(Heal)
					src.MortalWound = 0
			src.Pain -= 1
			src.Fuel += 1
			if(src.Fuel >= 100)
				src.Fuel = 100
			if(src.Pain <= 0)
				src.Pain = 0
			if(src.Humanoid)
				if(src.RightArm)
					src.RightArm += 0.08
					if(src.WoundRightArm)
						var/RemoveWound = prob(0.5)
						if(RemoveWound)
							src.overlays -= src.WoundRightArm
							src.WoundRightArm = null
					if(src.RightArm >= 100)
						src.RightArm = 100
				else if(src.CanRegenLimbs)
					var/Regen = prob(1)
					if(Regen)
						src.RightArm += 0.08
						src.LimbLoss()
						range(6,src) << "<font color = purple>[src]'s Right Arm grows back!<br>"
				if(src.LeftArm)
					src.LeftArm += 0.08
					if(src.WoundLeftArm)
						var/RemoveWound = prob(0.5)
						if(RemoveWound)
							src.overlays -= src.WoundLeftArm
							src.WoundLeftArm = null
					if(src.LeftArm >= 100)
						src.LeftArm = 100
				else if(src.CanRegenLimbs)
					var/Regen = prob(1)
					if(Regen)
						src.LeftArm += 0.08
						src.LimbLoss()
						range(6,src) << "<font color = purple>[src]'s Left Arm grows back!<br>"
				if(src.RightLeg)
					src.RightLeg += 0.08
					if(src.WoundRightLeg)
						var/RemoveWound = prob(0.5)
						if(RemoveWound)
							src.overlays -= src.WoundRightLeg
							src.WoundRightLeg = null
					if(src.RightLeg >= 100)
						src.RightLeg = 100
				else if(src.CanRegenLimbs)
					var/Regen = prob(1)
					if(Regen)
						src.RightLeg += 0.08
						src.LimbLoss()
						range(6,src) << "<font color = purple>[src]'s Right Leg grows back!<br>"
				if(src.LeftLeg)
					src.LeftLeg += 0.08
					if(src.WoundLeftLeg)
						var/RemoveWound = prob(0.5)
						if(RemoveWound)
							src.overlays -= src.WoundLeftLeg
							src.WoundLeftLeg = null
					if(src.LeftLeg >= 100)
						src.LeftLeg = 100
				else if(src.CanRegenLimbs)
					var/Regen = prob(1)
					if(Regen)
						src.LeftLeg += 0.08
						src.LimbLoss()
						range(6,src) << "<font color = purple>[src]'s Left Leg grows back!<br>"
				if(src.LeftEar)
					src.LeftEar += 0.06
					if(src.LeftEar >= 100)
						src.LeftEar = 100
				if(src.RightEar)
					src.RightEar += 0.06
					if(src.RightEar >= 100)
						src.RightEar = 100
				if(src.Nose)
					src.Nose += 0.06
					if(src.Nose >= 100)
						src.Nose = 100
				if(src.Intestine)
					src.Intestine += 0.03
					if(src.Intestine >= 100)
						src.Intestine = 100
				if(src.LeftLung)
					src.LeftLung += 0.03
					if(src.LeftLung >= 100)
						src.LeftLung = 100
				if(src.RightLung)
					src.RightLung += 0.03
					if(src.RightLung >= 100)
						src.RightLung = 100
				if(src.Bladder)
					src.Bladder += 0.06
					if(src.Bladder >= 100)
						src.Bladder = 100
				if(src.Stomach)
					src.Stomach += 0.04
					if(src.Stomach >= 100)
						src.Stomach = 100
				if(src.Spleen)
					src.Spleen += 0.03
					if(src.Spleen >= 100)
						src.Spleen = 100
				if(src.RightKidney)
					src.RightKidney += 0.03
					if(src.RightKidney >= 100)
						src.RightKidney = 100
				if(src.LeftKidney)
					src.LeftKidney += 0.03
					if(src.LeftKidney >= 100)
						src.LeftKidney = 100
				if(src.Brain)
					src.Brain += 0.03
					if(src.Brain >= 100)
						src.Brain = 100
				if(src.Heart)
					src.Heart += 0.03
					if(src.Heart >= 100)
						src.Heart = 100
				if(src.LeftEye)
					src.LeftEye += 0.03
					if(src.LeftEye >= 100)
						src.LeftEye = 100
				if(src.RightEye)
					src.RightEye += 0.03
					if(src.RightEye >= 100)
						src.RightEye = 100
				if(src.Throat)
					src.Throat += 0.06
					if(src.Throat >= 100)
						src.Throat = 100
				if(src.Skull)
					src.Skull += 0.08
					if(src.Skull >= 100)
						src.Skull = 100
				if(src.Liver)
					src.Liver += 0.03
					if(src.Liver >= 100)
						src.Liver = 100
				if(src.Tongue)
					src.Tongue += 0.06
					if(src.Tongue >= 100)
						src.Tongue = 100
				if(src.Teeth)
					src.Teeth += 0.03
					if(src.Teeth >= 100)
						src.Teeth = 100
				var/HasArms = 0
				if(src.RightArm)
					HasArms = 1
				if(src.LeftArm)
					HasArms = 1
				var/ClawList = list("Wolfman","Illithid","Ratling")
				if(HasArms)
					if(src.Race in ClawList)
						src.Claws += 0.1
						if(src.Claws >= 100)
							src.Claws = 100
				if(src.WoundHead)
					var/RemoveWound = prob(0.5)
					if(RemoveWound)
						src.overlays -= src.WoundHead
						src.WoundHead = null
				if(src.WoundTorso)
					var/RemoveWound = prob(0.5)
					if(RemoveWound)
						src.overlays -= src.WoundTorso
						src.WoundTorso = null
			else
				src.HP += 0.8
				if(src.HP >= src.HPMAX)
					src.HP = src.HPMAX
	spawn(25) Regen()
