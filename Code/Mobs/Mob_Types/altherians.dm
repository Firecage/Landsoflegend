/mob/NPC/Good/Altherian_Priest_of_Wisdom
	icon = 'elf.dmi'
	Type = "Town"
	icon_state = "N"
	Race = "Alther"

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

	Strength = 55
	Agility = 65
	Endurance = 55
	Intelligence = 60

	StrengthMulti = 0.3
	AgilityMulti = 0.5
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.5

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 60
	ShieldSkill = 5

	SwordSkillMulti = 0.4
	AxeSkillMulti = 0.3
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 120
	BloodMax = 120
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Altherian Empire"

	HateList = list("Illithid Cultists","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Human Empire Unholy")

/mob/NPC/Good/Altherian_Priest_of_Wisdom/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			src.GiveHair("NoBald")
			var/Gen = rand(1,2)
			if(Gen == 1)
				src.Gender = "Male"
			if(Gen == 2)
				src.Gender = "Female"
				src.icon = 'elf(F).dmi'
			var/obj/Items/Armour/Chest/KingsRobe/R = new
			var/obj/Items/Armour/Legs/ChainLeggings/L = new
			var/obj/Items/Armour/LeftFoot/PlateBootLeft/LB = new
			var/obj/Items/Armour/RightFoot/PlateBootRight/RB = new

			R.Move(src)
			LB.Move(src)
			RB.Move(src)
			L.Move(src)

			R.Material = "Cloth"
			R.Defence = 3
			L.Material = "Iron"
			L.RandomItemQuality()
			RB.Material = "Iron"
			RB.RandomItemQuality()
			LB.Material = "Iron"
			LB.RandomItemQuality()


			R.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"
			L.suffix = "Equip"

			for(var/obj/Items/Z in src)
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer

			src.WChest = R
			src.WLeftFoot = LB
			src.WRightFoot = RB
			src.WLegs = L

			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)

			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.GiveName()
			src.Ressurect()
			src.name = "[src.name] The Priest"

/mob/NPC/Good/Altherian_Guardsman
	icon = 'elf.dmi'
	icon_state = "N"
	Race = "Alther"

	Head = 80
	Torso = 80
	LeftArm = 80
	RightArm = 80
	LeftLeg = 80
	RightLeg = 80

	Skull = 80
	Brain = 80
	LeftEye = 80
	RightEye = 80
	LeftEar = 80
	RightEar = 80
	Teeth = 80
	Nose = 80
	Tongue = 80
	Throat = 80

	Heart = 80
	LeftLung = 80
	RightLung = 80
	Spleen = 80
	Intestine = 80
	LeftKidney = 80
	RightKidney = 80
	Liver = 80
	Bladder = 80
	Stomach = 80

	Strength = 45
	Agility = 55
	Endurance = 45
	Intelligence = 60

	StrengthMulti = 0.2
	AgilityMulti = 0.4
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.4

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 50
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50
	ShieldSkill = 50

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 110
	BloodMax = 110
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Altherian Empire"

	HateList = list("Illithid Cultists","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Human Empire Unholy")

/mob/NPC/Good/Altherian_Guardsman/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/Gen = rand(1,2)
			if(Gen == 1)
				src.Gender = "Male"
			if(Gen == 2)
				src.Gender = "Female"
				src.icon = 'elf(F).dmi'
			src.GiveHair("NoBald")
			var/obj/Items/Weapons/Spears/Spear/S = new
			var/obj/Items/Armour/Chest/ChainShirt/R = new
			var/obj/Items/Armour/Legs/ChainLeggings/L = new
			var/obj/Items/Armour/UpperBody/ChestPlate/C = new
			var/obj/Items/Armour/Shoulders/PlatePauldrons/P = new
			var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
			var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new
			var/obj/Items/Armour/LeftFoot/PlateBootLeft/LB = new
			var/obj/Items/Armour/RightFoot/PlateBootRight/RB = new
			var/obj/Items/Armour/Shields/Shield/IS = new

			R.Move(src)
			C.Move(src)
			LG.Move(src)
			RG.Move(src)
			LB.Move(src)
			RB.Move(src)
			S.Move(src)
			P.Move(src)
			L.Move(src)
			IS.Move(src)

			R.Material = "Iron"
			R.RandomItemQuality()
			LG.Material = "Iron"
			LG.RandomItemQuality()
			L.Material = "Iron"
			L.RandomItemQuality()
			RG.Material = "Iron"
			RG.RandomItemQuality()
			RB.Material = "Iron"
			RB.RandomItemQuality()
			IS.Material = "Iron"
			IS.RandomItemQuality()
			P.Material = "Iron"
			P.RandomItemQuality()
			C.Material = "Iron"
			C.RandomItemQuality()
			LB.Material = "Iron"
			LB.RandomItemQuality()


			R.suffix = "Equip"
			C.suffix = "Equip"
			LG.suffix = "Equip"
			RG.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"
			P.suffix = "Equip"
			S.suffix = "Equip"
			L.suffix = "Equip"
			IS.suffix = "Equip"
			IS.EquipState = "[IS.EquipState] left"

			S.Material = "Iron"
			S.RandomItemQuality()

			for(var/obj/Items/Z in src)
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer

			src.WChest = R
			src.WUpperBody = C
			src.WShoulders = P
			src.WLeftHand = LG
			src.WRightHand = RG
			src.WLeftFoot = LB
			src.WRightFoot = RB
			src.WLegs = L
			src.Weapon = S
			src.Weapon2 = IS

			src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)
			src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)

			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.GiveName()

