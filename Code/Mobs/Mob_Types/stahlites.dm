/mob/NPC/Good/Stahlite_Guardsman_Patrol
	icon = 'dwarf.dmi'
	Type = "Town"
	icon_state = "N"
	Race = "Stahlite"

	Head = 100
	Torso = 100
	LeftArm = 100
	RightArm = 100
	LeftLeg = 100
	RightLeg = 100

	Skull = 100
	Brain = 100
	LeftEye = 100
	RightEye = 100
	LeftEar = 100
	RightEar = 100
	Teeth = 100
	Nose = 100
	Tongue = 100
	Throat = 100

	Heart = 100
	LeftLung = 100
	RightLung = 100
	Spleen = 100
	Intestine = 100
	LeftKidney = 100
	RightKidney = 100
	Liver = 100
	Bladder = 100
	Stomach = 100

	Strength = 65
	Agility = 40
	Endurance = 65
	Intelligence = 50

	StrengthMulti = 0.2
	AgilityMulti = 0.2
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.2

	SwordSkill = 5
	AxeSkill = 35
	SpearSkill = 25
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50
	ShieldSkill = 50

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2
	ShieldSkillMulti = 0.2

	Soul = 0


	Blood = 130
	BloodMax = 130
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Stahlite Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire")

/mob/NPC/Good/Stahlite_Guardsman_Patrol/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Misc/Beards/StahliteBeard/Z = new
	src.Beard = Z
	src.overlays += src.Beard
	var/obj/Items/Weapons/Axes/BattleAxe/A = new
	A.Material = "Gold"
	A.RandomItemQuality()
	src.Weapon = A
	A.suffix = "Equip"
	A.Move(src)
	var/obj/Items/Armour/Chest/SmallChainShirt/IC = new
	IC.Material = "Gold"
	IC.RandomItemQuality()
	IC.Defence = 10
	src.WChest = IC
	IC.suffix = "Equip"
	IC.Move(src)
	var/obj/Items/Armour/Legs/SmallChainLeggings/LL = new
	LL.Material = "Gold"
	LL.RandomItemQuality()
	LL.Defence = 10
	src.WLegs = LL
	LL.suffix = "Equip"
	LL.Move(src)
	var/obj/Items/Armour/UpperBody/SmallChestPlate/C = new
	C.Material = "Gold"
	C.RandomItemQuality()
	C.Defence = 10
	src.WUpperBody = C
	C.suffix = "Equip"
	C.Move(src)
	var/obj/Items/Armour/Head/SmallDwarvenHelmet3/H = new
	H.Material = "Gold"
	H.RandomItemQuality()
	H.Defence = 10
	src.WHead = H
	H.suffix = "Equip"
	H.Move(src)
	var/obj/Items/Armour/LeftArm/SmallPlateGauntletLeft/LG = new
	LG.Material = "Gold"
	LG.RandomItemQuality()
	LG.Defence = 10
	src.WLeftHand = LG
	LG.suffix = "Equip"
	LG.Move(src)
	var/obj/Items/Armour/RightArm/SmallPlateGauntletRight/RG = new
	RG.Material = "Gold"
	RG.RandomItemQuality()
	RG.Defence = 10
	src.WLeftHand = RG
	RG.suffix = "Equip"
	RG.Move(src)
	var/obj/Items/Armour/RightFoot/SmallPlateBootRight/RB = new
	RB.Material = "Gold"
	RB.RandomItemQuality()
	RB.Defence = 10
	src.WLeftHand = RB
	RB.suffix = "Equip"
	RB.Move(src)
	var/obj/Items/Armour/LeftFoot/SmallPlateBootLeft/LB = new
	LB.Material = "Gold"
	LB.RandomItemQuality()
	LB.Defence = 10
	src.WLeftHand = LB
	LB.suffix = "Equip"
	LB.Move(src)
	var/obj/Items/Armour/Waist/SmallPlateBelt/B = new
	B.Material = "Gold"
	B.RandomItemQuality()
	B.Defence = 10
	src.WLeftHand = B
	B.suffix = "Equip"
	B.Move(src)
	var/obj/Items/Armour/Shoulders/SmallPlatePauldrons/S = new
	S.Material = "Gold"
	S.RandomItemQuality()
	S.Defence = 10
	src.WShoulders = S
	S.suffix = "Equip"
	S.Move(src)
	for(var/obj/Items/Q in src)
		Q.Dura = 100
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState
	src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
	src.overlays+=image(IC.icon,IC.icon_state,IC.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LG.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(B.icon,B.icon_state,B.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.Regen()
	src.GiveName()

/mob/NPC/Good/Stahlite_Merchant
	icon = 'dwarf.dmi'
	icon_state = "N"
	name = "{NPC} Merchant"
	Type = "Merchant"
	Race = "Stahlite"

	Head = 100
	Torso = 100
	LeftArm = 100
	RightArm = 100
	LeftLeg = 100
	RightLeg = 100

	Skull = 100
	Brain = 100
	LeftEye = 100
	RightEye = 100
	LeftEar = 100
	RightEar = 100
	Teeth = 100
	Nose = 100
	Tongue = 100
	Throat = 100

	Heart = 100
	LeftLung = 100
	RightLung = 100
	Spleen = 100
	Intestine = 100
	LeftKidney = 100
	RightKidney = 100
	Liver = 100
	Bladder = 100
	Stomach = 100

	Strength = 30
	Agility = 25
	Endurance = 30
	Intelligence = 60

	StrengthMulti = 0.2
	AgilityMulti = 0.2
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.2

	SwordSkill = 5
	AxeSkill = 50
	SpearSkill = 25
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 25
	ShieldSkill = 50

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 130
	BloodMax = 130
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Stahlite Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire")

/mob/NPC/Good/Stahlite_Merchant/Click()
	if(usr.Function == "Interact" && src in range(2,usr))
		if(usr.Faction in src.HateList)
			return
		if(usr.name in src.HateList)
			return
		var/CanUnderstand = 0
		var/obj/Speaking = null
		if(usr.CurrentLanguage)
			Speaking = usr.CurrentLanguage
		for(var/obj/L in src.LangKnow)
			if(L.name == Speaking.name)
				if(L.SpeakPercent > Speaking.SpeakPercent / 1.5)
					CanUnderstand = 1
					src.CurrentLanguage = usr.CurrentLanguage
		if(CanUnderstand)
			src.Speak("Welcome, you wont find better wares anywhere else!",7)
			for(var/obj/I in usr)
				if(I in src.Selling)
					var/Val = 1
					if(I.Material == "Wood")
						Val += 1
					if(I.Material == "Stone")
						Val += 1
					if(I.Material == "Iron")
						Val += 10
					if(I.Material == "Copper")
						Val += 5
					if(I.Material == "Silver")
						Val += 15
					if(I.Material == "Gold")
						Val += 20
					if(I.Quality)
						Val += I.Quality / 1.5
					if(I.Defence)
						Val += I.Defence / 2
					var/RoundedVal = round(Val)
					src.Speak("Ah, I see you've chosen a [I], a fine choice my friend! That item has a total Value of about [RoundedVal] Gold Coins.",7)
					var/list/menu = new()
					menu += "Buy"
					menu += "Dont Buy"
					var/Result = input(usr,"[src] says - Would you like to purchase the [I] for [RoundedVal] Gold Coins?", "Choose", null) in menu
					if(Result == "Dont Buy")
						return
					if(Result == "Buy")
						for(var/obj/Items/Currency/GoldCoin/Gold in usr)
							if(Gold.Type >= RoundedVal)
								var/CoinsAlready = 0
								for(var/obj/Items/Currency/GoldCoin/C in src)
									CoinsAlready = 1
								if(CoinsAlready == 0)
									var/obj/Items/Currency/GoldCoin/Coin = new
									Coin.Type = RoundedVal
									Gold.Type -= RoundedVal
									Coin.CoinAdjust()
									Gold.CoinAdjust()
									Coin.Move(src)
									Coin.suffix = "Carried"
									Coin.name = "[Coin.Type] Gold Coins"
									Gold.name = "[Gold.Type] Gold Coins"
								else
									for(var/obj/Items/Currency/GoldCoin/Coin in src)
										Coin.Type += RoundedVal
										Gold.Type -= RoundedVal
										Coin.CoinAdjust()
										Gold.CoinAdjust()
										Gold.name = "[Gold.Type] Gold Coins"
										Coin.name = "[Coin.Type] Gold Coins"
								if(Gold.Type == 0)
									del(Gold)
								usr.DeleteInventoryMenu()
								if(usr.InvenUp)
									usr.CreateInventory()
								src.Selling -= I
								if(I.ObjectTag == "Weapon")
									I.CanBeCrafted = 1
								if(I.ObjectTag == "Armour")
									I.CanBeCrafted = 1
								src.Speak("Remember, best wares in all the land!.",7)
							else
								src.Speak("You dont have [RoundedVal] Gold Coins so you cant buy the [I], what ya trying to do, rip me off?! Shame on you...",7)
		else
			usr << "<font color = yellow>[src] glares, seeming to have no idea what your saying.<br>"
		return

/mob/NPC/Good/Stahlite_Merchant/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Misc/Beards/StahliteBeard/Z = new
			src.Beard = Z
			src.overlays += src.Beard
			var/obj/Items/Armour/Chest/SmallChainShirt/IC = new
			IC.Material = "Iron"
			IC.RandomItemQuality()
			IC.Defence = 10
			src.WChest = IC
			IC.suffix = "Equip"
			IC.Move(src)
			var/obj/Items/Armour/Legs/SmallChainLeggings/LL = new
			LL.Material = "Iron"
			LL.RandomItemQuality()
			LL.Defence = 10
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.Move(src)
			var/obj/Items/Armour/UpperBody/SmallChestPlate/C = new
			C.Material = "Iron"
			C.RandomItemQuality()
			C.Defence = 10
			src.WUpperBody = C
			C.suffix = "Equip"
			C.Move(src)
			var/obj/Items/Armour/Head/SmallDwarvenHelmet3/H = new
			H.Material = "Iron"
			H.RandomItemQuality()
			H.Defence = 10
			src.WHead = H
			H.suffix = "Equip"
			H.Move(src)
			var/obj/Items/Armour/LeftArm/SmallPlateGauntletLeft/LG = new
			LG.Material = "Iron"
			LG.RandomItemQuality()
			LG.Defence = 10
			src.WLeftHand = LG
			LG.suffix = "Equip"
			LG.Move(src)
			var/obj/Items/Armour/RightArm/SmallPlateGauntletRight/RG = new
			RG.Material = "Iron"
			RG.RandomItemQuality()
			RG.Defence = 10
			src.WLeftHand = RG
			RG.suffix = "Equip"
			RG.Move(src)
			var/obj/Items/Armour/RightFoot/SmallPlateBootRight/RB = new
			RB.Material = "Iron"
			RB.RandomItemQuality()
			RB.Defence = 10
			src.WLeftHand = RB
			RB.suffix = "Equip"
			RB.Move(src)
			var/obj/Items/Armour/LeftFoot/SmallPlateBootLeft/LB = new
			LB.Material = "Iron"
			LB.RandomItemQuality()
			LB.Defence = 10
			src.WLeftHand = LB
			LB.suffix = "Equip"
			LB.Move(src)
			var/obj/Items/Armour/Waist/SmallPlateBelt/B = new
			B.Material = "Iron"
			B.RandomItemQuality()
			B.Defence = 10
			src.WLeftHand = B
			B.suffix = "Equip"
			B.Move(src)
			var/obj/Items/Armour/Shoulders/SmallPlatePauldrons/S = new
			S.Material = "Iron"
			S.RandomItemQuality()
			S.Defence = 10
			src.WShoulders = S
			S.suffix = "Equip"
			S.Move(src)
			for(var/obj/Items/Q in src)
				Q.Dura = 100
				Q.layer = Q.ItemLayer
				Q.icon_state = Q.EquipState
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			src.overlays+=image(IC.icon,IC.icon_state,IC.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
			src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(LG.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(B.icon,B.icon_state,B.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.Regen()
			src.GiveRaceLanguages()
			src.Selling = list()
			for(var/obj/Items/It in orange(7,src))
				var/Add = 1
				if(It in src.Selling)
					Add = 0
				if(Add)
					src.Selling += It

/mob/NPC/Good/Stahlite_Guardsman
	icon = 'dwarf.dmi'
	icon_state = "N"
	Race = "Stahlite"

	Head = 100
	Torso = 100
	LeftArm = 100
	RightArm = 100
	LeftLeg = 100
	RightLeg = 100

	Skull = 100
	Brain = 100
	LeftEye = 100
	RightEye = 100
	LeftEar = 100
	RightEar = 100
	Teeth = 100
	Nose = 100
	Tongue = 100
	Throat = 100

	Heart = 100
	LeftLung = 100
	RightLung = 100
	Spleen = 100
	Intestine = 100
	LeftKidney = 100
	RightKidney = 100
	Liver = 100
	Bladder = 100
	Stomach = 100

	Strength = 65
	Agility = 40
	Endurance = 65
	Intelligence = 60

	StrengthMulti = 0.2
	AgilityMulti = 0.2
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.2

	SwordSkill = 5
	AxeSkill = 50
	SpearSkill = 25
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50
	ShieldSkill = 50

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 130
	BloodMax = 130
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Stahlite Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire")

/mob/NPC/Good/Stahlite_Guardsman/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Misc/Beards/StahliteBeard/Z = new
			src.Beard = Z
			src.overlays += src.Beard
			var/obj/Items/Weapons/Axes/BattleAxe/A = new
			A.Material = "Iron"
			A.RandomItemQuality()
			src.Weapon = A
			A.suffix = "Equip"
			A.Move(src)
			var/obj/Items/Armour/Chest/SmallChainShirt/IC = new
			IC.Material = "Iron"
			IC.RandomItemQuality()
			IC.Defence = 10
			src.WChest = IC
			IC.suffix = "Equip"
			IC.Move(src)
			var/obj/Items/Armour/Legs/SmallChainLeggings/LL = new
			LL.Material = "Iron"
			LL.RandomItemQuality()
			LL.Defence = 10
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.Move(src)
			var/obj/Items/Armour/UpperBody/SmallChestPlate/C = new
			C.Material = "Iron"
			C.RandomItemQuality()
			C.Defence = 10
			src.WUpperBody = C
			C.suffix = "Equip"
			C.Move(src)
			var/obj/Items/Armour/Head/SmallDwarvenHelmet3/H = new
			H.Material = "Iron"
			H.RandomItemQuality()
			H.Defence = 10
			src.WHead = H
			H.suffix = "Equip"
			H.Move(src)
			var/obj/Items/Armour/LeftArm/SmallPlateGauntletLeft/LG = new
			LG.Material = "Iron"
			LG.RandomItemQuality()
			LG.Defence = 10
			src.WLeftHand = LG
			LG.suffix = "Equip"
			LG.Move(src)
			var/obj/Items/Armour/RightArm/SmallPlateGauntletRight/RG = new
			RG.Material = "Iron"
			RG.RandomItemQuality()
			RG.Defence = 10
			src.WLeftHand = RG
			RG.suffix = "Equip"
			RG.Move(src)
			var/obj/Items/Armour/RightFoot/SmallPlateBootRight/RB = new
			RB.Material = "Iron"
			RB.RandomItemQuality()
			RB.Defence = 10
			src.WLeftHand = RB
			RB.suffix = "Equip"
			RB.Move(src)
			var/obj/Items/Armour/LeftFoot/SmallPlateBootLeft/LB = new
			LB.Material = "Iron"
			LB.RandomItemQuality()
			LB.Defence = 10
			src.WLeftHand = LB
			LB.suffix = "Equip"
			LB.Move(src)
			var/obj/Items/Armour/Waist/SmallPlateBelt/B = new
			B.Material = "Iron"
			B.RandomItemQuality()
			B.Defence = 10
			src.WLeftHand = B
			B.suffix = "Equip"
			B.Move(src)
			var/obj/Items/Armour/Shoulders/SmallPlatePauldrons/S = new
			S.Material = "Iron"
			S.RandomItemQuality()
			S.Defence = 10
			src.WShoulders = S
			S.suffix = "Equip"
			S.Move(src)
			for(var/obj/Items/Q in src)
				Q.Dura = 100
				Q.layer = Q.ItemLayer
				Q.icon_state = Q.EquipState
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			src.overlays+=image(IC.icon,IC.icon_state,IC.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
			src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(LG.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(B.icon,B.icon_state,B.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.GiveName()

