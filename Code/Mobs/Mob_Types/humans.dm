/mob/NPC/Good/Human_Merchant
	icon = 'human.dmi'
	icon_state = "N"
	Type = "Merchant"
	name = "{NPC} Merchant"
	Race = "Human"

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

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Good/Human_Merchant/Click()
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
									Gold.Move(src)
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

/mob/NPC/Good/Human_Merchant/New()
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

/mob/NPC/Good/Human_Villager_Black
	icon = 'human black.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Human"

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

	Strength = 8
	Agility = 8
	Endurance = 8
	Intelligence = 6

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.2

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.5
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

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Good/Human_Villager_Black/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.Regen()
	src.AnimalAI()
	src.GiveName()
	var/Gen = rand(1,2)
	if(Gen == 1)
		src.Gender = "Male"
	if(Gen == 2)
		src.Gender = "Female"
		src.icon = 'human black(F).dmi'
		src.GiveHair()
	var/obj/Items/Armour/Chest/DesertRobe/LV = new
	src.WChest = LV
	LV.suffix = "Equip"
	LV.Move(src)
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
	src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.Move(src)
	Gold.suffix = "Carried"
	Gold.Type = rand(2,5)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()

/mob/NPC/Good/Human_Villager_Black
	icon = 'human black.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Human"

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

	Strength = 8
	Agility = 8
	Endurance = 8
	Intelligence = 6

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.2

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.5
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

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Good/Human_Villager_Black/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.Regen()
	src.AnimalAI()
	src.GiveName()
	var/Gen = rand(1,2)
	if(Gen == 1)
		src.Gender = "Male"
	if(Gen == 2)
		src.Gender = "Female"
		src.icon = 'human black(F).dmi'
		src.GiveHair()
	var/obj/Items/Armour/Chest/DesertRobe/LV = new
	src.WChest = LV
	LV.suffix = "Equip"
	LV.Move(src)
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
	src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)

/mob/NPC/Good/Human_Villager
	icon = 'human.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Human"

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

	Strength = 7
	Agility = 7
	Endurance = 7
	Intelligence = 7

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.35

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.5
	AxeSkillMulti = 0.3
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.3
	DaggerSkillMulti = 0.3
	UnarmedSkillMulti = 0.3

	Blood = 100
	BloodMax = 100
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes")

/mob/NPC/Good/Human_Villager/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.Regen()
	src.AnimalAI()
	src.GiveName()
	var/Gen = rand(1,2)
	if(Gen == 1)
		src.Gender = "Male"
	if(Gen == 2)
		src.Gender = "Female"
		src.icon = 'human(F).dmi'
	src.GiveHair()
	var/obj/Items/Weapons/Blunts/Shovel/S = new
	S.Material = "Iron"
	S.RandomItemQuality()
	src.Weapon = S
	S.suffix = "Equip"
	S.Move(src)
	var/obj/Items/Armour/UpperBody/LeatherVest/LV = new
	src.WChest = LV
	LV.suffix = "Equip"
	LV.Move(src)
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
	src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.Move(src)
	Gold.suffix = "Carried"
	Gold.Type = rand(2,5)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()