/mob/NPC/Good/Altherian_Merchant
	icon = 'elf.dmi'
	icon_state = "N"
	Type = "Merchant"
	name = "{NPC} Merchant"
	Race = "Alther"

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

	Strength = 20
	Agility = 30
	Endurance = 20
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
	Faction = "Altherian Empire"

	HateList = list("Illithid Cultists","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Human Empire Unholy")

/mob/NPC/Good/Altherian_Merchant/Click()
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
			src.Speak("Greetings and welcome to my shop!",7)
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
					src.Speak("Ah, I see you've chosen a [I], a fine choice indeed! That item has a total Value of about [RoundedVal] Gold Coins.",7)
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
								src.Speak("Thank you, come again!.",7)
							else
								src.Speak("You dont have [RoundedVal] Gold Coins so you cant buy the [I].",7)
		else
			usr << "<font color = yellow>[src] seems to have no idea what your saying.<br>"
		return

/mob/NPC/Good/Altherian_Merchant/New()
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
			src.icon = 'elf(F).dmi'
			src.GiveHair()
		var/obj/Items/Armour/UpperBody/LeatherVest/V = new
		src.WUpperBody = V
		V.suffix = "Equip"
		V.Move(src)
		var/obj/Items/Armour/Legs/LeatherLeggings/LL = new
		src.WLegs = LL
		LL.suffix = "Equip"
		LL.Move(src)
		var/obj/Items/Armour/LeftFoot/LeatherBootLeft/LBL = new
		src.WLeftFoot = LBL
		LBL.suffix = "Equip"
		LBL.Move(src)
		var/obj/Items/Armour/RightFoot/LeatherBootRight/LBR = new
		src.WRightFoot = LBR
		LBR.suffix = "Equip"
		LBR.Move(src)
		var/obj/Items/Armour/LeftArm/LeatherGloveLeft/LGL = new
		src.WLeftHand = LGL
		LGL.suffix = "Equip"
		LGL.Move(src)
		var/obj/Items/Armour/RightArm/LeatherGloveRight/LGR = new
		src.WRightHand = LGR
		LGR.suffix = "Equip"
		LGR.Move(src)
		for(var/obj/Items/Z in src)
			Z.Dura = 100
			Z.icon_state = Z.EquipState
			Z.layer = Z.ItemLayer
		src.overlays+=image(LGR.icon,LGR.icon_state,LGR.ItemLayer)
		src.overlays+=image(LGL.icon,LGL.icon_state,LGL.ItemLayer)
		src.overlays+=image(LBR.icon,LBR.icon_state,LBR.ItemLayer)
		src.overlays+=image(LBL.icon,LBL.icon_state,LBL.ItemLayer)
		src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
		src.overlays+=image(V.icon,V.icon_state,V.ItemLayer)
		src.GiveRaceLanguages()
		src.Selling = list()
		for(var/obj/Items/It in oview(7,src))
			var/Add = 1
			if(It in src.Selling)
				Add = 0
			if(Add)
				src.Selling += It

/mob/NPC/Good/Altherian_Ancient_Patrol
	icon = 'elf.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Alther"

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

	Strength = 50
	Agility = 65
	Endurance = 45
	Intelligence = 50

	StrengthMulti = 0.2
	AgilityMulti = 0.4
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.4

	SwordSkill = 60
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 60
	ShieldSkill = 6

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3
	ShieldSkillMulti = 0.2

	luminosity = 4

	Blood = 100
	BloodMax = 100
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Altherian Empire"

	HateList = list("Illithid Cultists","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Human Empire Unholy")

