/mob/NPC/Evil/Undead
	see_in_dark = 6

/mob/NPC/Evil/Undead/Mummy
	name = "{NPC} Mummy"
	Fuel = 100
	icon = 'mummy.dmi'
	icon_state = "N"

	Race = "Skeleton"

	Head = 100
	Torso = 100
	LeftArm = 100
	RightArm = 100
	LeftLeg = 100
	RightLeg = 100

	Skull = 100
	Brain = 0
	LeftEye = 0
	RightEye = 0
	LeftEar = 0
	RightEar = 0
	Teeth = 100
	Nose = 0
	Tongue = 0
	Throat = 0

	Heart = 0
	LeftLung = 0
	RightLung = 0
	Spleen = 0
	Intestine = 0
	LeftKidney = 0
	RightKidney = 0
	Liver = 0
	Bladder = 0
	Stomach = 0

	Strength = 20
	Agility = 20
	Endurance = 40
	Intelligence = 20

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.1

	SwordSkill = 20
	AxeSkill = 20
	SpearSkill = 20
	BluntSkill = 20
	RangedSkill = 20
	DaggerSkill = 20
	UnarmedSkill = 25

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3

	Soul = 0

	Blood = 0
	BloodMax = 0

	Faction = "Undead"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Undead/Mummy/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.Attack()
	src.NormalAI()

/mob/NPC/Evil/Undead/Undead_Skeleton_Lord
	name = "{NPC} Undead Skeleton Lord"
	Fuel = 0
	icon = 'skeleton.dmi'
	icon_state = "N"

	Race = "Skeleton"
	Type = "Skeleton"

	Head = 50
	Torso = 75
	LeftArm = 75
	RightArm = 75
	LeftLeg = 75
	RightLeg = 75

	Skull = 50
	Brain = 0
	LeftEye = 0
	RightEye = 0
	LeftEar = 0
	RightEar = 0
	Teeth = 50
	Nose = 0
	Tongue = 0
	Throat = 0

	Heart = 0
	LeftLung = 0
	RightLung = 0
	Spleen = 0
	Intestine = 0
	LeftKidney = 0
	RightKidney = 0
	Liver = 0
	Bladder = 0
	Stomach = 0

	Strength = 20
	Agility = 17
	Endurance = 20
	Intelligence = 20

	StrengthMulti = 0.2
	AgilityMulti = 0.2
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.2

	SwordSkill = 20
	AxeSkill = 20
	SpearSkill = 20
	BluntSkill = 20
	RangedSkill = 20
	DaggerSkill = 20
	UnarmedSkill = 20

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2

	Soul = 0

	Blood = 0
	BloodMax = 0

	Faction = "Undead"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Undead/Undead_Skeleton_Lord/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Swords/LongSword/SW = new
	var/obj/Items/Armour/Chest/ChainShirt/R = new
	var/obj/Items/Armour/Legs/ChainLeggings/L = new
	var/obj/Items/Armour/LeftFoot/PlateBootLeft/BL = new
	var/obj/Items/Armour/RightFoot/PlateBootRight/BR = new
	var/obj/Items/Armour/LeftArm/PlateGauntletLeft/GL = new
	var/obj/Items/Armour/RightArm/PlateGauntletRight/GR = new
	var/obj/Items/Armour/UpperBody/ChestPlate/ICP = new

	R.loc = src
	SW.loc = src
	L.loc = src
	BL.loc = src
	BR.loc = src
	GL.loc = src
	GR.loc = src
	ICP.loc = src

	R.Material = "Iron"
	R.RandomItemQuality()
	GL.Material = "Iron"
	GL.RandomItemQuality()
	BL.Material = "Iron"
	BL.RandomItemQuality()
	L.Material = "Iron"
	L.RandomItemQuality()
	GR.Material = "Iron"
	GR.RandomItemQuality()
	BR.Material = "Iron"
	BR.RandomItemQuality()
	ICP.Material = "Iron"
	ICP.RandomItemQuality()

	R.suffix = "Equip"
	SW.suffix = "Equip"
	L.suffix = "Equip"
	BL.suffix = "Equip"
	BR.suffix = "Equip"
	GL.suffix = "Equip"
	GR.suffix = "Equip"
	ICP.suffix = "Equip"

	SW.Material = "Iron"
	SW.RandomItemQuality()

	R.Dura = 25
	SW.Dura = 25
	L.Dura = 25
	BR.Dura = 25
	GL.Dura = 25
	GR.Dura = 25
	ICP.Dura = 25

	src.WLegs = L
	src.Weapon = SW
	src.WChest = R
	src.WRightFoot = BR
	src.WLeftFoot = BL
	src.WRightHand = GR
	src.WLeftHand = GL
	src.WUpperBody = ICP
	for(var/obj/Items/Z in src)
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(SW.icon,SW.icon_state,SW.ItemLayer)
	src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)
	src.overlays+=image(BR.icon,BR.icon_state,BR.ItemLayer)
	src.overlays+=image(BL.icon,BL.icon_state,BL.ItemLayer)
	src.overlays+=image(GR.icon,GR.icon_state,GR.ItemLayer)
	src.overlays+=image(GL.icon,GL.icon_state,GL.ItemLayer)
	src.overlays+=image(ICP.icon,ICP.icon_state,ICP.ItemLayer)

	src.Attack()
	src.NormalAI()
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.loc = src
	Gold.suffix = "Carried"
	Gold.Type = rand(10,25)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()