/mob/NPC/Good/Human_Guardsman_Patrol
	name = "Human Guardsman"
	icon = 'human.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Human"

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
	Agility = 50
	Endurance = 50
	Intelligence = 50

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 50
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

	Blood = 110
	BloodMax = 110
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Guardsman_Patrol/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/Gen = rand(1,2)
	if(Gen == 1)
		src.Gender = "Male"
	if(Gen == 2)
		src.Gender = "Female"
		src.icon = 'human(F).dmi'
	src.GiveHair()
	if(src.Hair)
		src.overlays -= src.Hair
	var/obj/Items/Weapons/Spears/Spear/S = new
	var/obj/Items/Armour/Head/PlateHelmet/H = new
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
	H.Move(src)
	P.Move(src)
	L.Move(src)
	IS.Move(src)

	L.Material = "Iron"
	L.RandomItemQuality()
	R.Material = "Iron"
	R.RandomItemQuality()
	H.Material = "Iron"
	H.RandomItemQuality()
	LG.Material = "Iron"
	LG.RandomItemQuality()
	LB.Material = "Iron"
	LB.RandomItemQuality()
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


	R.suffix = "Equip"
	C.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	LB.suffix = "Equip"
	RB.suffix = "Equip"
	P.suffix = "Equip"
	H.suffix = "Equip"
	S.suffix = "Equip"
	L.suffix = "Equip"
	IS.suffix = "Equip"
	IS.EquipState = "[IS.EquipState] left"

	S.Material = "Iron"
	S.RandomItemQuality()

	src.WChest = R
	src.WUpperBody = C
	src.WShoulders = P
	src.WLeftHand = LG
	src.WRightHand = RG
	src.WLeftFoot = LB
	src.WRightFoot = RB
	src.WHead = H
	src.WLegs = L
	src.Weapon = S
	src.Weapon2 = IS
	for(var/obj/Items/Z in src)
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer
	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(P.icon,P.icon_state,P.ItemLayer)
	src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)
	src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)

	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.Regen()
	src.GiveName()

/mob/NPC/Good/Human_Black_Guardsman_Patrol
	icon = 'human black.dmi'
	icon_state = "N"
	Race = "Human"
	Type = "Town"

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

	Strength = 55
	Agility = 55
	Endurance = 55
	Intelligence = 45

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.2

	SwordSkill = 60
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50
	ShieldSkill = 5

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 120
	BloodMax = 120
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Black_Guardsman_Patrol/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/Gen = rand(1,2)
			if(Gen == 1)
				src.Gender = "Male"
				var/obj/Items/Armour/Head/Turban/T = new
				T.Move(src)
				T.suffix = "Equip"
				src.WHead = T
				T.icon_state = T.EquipState
				T.layer = T.ItemLayer
				src.overlays+=image(T.icon,T.icon_state,T.ItemLayer)
			if(Gen == 2)
				src.Gender = "Female"
				src.icon = 'human black(F).dmi'
				src.GiveHair()
			var/obj/Items/Weapons/Swords/Scimitar/S = new
			var/obj/Items/Armour/Chest/DesertRobe/R = new
			var/obj/Items/Armour/Legs/ChainLeggings/L = new
			var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
			var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new
			var/obj/Items/Armour/LeftFoot/PlateBootLeft/LB = new
			var/obj/Items/Armour/RightFoot/PlateBootRight/RB = new

			R.Move(src)
			LG.Move(src)
			RG.Move(src)
			LB.Move(src)
			RB.Move(src)
			S.Move(src)
			L.Move(src)

			LG.Material = "Iron"
			LG.RandomItemQuality()
			L.Material = "Iron"
			L.RandomItemQuality()
			RG.Material = "Iron"
			RG.RandomItemQuality()
			RB.Material = "Iron"
			RB.RandomItemQuality()
			LB.Material = "Iron"
			LB.RandomItemQuality()


			R.suffix = "Equip"
			LG.suffix = "Equip"
			RG.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"
			S.suffix = "Equip"
			L.suffix = "Equip"

			S.Material = "Iron"
			S.RandomItemQuality()

			for(var/obj/Items/Z in src)
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer

			src.WChest = R
			src.WLeftHand = LG
			src.WRightHand = RG
			src.WLeftFoot = LB
			src.WRightFoot = RB
			src.WLegs = L
			src.Weapon = S

			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)

			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.NormalAI()
			src.Regen()
			src.GiveName()

