/mob/NPC/Evil/Chaos/Ratling_Merchant
	icon = 'ratling.dmi'
	icon_state = "N"
	Type = "Merchant"
	name = "{NPC} Merchant"
	Race = "Ratling"

	Head = 110
	Torso = 110
	LeftArm = 110
	RightArm = 110
	LeftLeg = 110
	RightLeg = 110

	Skull = 110
	Brain = 110
	LeftEye = 110
	RightEye = 110
	LeftEar = 110
	RightEar = 110
	Teeth = 110
	Nose = 110
	Tongue = 110
	Throat = 110

	Heart = 110
	LeftLung = 110
	RightLung = 110
	Spleen = 110
	Intestine = 110
	LeftKidney = 110
	RightKidney = 110
	Liver = 110
	Bladder = 110
	Stomach = 110

	Strength = 25
	Agility = 25
	Endurance = 25
	Intelligence = 25

	StrengthMulti = 0.2
	AgilityMulti = 0.2
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.2

	SwordSkill = 25
	AxeSkill = 25
	SpearSkill = 25
	BluntSkill = 25
	RangedSkill = 25
	DaggerSkill = 25
	UnarmedSkill = 25

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.3
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.3
	DaggerSkillMulti = 0.3
	UnarmedSkillMulti = 0.3

	Blood = 110
	BloodMax = 110
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/
	Faction = "Ratling Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Ratling_Merchant/Click()
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
			src.Speak("Yes yes? Want to buy things?! Give, give shinies!",7)
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
					src.Speak("You choose [I], good good! Give [RoundedVal] shinies!.",7)
					var/list/menu = new()
					menu += "Buy"
					menu += "Dont Buy"
					var/Result = input(usr,"[src] says - Buy [I] for [RoundedVal] shinies?", "Choose", null) in menu
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
									Coin.loc = src
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
								src.Speak("Come, come again! Bring more shiney!.",7)
							else
								src.Speak("No have [RoundedVal] shinies so you no buy the [I].",7)
		else
			usr << "<font color = yellow>[src] seems to have no idea what your saying.<br>"
		return

/mob/NPC/Evil/Chaos/Ratling_Merchant/New()
	spawn(10)
		var/image/I = new('Target.dmi',src)
		src.TargetIcon = I
		src.DeadIcon = src.icon
		src.Attack()
		src.BloodFlow()
		src.Regen()
		var/Gen = rand(1,2)
		if(Gen == 1)
			src.Gender = "Male"
		if(Gen == 2)
			src.Gender = "Female"
			src.icon = 'human(F).dmi'
			src.GiveHair()
		src.GiveRaceLanguages()
		src.Selling = list()
		for(var/obj/Items/It in orange(7,src))
			var/Add = 1
			if(It in src.Selling)
				Add = 0
			if(Add)
				src.Selling += It

/mob/NPC/Evil/Chaos/Ratling_Assassin
	name = "{NPC} Ratling Assassin"
	icon = 'ratling.dmi'
	icon_state = "N"
	Race = "Ratling"

	Head = 35
	Torso = 35
	LeftArm = 35
	RightArm = 35
	LeftLeg = 35
	RightLeg = 35

	Skull = 35
	Brain = 35
	LeftEye = 35
	RightEye = 35
	LeftEar = 35
	RightEar = 35
	Teeth = 35
	Nose = 35
	Tongue = 35
	Throat = 35

	Heart = 35
	LeftLung = 35
	RightLung = 35
	Spleen = 35
	Intestine = 35
	LeftKidney = 35
	RightKidney = 35
	Liver = 35
	Bladder = 35
	Stomach = 35

	Strength = 5
	Agility = 10
	Endurance = 5
	Intelligence = 2

	StrengthMulti = 0.1
	AgilityMulti = 0.15
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5
	ShieldSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.1
	ShieldSkillMulti = 0.1

	Soul = 0

	Blood = 40
	BloodMax = 40
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Ratling Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Ratling_Assassin/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Daggers/Dagger/D = new
	var/obj/Items/Weapons/Daggers/Dagger/D2 = new
	var/obj/Items/Armour/Back/SmallClothCloak/CC = new

	D.loc = src
	D2.loc = src
	CC.loc = src


	D.suffix = "Equip"
	D2.suffix = "Equip"
	CC.suffix = "Equip"

	D.Material = "Iron"
	D.RandomItemQuality()
	D2.Material = "Iron"
	D2.RandomItemQuality()

	src.Weapon = D
	src.Weapon2 = D2
	src.WBack = CC
	for(var/obj/Items/Q in src)
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState
	src.overlays+=image(D.icon,D.icon_state,D.ItemLayer)
	src.overlays+=image(D2.icon,"[D2.icon_state] left",D2.ItemLayer)
	src.overlays+=image(CC.icon,CC.icon_state,CC.ItemLayer)

	src.GuardLoc = src.loc
	src.GuardDir = src.dir
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.Regen()