/mob/NPC/Good/Altherian_Ancient_Patrol/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/Gen = rand(1,2)
	if(Gen == 1)
		src.Gender = "Male"
	if(Gen == 2)
		src.Gender = "Female"
		src.icon = 'elf(F).dmi'
	src.GiveHair("NoBald")
	var/obj/Items/Weapons/Swords/LongSword/S = new
	var/obj/Items/Armour/Chest/ChainShirt/R = new
	var/obj/Items/Armour/Legs/ChainLeggings/L = new
	var/obj/Items/Armour/UpperBody/ChestPlate/C = new
	var/obj/Items/Armour/Shoulders/PlatePauldrons/P = new
	var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
	var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new
	var/obj/Items/Armour/LeftFoot/PlateBootLeft/LB = new
	var/obj/Items/Armour/RightFoot/PlateBootRight/RB = new
	var/obj/Items/Armour/Back/ClothCape/CA = new
	var/obj/Items/Armour/Shields/Torch/T = new

	R.Move(src)
	C.Move(src)
	LG.Move(src)
	RG.Move(src)
	LB.Move(src)
	RB.Move(src)
	S.Move(src)
	P.Move(src)
	L.Move(src)
	CA.Move(src)

	R.Material = "Gold"
	R.RandomItemQuality()
	LG.Material = "Gold"
	LG.RandomItemQuality()
	L.Material = "Gold"
	L.RandomItemQuality()
	RG.Material = "Gold"
	RG.RandomItemQuality()
	RB.Material = "Gold"
	RB.RandomItemQuality()
	P.Material = "Gold"
	P.RandomItemQuality()
	C.Material = "Gold"
	C.RandomItemQuality()
	LB.Material = "Gold"
	LB.RandomItemQuality()


	R.suffix = "Equip"
	C.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	LB.suffix = "Equip"
	RB.suffix = "Equip"
	P.suffix = "Equip"
	S.suffix = "Equip"
	L.suffix = "Equip"
	CA.suffix = "Equip"

	S.Material = "Iron"
	S.RandomItemQuality()
	T.EquipState = "torch lit equip"
	T.Type = "Torch Lit"
	T.EquipState = "[T.EquipState] left"
	src.Weapon2 = T

	for(var/obj/Items/Z in src)
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer

	src.WChest = R
	src.WUpperBody = C
	src.WShoulders = P
	src.WLeftHand = LG
	src.WRightHand = RG
	src.WLeftFoot = LB
	src.WRightFoot = RB
	src.WLegs = L
	src.WBack = CA
	src.Weapon = S

	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)
	src.overlays+=image(CA.icon,CA.icon_state,CA.ItemLayer)

	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.InquisitiveAI()
	src.Regen()
	src.GiveName()

/mob/NPC/Good/Altherian_Guardsman_Patrol
	icon = 'elf.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Alther"

	Head = 80
	Torso = 80
	LeftArm = 80
	RightArm = 80
	LeftLeg = 80
	RightLeg = 80

	Skull = 80
	Brain = 80
	LeftEye = 80
	RightEye = 80
	LeftEar = 80
	RightEar = 80
	Teeth = 80
	Nose = 80
	Tongue = 80
	Throat = 80

	Heart = 80
	LeftLung = 80
	RightLung = 80
	Spleen = 80
	Intestine = 80
	LeftKidney = 80
	RightKidney = 80
	Liver = 80
	Bladder = 80
	Stomach = 80

	Strength = 45
	Agility = 55
	Endurance = 45
	Intelligence = 60

	StrengthMulti = 0.2
	AgilityMulti = 0.4
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.4

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 50
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50
	ShieldSkill = 50

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 110
	BloodMax = 110
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Altherian Empire"

	HateList = list("Illithid Cultists","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Human Empire Unholy")

/mob/NPC/Good/Altherian_Guardsman_Patrol/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.GiveHair("NoBald")
	var/Gen = rand(1,2)
	if(Gen == 1)
		src.Gender = "Male"
	if(Gen == 2)
		src.Gender = "Female"
		src.icon = 'elf(F).dmi'
	var/obj/Items/Weapons/Spears/Spear/S = new
	var/obj/Items/Armour/Chest/ChainShirt/R = new
	var/obj/Items/Armour/Legs/ChainLeggings/L = new
	var/obj/Items/Armour/UpperBody/ChestPlate/C = new
	var/obj/Items/Armour/Shoulders/PlatePauldrons/P = new
	var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
	var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new
	var/obj/Items/Armour/LeftFoot/PlateBootLeft/LB = new
	var/obj/Items/Armour/RightFoot/PlateBootRight/RB = new
	var/obj/Items/Armour/Shields/Shield/IS = new

	R.Move(src)
	C.Move(src)
	LG.Move(src)
	RG.Move(src)
	LB.Move(src)
	RB.Move(src)
	S.Move(src)
	P.Move(src)
	L.Move(src)
	IS.Move(src)

	R.Material = "Iron"
	R.RandomItemQuality()
	LG.Material = "Iron"
	LG.RandomItemQuality()
	L.Material = "Iron"
	L.RandomItemQuality()
	RG.Material = "Iron"
	RG.RandomItemQuality()
	RB.Material = "Iron"
	RB.RandomItemQuality()
	IS.Material = "Iron"
	IS.RandomItemQuality()
	P.Material = "Iron"
	P.RandomItemQuality()
	C.Material = "Iron"
	C.RandomItemQuality()
	LB.Material = "Iron"
	LB.RandomItemQuality()


	R.suffix = "Equip"
	C.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	LB.suffix = "Equip"
	RB.suffix = "Equip"
	P.suffix = "Equip"
	S.suffix = "Equip"
	L.suffix = "Equip"
	IS.suffix = "Equip"
	IS.EquipState = "[IS.EquipState] left"

	S.Material = "Iron"
	S.RandomItemQuality()

	for(var/obj/Items/Z in src)
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer

	src.WChest = R
	src.WUpperBody = C
	src.WShoulders = P
	src.WLeftHand = LG
	src.WRightHand = RG
	src.WLeftFoot = LB
	src.WRightFoot = RB
	src.WLegs = L
	src.Weapon = S
	src.Weapon2 = IS

	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)
	src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)

	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.Regen()
	src.GiveName()