/mob/NPC/Good/Human_Black_Guardsman
	icon = 'human black.dmi'
	icon_state = "N"
	Race = "Human"

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

	Strength = 55
	Agility = 55
	Endurance = 55
	Intelligence = 45

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.2

	SwordSkill = 60
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50
	ShieldSkill = 5

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2
	ShieldSkillMulti = 0.2

	Soul = 0

	Blood = 120
	BloodMax = 120
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Black_Guardsman/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/Gen = rand(1,2)
			if(Gen == 1)
				src.Gender = "Male"
				var/obj/Items/Armour/Head/Turban/T = new
				T.Move(src)
				T.suffix = "Equip"
				src.WHead = T
				T.icon_state = T.EquipState
				T.layer = T.ItemLayer
				src.overlays+=image(T.icon,T.icon_state,T.ItemLayer)
			if(Gen == 2)
				src.Gender = "Female"
				src.icon = 'human black(F).dmi'
				src.GiveHair()
			var/obj/Items/Weapons/Swords/Scimitar/S = new
			var/obj/Items/Armour/Chest/DesertRobe/R = new
			var/obj/Items/Armour/Legs/ChainLeggings/L = new
			var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
			var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new
			var/obj/Items/Armour/LeftFoot/PlateBootLeft/LB = new
			var/obj/Items/Armour/RightFoot/PlateBootRight/RB = new
			R.Move(src)
			LG.Move(src)
			RG.Move(src)
			LB.Move(src)
			RB.Move(src)
			S.Move(src)
			L.Move(src)

			LG.Material = "Iron"
			LG.RandomItemQuality()
			L.Material = "Iron"
			L.RandomItemQuality()
			RG.Material = "Iron"
			RG.RandomItemQuality()
			RB.Material = "Iron"
			RB.RandomItemQuality()
			LB.Material = "Iron"
			LB.RandomItemQuality()

			R.suffix = "Equip"
			LG.suffix = "Equip"
			RG.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"
			S.suffix = "Equip"
			L.suffix = "Equip"

			S.Material = "Iron"
			S.RandomItemQuality()

			for(var/obj/Items/Z in src)
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer

			src.WChest = R
			src.WLeftHand = LG
			src.WRightHand = RG
			src.WLeftFoot = LB
			src.WRightFoot = RB
			src.WLegs = L
			src.Weapon = S

			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)

			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.GiveName()

/mob/NPC/Good/Human_Guardsman
	icon = 'human.dmi'
	icon_state = "N"
	Race = "Human"

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
	Agility = 50
	Endurance = 50
	Intelligence = 50

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 50
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

	Blood = 110
	BloodMax = 110
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Guardsman/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/Gen = rand(1,2)
			if(Gen == 1)
				src.Gender = "Male"
			if(Gen == 2)
				src.Gender = "Female"
				src.icon = 'human(F).dmi'
			src.GiveHair()
			if(src.Hair)
				src.overlays -= src.Hair
			var/obj/Items/Weapons/Spears/Spear/S = new
			var/obj/Items/Armour/Head/PlateHelmet/H = new
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
			H.Move(src)
			P.Move(src)
			L.Move(src)
			IS.Move(src)

			R.Material = "Iron"
			R.RandomItemQuality()
			H.Material = "Iron"
			H.RandomItemQuality()
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
			H.suffix = "Equip"
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
			src.WHead = H
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
			src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
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