/mob/NPC/Evil/Chaos/Ratling_Priest
	name = "{NPC} Ratling Priest"
	icon = 'ratling.dmi'
	icon_state = "N"
	Race = "Ratling"

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

	Strength = 40
	Agility = 65
	Endurance = 40
	Intelligence = 40

	StrengthMulti = 0.15
	AgilityMulti = 0.2
	EnduranceMulti = 0.15
	IntelligenceMulti = 0.2

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 40
	ShieldSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.4
	DaggerSkillMulti = 0.4
	UnarmedSkillMulti = 0.4
	ShieldSkillMulti = 0.4

	Soul = 0

	Blood = 110
	BloodMax = 110
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Ratling Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Ratling_Priest/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Daggers/Dagger/D = new
	var/obj/Items/Armour/Back/SmallClothCloak/CC = new

	D.loc = src
	CC.loc = src


	D.suffix = "Equip"
	CC.suffix = "Equip"

	D.Material = "Iron"
	D.RandomItemQuality()

	src.Weapon = D
	src.WBack = CC
	for(var/obj/Items/Q in src)
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState
	src.overlays+=image(D.icon,D.icon_state,D.ItemLayer)
	src.overlays+=image(CC.icon,CC.icon_state,CC.ItemLayer)
	src.GuardLoc = src.loc
	src.GuardDir = src.dir
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.GuardAI()
	src.Regen()
	src.Ressurect()
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.loc = src
	Gold.suffix = "Carried"
	Gold.Type = rand(10,25)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()

/mob/NPC/Evil/Chaos/Ratling_Invader
	icon = 'ratling.dmi'
	icon_state = "N"
	Race = "Ratling"
	name = "{NPC} Ratling"

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

	Strength = 15
	Agility = 20
	Endurance = 10
	Intelligence = 10

	StrengthMulti = 0.15
	AgilityMulti = 0.2
	EnduranceMulti = 0.15
	IntelligenceMulti = 0.2

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 10
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 10
	ShieldSkill = 10

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 75
	BloodMax = 75
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Ratling Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Ratling_Invader/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Armour/UpperBody/BoneChestPlate/C = new
	var/obj/Items/Armour/Shoulders/SkullPauldrons/P = new
	var/obj/Items/Armour/LeftArm/BoneLeftGauntlet/LG = new
	var/obj/Items/Armour/RightArm/BoneRightGauntlet/RG = new
	var/obj/Items/Armour/LeftFoot/BoneBootLeft/LB = new
	var/obj/Items/Armour/RightFoot/BoneBootRight/RB = new
	var/obj/Items/Weapons/Swords/LongSword/M = new
	var/obj/Items/Armour/Shields/WoodenBuckler/IS = new

	M.loc = src
	IS.loc = src

	M.Material = "Iron"
	M.RandomItemQuality()
	M.suffix = "Equip"
	IS.suffix = "Equip"
	IS.EquipState = "[IS.EquipState] left"
	src.Weapon = M
	src.Weapon2 = IS

	C.loc = src
	LG.loc = src
	RG.loc = src
	LB.loc = src
	RB.loc = src
	P.loc = src

	C.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	LB.suffix = "Equip"
	RB.suffix = "Equip"
	P.suffix = "Equip"

	src.WUpperBody = C
	src.WShoulders = P
	src.WLeftHand = LG
	src.WRightHand = RG
	src.WLeftFoot = LB
	src.WRightFoot = RB

	for(var/obj/Items/Q in src)
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState

	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
	src.overlays+=image(M.icon,M.icon_state,M.ItemLayer)
	src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)

	src.GuardLoc = src.loc
	src.GuardDir = src.dir
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.Regen()

/mob/NPC/Evil/Chaos/Ratling_Guardsman
	icon = 'ratling.dmi'
	icon_state = "N"
	Race = "Ratling"

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

	Strength = 45
	Agility = 60
	Endurance = 40
	Intelligence = 45

	StrengthMulti = 0.15
	AgilityMulti = 0.2
	EnduranceMulti = 0.15
	IntelligenceMulti = 0.2

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 40
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 40
	ShieldSkill = 40

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.4
	DaggerSkillMulti = 0.4
	UnarmedSkillMulti = 0.4
	ShieldSkillMulti = 0.4

	Soul = 0

	Blood = 75
	BloodMax = 75
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Ratling Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Ratling_Guardsman/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Armour/Head/SkullHelmet/H = new
	var/obj/Items/Armour/UpperBody/BoneChestPlate/C = new
	var/obj/Items/Armour/Shoulders/SkullPauldrons/P = new
	var/obj/Items/Armour/LeftArm/BoneLeftGauntlet/LG = new
	var/obj/Items/Armour/RightArm/BoneRightGauntlet/RG = new
	var/obj/Items/Armour/LeftFoot/BoneBootLeft/LB = new
	var/obj/Items/Armour/RightFoot/BoneBootRight/RB = new
	var/obj/Items/Weapons/Spears/Spear/S = new
	var/obj/Items/Armour/Shields/WoodenBuckler/IS = new

	S.loc = src
	IS.loc = src

	S.Material = "Iron"
	S.RandomItemQuality()
	S.suffix = "Equip"
	IS.suffix = "Equip"
	IS.EquipState = "[IS.EquipState] left"
	src.Weapon = S
	src.Weapon2 = IS

	C.loc = src
	LG.loc = src
	RG.loc = src
	LB.loc = src
	RB.loc = src
	H.loc = src
	P.loc = src

	C.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	LB.suffix = "Equip"
	RB.suffix = "Equip"
	P.suffix = "Equip"
	H.suffix = "Equip"

	src.WUpperBody = C
	src.WShoulders = P
	src.WLeftHand = LG
	src.WRightHand = RG
	src.WLeftFoot = LB
	src.WRightFoot = RB
	src.WHead = H

	for(var/obj/Items/Q in src)
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState

	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
	src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)

	src.GuardLoc = src.loc
	src.GuardDir = src.dir
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.GuardAI()
	src.Regen()
	src.GiveName()