/mob/NPC/Evil/Undead/Lich
	name = "{NPC} Lich"
	Fuel = 0
	icon = 'lich.dmi'
	icon_state = "N"

	Race = "Skeleton"

	Head = 50
	Torso = 50
	LeftArm = 50
	RightArm = 50
	LeftLeg = 50
	RightLeg = 50

	Skull = 50
	Brain = 0
	LeftEye = 0
	RightEye = 0
	LeftEar = 0
	RightEar = 0
	Teeth = 50
	Nose = 0
	Tongue = 0
	Throat = 0

	Heart = 0
	LeftLung = 0
	RightLung = 0
	Spleen = 0
	Intestine = 0
	LeftKidney = 0
	RightKidney = 0
	Liver = 0
	Bladder = 0
	Stomach = 0

	Strength = 15
	Agility = 15
	Endurance = 40
	Intelligence = 50

	StrengthMulti = 0.15
	AgilityMulti = 0.15
	EnduranceMulti = 0.15
	IntelligenceMulti = 0.5

	SwordSkill = 12
	AxeSkill = 12
	SpearSkill = 12
	BluntSkill = 12
	RangedSkill = 12
	DaggerSkill = 12
	UnarmedSkill = 12

	SwordSkillMulti = 0.12
	AxeSkillMulti = 0.12
	SpearSkillMulti = 0.12
	BluntSkillMulti = 0.12
	RangedSkillMulti = 0.12
	DaggerSkillMulti = 0.12
	UnarmedSkillMulti = 0.12

	Soul = 0

	Blood = 0
	BloodMax = 0

	Faction = "Undead"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Undead/Lich/New()
	spawn(10)
		if(src)
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.GuardAI()
			src.EvilRessurect()
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Items/Armour/Chest/Robe/CP = new

			CP.loc = src

			CP.suffix = "Equip"

			src.WBack = CP

			CP.icon_state = CP.EquipState

			src.overlays+=image(CP.icon,CP.icon_state,CP.ItemLayer)
			src.Attack()

/mob/NPC/Evil/Undead/Undead_Skeleton
	name = "{NPC} Undead Skeleton"
	Fuel = 0
	icon = 'skeleton.dmi'
	icon_state = "N"

	Race = "Skeleton"
	Type = "Skeleton"

	Head = 25
	Torso = 50
	LeftArm = 50
	RightArm = 50
	LeftLeg = 50
	RightLeg = 50

	Skull = 25
	Brain = 0
	LeftEye = 0
	RightEye = 0
	LeftEar = 0
	RightEar = 0
	Teeth = 50
	Nose = 0
	Tongue = 0
	Throat = 0

	Heart = 0
	LeftLung = 0
	RightLung = 0
	Spleen = 0
	Intestine = 0
	LeftKidney = 0
	RightKidney = 0
	Liver = 0
	Bladder = 0
	Stomach = 0

	Strength = 10
	Agility = 7
	Endurance = 10
	Intelligence = 10

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 9
	AxeSkill = 9
	SpearSkill = 9
	BluntSkill = 9
	RangedSkill = 9
	DaggerSkill = 9
	UnarmedSkill = 9

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Soul = 0

	Blood = 0
	BloodMax = 0

	Faction = "Undead"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Undead/Undead_Skeleton/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.Attack()
	src.NormalAI()

/mob/NPC/Evil/Undead/Undead_Skeleton_Warrior
	name = "{NPC} Undead Skeleton Warrior"
	Fuel = 0
	icon = 'skeleton.dmi'
	icon_state = "N"

	Race = "Skeleton"
	Type = "Skeleton"

	Head = 25
	Torso = 50
	LeftArm = 50
	RightArm = 50
	LeftLeg = 50
	RightLeg = 50

	Skull = 25
	Brain = 0
	LeftEye = 0
	RightEye = 0
	LeftEar = 0
	RightEar = 0
	Teeth = 50
	Nose = 0
	Tongue = 0
	Throat = 0

	Heart = 0
	LeftLung = 0
	RightLung = 0
	Spleen = 0
	Intestine = 0
	LeftKidney = 0
	RightKidney = 0
	Liver = 0
	Bladder = 0
	Stomach = 0

	Strength = 15
	Agility = 11
	Endurance = 15
	Intelligence = 10

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 12
	AxeSkill = 12
	SpearSkill = 12
	BluntSkill = 12
	RangedSkill = 12
	DaggerSkill = 12
	UnarmedSkill = 12

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Soul = 0

	Blood = 0
	BloodMax = 0

	Faction = "Undead"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Undead/Undead_Skeleton_Warrior/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Swords/LongSword/SW = new
	var/obj/Items/Armour/Chest/ChainShirt/R = new
	var/obj/Items/Armour/Legs/ChainLeggings/L = new

	SW.loc = src
	R.loc = src
	L.loc = src

	R.suffix = "Equip"
	SW.suffix = "Equip"
	L.suffix = "Equip"
	SW.Material = "Iron"
	SW.RandomItemQuality()
	L.Material = "Iron"
	L.RandomItemQuality()

	R.Dura = 25
	SW.Dura = 25
	L.Dura = 25

	R.Material = "Iron"
	R.RandomItemQuality()

	src.WLegs = L
	src.Weapon = SW
	src.WChest = R
	for(var/obj/Items/Z in src)
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer
	src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
	src.overlays+=image(SW.icon,SW.icon_state,SW.ItemLayer)
	src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)

	src.Attack()
	src.NormalAI()
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.loc = src
	Gold.suffix = "Carried"
	Gold.Type = rand(1,5)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()