/mob/NPC/Good/Human_Inquisitor
	icon = 'human.dmi'
	icon_state = "N"
	Race = "Human"

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
	Agility = 45
	Endurance = 55
	Intelligence = 55

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 55
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 55

	SwordSkillMulti = 0.5
	AxeSkillMulti = 0.5
	SpearSkillMulti = 0.5
	BluntSkillMulti = 0.5
	RangedSkillMulti = 0.5
	DaggerSkillMulti = 0.5
	UnarmedSkillMulti = 0.5

	Blood = 170
	BloodMax = 170
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Inquisitor/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Items/Weapons/Blunts/InquisitorsMaul/SW = new
			var/obj/Items/Armour/Head/InquisitorsHelmet/H = new
			var/obj/Items/Armour/Chest/ChainShirt/R = new
			var/obj/Items/Armour/Legs/ChainLeggings/L = new
			var/obj/Items/Armour/UpperBody/InquisitorsChestPlate/C = new
			var/obj/Items/Armour/Shoulders/InquisitorsPauldrons/S = new
			var/obj/Items/Armour/LeftArm/InquisitorsLeftGauntlet/LG = new
			var/obj/Items/Armour/RightArm/InquisitorsRightGauntlet/RG = new
			var/obj/Items/Armour/LeftFoot/InquisitorsLeftBoot/LB = new
			var/obj/Items/Armour/RightFoot/InquisitorsRightBoot/RB = new

			R.Move(src)
			C.Move(src)
			LG.Move(src)
			RG.Move(src)
			LB.Move(src)
			RB.Move(src)
			S.Move(src)
			H.Move(src)
			SW.Move(src)
			L.Move(src)

			R.Material = "Iron"
			R.RandomItemQuality()
			L.Material = "Iron"
			L.RandomItemQuality()


			R.suffix = "Equip"
			C.suffix = "Equip"
			LG.suffix = "Equip"
			RG.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"
			S.suffix = "Equip"
			H.suffix = "Equip"
			SW.suffix = "Equip"
			L.suffix = "Equip"

			src.WChest = R
			src.WUpperBody = C
			src.WShoulders = S
			src.WLeftHand = LG
			src.WRightHand = RG
			src.WLeftFoot = LB
			src.WRightFoot = RB
			src.WHead = H
			src.WLegs = L
			src.Weapon = SW
			for(var/obj/Items/Z in src)
				if(Z.Defence)
					Z.Defence = Z.Defence / 2
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer
			src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
			src.overlays+=image(SW.icon,SW.icon_state,SW.ItemLayer)
			src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)

			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.InquisitiveGuardAI()
			src.Regen()
			src.GiveName()
			src.name = "[src.name] The Inquisitor"
			var/obj/Items/Currency/GoldCoin/Gold = new
			Gold.Move(src)
			Gold.suffix = "Carried"
			Gold.Type = rand(10,25)
			Gold.name = "[Gold.Type] Gold Coins"
			Gold.CoinAdjust()

/mob/NPC/Good/Human_Inquisitor_Patroler
	name = "Human Inquisitor"
	icon = 'human.dmi'
	icon_state = "N"
	Race = "Human"

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
	Agility = 45
	Endurance = 55
	Intelligence = 55

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 55
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 55

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2

	Blood = 170
	BloodMax = 170
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	luminosity = 4

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Inquisitor_Patroler/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Blunts/InquisitorsMaul/SW = new
	var/obj/Items/Armour/Head/InquisitorsHelmet/H = new
	var/obj/Items/Armour/Chest/ChainShirt/R = new
	var/obj/Items/Armour/Legs/ChainLeggings/L = new
	var/obj/Items/Armour/UpperBody/InquisitorsChestPlate/C = new
	var/obj/Items/Armour/Shoulders/InquisitorsPauldrons/S = new
	var/obj/Items/Armour/LeftArm/InquisitorsLeftGauntlet/LG = new
	var/obj/Items/Armour/RightArm/InquisitorsRightGauntlet/RG = new
	var/obj/Items/Armour/LeftFoot/InquisitorsLeftBoot/LB = new
	var/obj/Items/Armour/RightFoot/InquisitorsRightBoot/RB = new
	var/obj/Items/Armour/Shields/Torch/T = new

	R.Move(src)
	C.Move(src)
	LG.Move(src)
	RG.Move(src)
	LB.Move(src)
	RB.Move(src)
	S.Move(src)
	H.Move(src)
	SW.Move(src)
	L.Move(src)
	T.Move(src)

	R.Material = "Iron"
	R.RandomItemQuality()
	L.Material = "Iron"
	L.RandomItemQuality()


	R.suffix = "Equip"
	C.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	LB.suffix = "Equip"
	RB.suffix = "Equip"
	S.suffix = "Equip"
	H.suffix = "Equip"
	SW.suffix = "Equip"
	L.suffix = "Equip"
	T.suffix = "Equip"

	src.WChest = R
	src.WUpperBody = C
	src.WShoulders = S
	src.WLeftHand = LG
	src.WRightHand = RG
	src.WLeftFoot = LB
	src.WRightFoot = RB
	src.WHead = H
	src.WLegs = L
	src.Weapon = SW
	T.EquipState = "torch lit equip"
	T.Type = "Torch Lit"
	T.EquipState = "[T.EquipState] left"
	src.Weapon2 = T
	for(var/obj/Items/Z in src)
		if(Z.Defence)
			Z.Defence = Z.Defence / 2
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer
	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
	src.overlays+=image(SW.icon,SW.icon_state,SW.ItemLayer)
	src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)
	src.overlays+=image(T.icon,T.icon_state,T.ItemLayer)

	src.GuardLoc = src.loc
	src.GuardDir = src.dir
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.Regen()
	src.GiveName()
	src.name = "[src.name] The Inquisitor"
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.Move(src)
	Gold.suffix = "Carried"
	Gold.Type = rand(10,25)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()
	spawn(10)
		var/Found = 0
		for(var/mob/NPC/Good/Human_Priest_Patroler/P in view(4,src))
			Found = 1
			src.Owner = P
		if(Found)
			src.FollowAI()
		else
			src.InquisitiveAI()

