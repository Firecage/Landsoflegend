/mob/NPC/Neutral/Snakeman_Guardian_Patrol
	name = "{NPC} Snakeman Guardian"
	icon = 'snakeman.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Snakeman"

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
	Endurance = 45
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 50
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3

	Soul = 0

	Blood = 125
	BloodMax = 125
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Snakeman Empire"
	HateList = list("Gremlin Hordes","Stahlite Empire","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Neutral/Snakeman_Guardian_Patrol/New()
	var/image/I = new('Target.dmi',src)
	var/obj/Items/Weapons/Swords/Scimitar/S = new
	var/obj/Items/Armour/Chest/ChainShirt/R = new
	var/obj/Items/Armour/UpperBody/ChestPlate/C = new
	var/obj/Items/Armour/Shoulders/PlatePauldrons/P = new
	var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
	var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new

	R.loc = src
	C.loc = src
	LG.loc = src
	RG.loc = src
	S.loc = src
	P.loc = src

	R.Material = "Copper"
	R.RandomItemQuality()
	LG.Material = "Copper"
	LG.RandomItemQuality()
	RG.Material = "Copper"
	RG.RandomItemQuality()
	P.Material = "Copper"
	P.RandomItemQuality()
	C.Material = "Copper"
	C.RandomItemQuality()


	R.suffix = "Equip"
	C.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	P.suffix = "Equip"
	S.suffix = "Equip"

	S.Material = "Copper"
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
	src.Weapon = S

	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.TargetIcon = I
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.Regen()

/mob/NPC/Neutral/Snakeman_Merchant
	icon = 'snakeman.dmi'
	icon_state = "N"
	Type = "Merchant"
	name = "{NPC} Merchant"
	Race = "Snakeman"

	Head = 110
	Torso = 110
	LeftArm = 110
	RightArm = 110

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

	Strength = 30
	Agility = 30
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
	Faction = "Snakeman Empire"
	HateList = list("Gremlin Hordes","Stahlite Empire","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Neutral/Snakeman_Merchant/Click()
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
								src.Speak("Thank you, come again!.",7)
							else
								src.Speak("You dont have [RoundedVal] Gold Coins so you cant buy the [I].",7)
		else
			usr << "<font color = yellow>[src] seems to have no idea what your saying.<br>"
		return

/mob/NPC/Neutral/Snakeman_Merchant/New()
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
		var/obj/Items/Armour/UpperBody/LeatherVest/V = new
		src.WUpperBody = V
		V.suffix = "Equip"
		V.loc = src
		var/obj/Items/Armour/Legs/LeatherLeggings/LL = new
		src.WLegs = LL
		LL.suffix = "Equip"
		LL.loc = src
		var/obj/Items/Armour/LeftFoot/LeatherBootLeft/LBL = new
		src.WLeftFoot = LBL
		LBL.suffix = "Equip"
		LBL.loc = src
		var/obj/Items/Armour/RightFoot/LeatherBootRight/LBR = new
		src.WRightFoot = LBR
		LBR.suffix = "Equip"
		LBR.loc = src
		var/obj/Items/Armour/LeftArm/LeatherGloveLeft/LGL = new
		src.WLeftHand = LGL
		LGL.suffix = "Equip"
		LGL.loc = src
		var/obj/Items/Armour/RightArm/LeatherGloveRight/LGR = new
		src.WRightHand = LGR
		LGR.suffix = "Equip"
		LGR.loc = src
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

/mob/NPC/Neutral/Snakeman_Guardian
	name = "{NPC} Snakeman Guardian"
	icon = 'snakeman.dmi'
	icon_state = "N"
	Race = "Snakeman"

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
	Endurance = 45
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 50
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3

	Soul = 0

	Blood = 125
	BloodMax = 125
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Snakeman Empire"
	HateList = list("Gremlin Hordes","Stahlite Empire","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Neutral/Snakeman_Guardian/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			var/obj/Items/Weapons/Swords/Scimitar/S = new
			var/obj/Items/Armour/Chest/ChainShirt/R = new
			var/obj/Items/Armour/UpperBody/ChestPlate/C = new
			var/obj/Items/Armour/Shoulders/PlatePauldrons/P = new
			var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
			var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new

			R.loc = src
			C.loc = src
			LG.loc = src
			RG.loc = src
			S.loc = src
			P.loc = src

			R.Material = "Copper"
			R.RandomItemQuality()
			LG.Material = "Copper"
			LG.RandomItemQuality()
			RG.Material = "Copper"
			RG.RandomItemQuality()
			P.Material = "Copper"
			P.RandomItemQuality()
			C.Material = "Copper"
			C.RandomItemQuality()


			R.suffix = "Equip"
			C.suffix = "Equip"
			LG.suffix = "Equip"
			RG.suffix = "Equip"
			P.suffix = "Equip"
			S.suffix = "Equip"

			S.Material = "Copper"
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
			src.Weapon = S

			src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.TargetIcon = I
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()

/mob/NPC/Neutral/Snakeman_Priest
	name = "{NPC} Snakeman Priest"
	icon = 'snakeman.dmi'
	icon_state = "N"
	Race = "Snakeman"

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
	Agility = 60
	Endurance = 45
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 50
	UnarmedSkill = 5

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3

	Soul = 0

	Blood = 135
	BloodMax = 135
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Snakeman Empire"
	HateList = list("Gremlin Hordes","Stahlite Empire","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Neutral/Snakeman_Priest/New()
	spawn(10)
		if(src)
			var/obj/Items/Weapons/Daggers/Dagger/D = new
			var/obj/Items/Armour/Back/ClothCloak/CC = new

			D.loc = src
			CC.loc = src


			D.suffix = "Equip"
			CC.suffix = "Equip"

			D.Material = "Copper"
			D.RandomItemQuality()

			src.Weapon = D
			src.WBack = CC
			for(var/obj/Items/Q in src)
				Q.layer = Q.ItemLayer
				Q.icon_state = Q.EquipState
			src.overlays+=image(D.icon,D.icon_state,D.ItemLayer)
			src.overlays+=image(CC.icon,CC.icon_state,CC.ItemLayer)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.Ressurect()