/mob/NPC/Good/Human_Priest_Patroler
	name = "Human Priest of Order"
	icon = 'human.dmi'
	icon_state = "N"
	Race = "Human"

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

	Strength = 60
	Agility = 50
	Endurance = 60
	Intelligence = 60

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 60
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 60

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.3
	SpearSkillMulti = 0.3
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.3
	DaggerSkillMulti = 0.3
	UnarmedSkillMulti = 0.3

	luminosity = 4

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Priest_Patroler/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Blunts/InquisitorsStaff/SW = new
	var/obj/Items/Armour/Head/PriestHelmet/H = new
	var/obj/Items/Armour/Chest/PriestRobe/R = new
	var/obj/Items/Armour/UpperBody/PriestsChestPlate/C = new
	var/obj/Items/Armour/Waist/PriestBelt/B = new
	var/obj/Items/Armour/Shoulders/PriestsPauldrons/S = new
	var/obj/Items/Armour/LeftArm/PriestsLeftGauntlet/LG = new
	var/obj/Items/Armour/RightArm/PriestsRightGauntlet/RG = new
	var/obj/Items/Armour/LeftFoot/PriestsLeftBoot/LB = new
	var/obj/Items/Armour/RightFoot/PriestsRightBoot/RB = new
	var/obj/Items/Armour/Shields/Torch/T = new

	R.loc = src
	C.loc = src
	B.loc = src
	LG.loc = src
	RG.loc = src
	LB.loc = src
	RB.loc = src
	S.loc = src
	H.loc = src
	SW.loc = src
	T.loc = src

	R.suffix = "Equip"
	C.suffix = "Equip"
	B.suffix = "Equip"
	LG.suffix = "Equip"
	RG.suffix = "Equip"
	LB.suffix = "Equip"
	RB.suffix = "Equip"
	S.suffix = "Equip"
	H.suffix = "Equip"
	SW.suffix = "Equip"
	T.suffix = "Equip"

	src.WChest = R
	src.WUpperBody = C
	src.WShoulders = S
	src.WLeftHand = LG
	src.WRightHand = RG
	src.WLeftFoot = LB
	src.WRightFoot = RB
	src.WWaist = B
	src.WHead = H
	src.Weapon = SW
	T.EquipState = "torch lit equip"
	T.Type = "Torch Lit"
	T.EquipState = "[T.EquipState] left"
	src.Weapon2 = T
	for(var/obj/Items/Z in src)
		if(Z.Defence)
			Z.Defence = Z.Defence / 2
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer
	src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(B.icon,B.icon_state,B.ItemLayer)
	src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
	src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
	src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
	src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
	src.overlays+=image(SW.icon,SW.icon_state,SW.ItemLayer)
	src.overlays+=image(T.icon,T.icon_state,T.ItemLayer)

	src.GuardLoc = src.loc
	src.GuardDir = src.dir
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.InquisitiveAI()
	src.Regen()
	src.GiveName()
	src.name = "[src.name] The Priest"
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.loc = src
	Gold.suffix = "Carried"
	Gold.Type = rand(10,25)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()

/mob/NPC/Good/Chuck_Norris
	icon = 'human.dmi'
	icon_state = "N"
	Race = "Human"

	Head = 125
	Torso = 125
	LeftArm = 125
	RightArm = 125
	LeftLeg = 125
	RightLeg = 125

	Skull = 125
	Brain = 125
	LeftEye = 125
	RightEye = 125
	LeftEar = 125
	RightEar = 125
	Teeth = 125
	Nose = 125
	Tongue = 125
	Throat = 125

	Heart = 125
	LeftLung = 125
	RightLung = 125
	Spleen = 125
	Intestine = 125
	LeftKidney = 125
	RightKidney = 125
	Liver = 125
	Bladder = 125
	Stomach = 125

	Strength = 100
	Agility = 100
	Endurance = 100
	Intelligence = 100

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 50
	AxeSkill = 50
	SpearSkill = 50
	BluntSkill = 50
	RangedSkill = 50
	DaggerSkill = 50
	UnarmedSkill = 50

	SwordSkillMulti = 0.5
	AxeSkillMulti = 0.5
	SpearSkillMulti = 0.5
	BluntSkillMulti = 0.5
	RangedSkillMulti = 0.5
	DaggerSkillMulti = 0.5
	UnarmedSkillMulti = 0.5

	Blood = 250
	BloodMax = 250
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "None"
	HateList = list()

/mob/NPC/Good/Chuck_Norris/New()
	spawn(10)
		if(src)
			src.GiveRaceLanguages()
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Items/Armour/Chest/PriestRobe/R = new
			var/obj/Items/Armour/LeftFoot/PriestsLeftBoot/LB = new
			var/obj/Items/Armour/RightFoot/PriestsRightBoot/RB = new

			R.loc = src
			LB.loc = src
			RB.loc = src

			R.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"

			src.WChest = R
			src.WLeftFoot = LB
			src.WRightFoot = RB
			for(var/obj/Items/Z in src)
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer
			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)

			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.NormalAI()
			src.Regen()
			var/obj/Misc/Beards/HumanoidBeard/B = new
			src.Beard = B
			if(src.WHead == null)
				src.overlays += src.Beard

/mob/NPC/Good/Human_Monk_of_Order
	icon = 'human.dmi'
	icon_state = "N"
	Race = "Human"

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
	Agility = 50
	Endurance = 50
	Intelligence = 50

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50

	SwordSkillMulti = 0.5
	AxeSkillMulti = 0.5
	SpearSkillMulti = 0.5
	BluntSkillMulti = 0.5
	RangedSkillMulti = 0.5
	DaggerSkillMulti = 0.5
	UnarmedSkillMulti = 0.5

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Monk_of_Order/New()
	spawn(10)
		if(src)
			src.GiveRaceLanguages()
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Items/Armour/Chest/PriestRobe/R = new
			var/obj/Items/Armour/LeftFoot/PriestsLeftBoot/LB = new
			var/obj/Items/Armour/RightFoot/PriestsRightBoot/RB = new

			R.loc = src
			LB.loc = src
			RB.loc = src

			R.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"

			src.WChest = R
			src.WLeftFoot = LB
			src.WRightFoot = RB
			for(var/obj/Items/Z in src)
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer
			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)

			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.InquisitiveAI()
			src.Regen()
			src.GiveName()
			src.Ressurect()
			src.name = "[src.name] The Monk"

/mob/NPC/Good/Human_Priest_of_Order
	icon = 'human.dmi'
	icon_state = "N"
	Race = "Human"

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

	Strength = 60
	Agility = 50
	Endurance = 60
	Intelligence = 60

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 60
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 60

	SwordSkillMulti = 0.5
	AxeSkillMulti = 0.5
	SpearSkillMulti = 0.5
	BluntSkillMulti = 0.5
	RangedSkillMulti = 0.5
	DaggerSkillMulti = 0.5
	UnarmedSkillMulti = 0.5

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Dragons","Undead","Chaos","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Good/Human_Priest_of_Order/New()
	spawn(10)
		if(src)
			src.GiveRaceLanguages()
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Items/Weapons/Blunts/InquisitorsStaff/SW = new
			var/obj/Items/Armour/Head/PriestHelmet/H = new
			var/obj/Items/Armour/Chest/PriestRobe/R = new
			var/obj/Items/Armour/UpperBody/PriestsChestPlate/C = new
			var/obj/Items/Armour/Waist/PriestBelt/B = new
			var/obj/Items/Armour/Shoulders/PriestsPauldrons/S = new
			var/obj/Items/Armour/LeftArm/PriestsLeftGauntlet/LG = new
			var/obj/Items/Armour/RightArm/PriestsRightGauntlet/RG = new
			var/obj/Items/Armour/LeftFoot/PriestsLeftBoot/LB = new
			var/obj/Items/Armour/RightFoot/PriestsRightBoot/RB = new

			R.loc = src
			C.loc = src
			B.loc = src
			LG.loc = src
			RG.loc = src
			LB.loc = src
			RB.loc = src
			S.loc = src
			H.loc = src
			SW.loc = src

			R.suffix = "Equip"
			C.suffix = "Equip"
			B.suffix = "Equip"
			LG.suffix = "Equip"
			RG.suffix = "Equip"
			LB.suffix = "Equip"
			RB.suffix = "Equip"
			S.suffix = "Equip"
			H.suffix = "Equip"
			SW.suffix = "Equip"

			src.WChest = R
			src.WUpperBody = C
			src.WShoulders = S
			src.WLeftHand = LG
			src.WRightHand = RG
			src.WLeftFoot = LB
			src.WRightFoot = RB
			src.WWaist = B
			src.WHead = H
			src.Weapon = SW
			for(var/obj/Items/Z in src)
				if(Z.Defence)
					Z.Defence = Z.Defence / 2
				Z.Dura = 100
				Z.icon_state = Z.EquipState
				Z.layer = Z.ItemLayer
			src.overlays+=image(C.icon,C.icon_state,C.ItemLayer)
			src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
			src.overlays+=image(B.icon,B.icon_state,B.ItemLayer)
			src.overlays+=image(LG.icon,LG.icon_state,LG.ItemLayer)
			src.overlays+=image(RG.icon,RG.icon_state,RG.ItemLayer)
			src.overlays+=image(LB.icon,LB.icon_state,LB.ItemLayer)
			src.overlays+=image(RB.icon,RB.icon_state,RB.ItemLayer)
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
			src.overlays+=image(SW.icon,SW.icon_state,SW.ItemLayer)

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
			var/obj/Items/Currency/GoldCoin/Gold = new
			Gold.loc = src
			Gold.suffix = "Carried"
			Gold.Type = rand(10,25)
			Gold.name = "[Gold.Type] Gold Coins"
			Gold.CoinAdjust()

/mob/NPC/Evil/Misc/Human_Heretic
	icon = 'human.dmi'
	icon_state = "N"
	Type = "Bandits"
	Race = "Human"

	Head = 50
	Torso = 50
	LeftArm = 50
	RightArm = 50
	LeftLeg = 50
	RightLeg = 50

	Skull = 50
	Brain = 50
	LeftEye = 50
	RightEye = 50
	LeftEar = 50
	RightEar = 50
	Teeth = 50
	Nose = 50
	Tongue = 50
	Throat = 50

	Heart = 50
	LeftLung = 50
	RightLung = 50
	Spleen = 50
	Intestine = 50
	LeftKidney = 50
	RightKidney = 50
	Liver = 50
	Bladder = 50
	Stomach = 50

	Strength = 7
	Agility = 7
	Endurance = 7
	Intelligence = 5

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 7
	AxeSkill = 7
	SpearSkill = 7
	BluntSkill = 7
	RangedSkill = 7
	DaggerSkill = 7
	UnarmedSkill = 7

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2

	Soul = 0

	Blood = 50
	BloodMax = 50
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire Unholy"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Snakeman Empire","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Human_Heretic/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"
		src.icon = 'Human(F).dmi'
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.GiveName()
	src.GiveHair()
	src.name = "[src.name] The Heretic"
	var/obj/Items/Weapons/Daggers/Dagger/D = new
	D.Material = "Iron"
	D.RandomItemQuality()
	src.Weapon = D
	D.suffix = "Equip"
	D.loc = src
	var/obj/Items/Armour/UpperBody/LeatherVest/LV = new
	src.WChest = LV
	LV.suffix = "Equip"
	LV.loc = src
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
	var/obj/Items/Armour/Back/ClothCape/CC = new
	src.WBack = CC
	CC.suffix = "Equip"
	CC.loc = src
	for(var/obj/Items/Z in src)
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer
	src.overlays+=image(LGR.icon,LGR.icon_state,LGR.ItemLayer)
	src.overlays+=image(LGL.icon,LGL.icon_state,LGL.ItemLayer)
	src.overlays+=image(LBR.icon,LBR.icon_state,LBR.ItemLayer)
	src.overlays+=image(LBL.icon,LBL.icon_state,LBL.ItemLayer)
	src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
	src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
	src.overlays+=image(D.icon,D.icon_state,D.ItemLayer)
	src.overlays+=image(CC.icon,CC.icon_state,CC.ItemLayer)

/mob/NPC/Evil/Misc/Human_Bandit
	icon = 'human.dmi'
	icon_state = "N"
	Type = "Bandits"
	Race = "Human"

	Head = 65
	Torso = 65
	LeftArm = 65
	RightArm = 65
	LeftLeg = 65
	RightLeg = 65

	Skull = 65
	Brain = 65
	LeftEye = 65
	RightEye = 65
	LeftEar = 65
	RightEar = 65
	Teeth = 65
	Nose = 65
	Tongue = 65
	Throat = 65

	Heart = 65
	LeftLung = 65
	RightLung = 65
	Spleen = 65
	Intestine = 65
	LeftKidney = 65
	RightKidney = 65
	Liver = 65
	Bladder = 65
	Stomach = 65

	Strength = 10
	Agility = 10
	Endurance = 10
	Intelligence = 5

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 10

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2

	Soul = 0

	Blood = 60
	BloodMax = 60
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Human Empire Outlaw"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Snakeman Empire","Human Empire Unholy","Ratling Hordes","None")

/mob/NPC/Evil/Misc/Human_Bandit/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"
		src.icon = 'Human(F).dmi'
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.GiveName()
	src.GiveHair()
	src.name = "[src.name] The Bandit"
	var/obj/Items/Weapons/Swords/Sabre/S = new
	S.Material = "Iron"
	S.RandomItemQuality()
	src.Weapon = S
	S.suffix = "Equip"
	S.loc = src
	var/obj/Items/Armour/Chest/ChainShirt/CS = new
	CS.Material = "Iron"
	CS.RandomItemQuality()
	src.WChest = CS
	CS.suffix = "Equip"
	CS.loc = src
	var/obj/Items/Armour/UpperBody/LeatherVest/LV = new
	src.WChest = LV
	LV.suffix = "Equip"
	LV.loc = src
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
	for(var/obj/Items/Q in src)
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState
	src.overlays+=image(LGR.icon,LGR.icon_state,LGR.ItemLayer)
	src.overlays+=image(LGL.icon,LGL.icon_state,LGL.ItemLayer)
	src.overlays+=image(LBR.icon,LBR.icon_state,LBR.ItemLayer)
	src.overlays+=image(LBL.icon,LBL.icon_state,LBL.ItemLayer)
	src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
	src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
	src.overlays+=image(CS.icon,CS.icon_state,CS.ItemLayer)
	src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.loc = src
	Gold.suffix = "Carried"
	Gold.Type = rand(2,5)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()
	spawn(10)
		if(src.Type == "Leader")
			src.NormalAI()
			return
		var/FoundLeader = 0
		for(var/mob/NPC/M in view(4,src))
			if(M.Type == "Leader")
				src.Owner = M
				FoundLeader = 1
		if(FoundLeader)
			src.FollowAI()
		else
			src.NormalAI()
