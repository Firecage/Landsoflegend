/mob/NPC/Evil/Misc/Cyclops_Shaman
	name = "{NPC} Cyclops Shaman"
	icon = 'cyclops.dmi'
	icon_state = "N"
	Race = "Cyclops"

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
	Agility = 40
	Endurance = 60
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 50
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 60

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3

	Soul = 0

	Blood = 175
	BloodMax = 175
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Cyclops Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Spider Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Cyclops_Shaman/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Items/Armour/LeftFoot/GiantChainBootLeft/GBL = new
			GBL.Material = "Iron"
			GBL.RandomItemQuality()
			src.WLeftFoot = GBL
			GBL.suffix = "Equip"
			GBL.loc = src
			var/obj/Items/Armour/RightFoot/GiantChainBootRight/GBR = new
			GBR.Material = "Iron"
			GBR.RandomItemQuality()
			src.WRightFoot = GBR
			GBR.suffix = "Equip"
			GBR.loc = src
			var/obj/Items/Armour/RightArm/GiantChainGloveRight/GGR = new
			GGR.Material = "Iron"
			GGR.RandomItemQuality()
			src.WRightHand = GGR
			GGR.suffix = "Equip"
			GGR.loc = src
			var/obj/Items/Armour/LeftArm/GiantChainGloveLeft/GGL = new
			GGL.Material = "Iron"
			GGL.RandomItemQuality()
			src.WLeftHand = GGL
			GGL.suffix = "Equip"
			GGL.loc = src
			var/obj/Items/Armour/Chest/GiantChainShirt/IS = new
			IS.Material = "Iron"
			IS.RandomItemQuality()
			src.WChest = IS
			IS.suffix = "Equip"
			IS.loc = src
			var/obj/Items/Armour/UpperBody/GiantLeatherVest/LV = new
			src.WChest = LV
			LV.suffix = "Equip"
			LV.loc = src
			var/obj/Items/Armour/Legs/GiantChainLeggings/LL = new
			LL.Material = "Iron"
			LL.RandomItemQuality()
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.loc = src
			for(var/obj/Items/Q in src)
				Q.layer = Q.ItemLayer
				Q.icon_state = Q.EquipState
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
			src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)
			src.overlays+=image(GGR.icon,GGR.icon_state,GGR.ItemLayer)
			src.overlays+=image(GGL.icon,GGL.icon_state,GGL.ItemLayer)
			src.overlays+=image(GBR.icon,GBR.icon_state,GBR.ItemLayer)
			src.overlays+=image(GBL.icon,GBL.icon_state,GBL.ItemLayer)
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.Ressurect()

/mob/NPC/Evil/Misc/Cyclops_Guardsman_Patrol
	icon = 'cyclops.dmi'
	icon_state = "N"
	Type = "Town"
	Race = "Cyclops"

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
	Agility = 45
	Endurance = 65
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 50
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

	Blood = 160
	BloodMax = 160
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Cyclops Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Spider Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Cyclops_Guardsman_Patrol/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Armour/LeftFoot/GiantChainBootLeft/GBL = new
	GBL.Material = "Iron"
	GBL.RandomItemQuality()
	src.WLeftFoot = GBL
	GBL.suffix = "Equip"
	GBL.loc = src
	var/obj/Items/Armour/RightFoot/GiantChainBootRight/GBR = new
	GBR.Material = "Iron"
	GBR.RandomItemQuality()
	src.WRightFoot = GBR
	GBR.suffix = "Equip"
	GBR.loc = src
	var/obj/Items/Armour/RightArm/GiantChainGloveRight/GGR = new
	GGR.Material = "Iron"
	GGR.RandomItemQuality()
	src.WRightHand = GGR
	GGR.suffix = "Equip"
	GGR.loc = src
	var/obj/Items/Armour/LeftArm/GiantChainGloveLeft/GGL = new
	GGL.Material = "Iron"
	GGL.RandomItemQuality()
	src.WLeftHand = GGL
	GGL.suffix = "Equip"
	GGL.loc = src
	var/obj/Items/Armour/Chest/GiantChainShirt/IS = new
	IS.Material = "Iron"
	IS.RandomItemQuality()
	src.WChest = IS
	IS.suffix = "Equip"
	IS.loc = src
	var/obj/Items/Armour/UpperBody/GiantLeatherVest/LV = new
	src.WChest = LV
	LV.suffix = "Equip"
	LV.loc = src
	var/obj/Items/Armour/Legs/GiantChainLeggings/LL = new
	LL.Material = "Iron"
	LL.RandomItemQuality()
	src.WLegs = LL
	LL.suffix = "Equip"
	LL.loc = src
	var/obj/Items/Armour/Head/GiantChainCoif/CC = new
	CC.Material = "Iron"
	CC.RandomItemQuality()
	src.WHead = CC
	CC.suffix = "Equip"
	CC.loc = src
	var/obj/Items/Weapons/Blunts/Maul/M = new
	M.Material = "Iron"
	M.RandomItemQuality()
	src.Weapon = M
	M.suffix = "Equip"
	M.loc = src
	for(var/obj/Items/Q in src)
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState
	src.overlays+=image(M.icon,M.icon_state,M.ItemLayer)
	src.overlays+=image(CC.icon,CC.icon_state,CC.ItemLayer)
	src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
	src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
	src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)
	src.overlays+=image(GGR.icon,GGR.icon_state,GGR.ItemLayer)
	src.overlays+=image(GGL.icon,GGL.icon_state,GGL.ItemLayer)
	src.overlays+=image(GBR.icon,GBR.icon_state,GBR.ItemLayer)
	src.overlays+=image(GBL.icon,GBL.icon_state,GBL.ItemLayer)
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.Regen()
	src.GiveName()

/mob/NPC/Evil/Misc/Cyclops_Guardsman
	icon = 'cyclops.dmi'
	icon_state = "N"
	Race = "Cyclops"

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
	Agility = 45
	Endurance = 65
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 50
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

	Blood = 160
	BloodMax = 160
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Cyclops Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Spider Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Cyclops_Guardsman/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			var/obj/Items/Armour/LeftFoot/GiantChainBootLeft/GBL = new
			GBL.Material = "Iron"
			GBL.RandomItemQuality()
			src.WLeftFoot = GBL
			GBL.suffix = "Equip"
			GBL.loc = src
			var/obj/Items/Armour/RightFoot/GiantChainBootRight/GBR = new
			GBR.Material = "Iron"
			GBR.RandomItemQuality()
			src.WRightFoot = GBR
			GBR.suffix = "Equip"
			GBR.loc = src
			var/obj/Items/Armour/RightArm/GiantChainGloveRight/GGR = new
			GGR.Material = "Iron"
			GGR.RandomItemQuality()
			src.WRightHand = GGR
			GGR.suffix = "Equip"
			GGR.loc = src
			var/obj/Items/Armour/LeftArm/GiantChainGloveLeft/GGL = new
			GGL.Material = "Iron"
			GGL.RandomItemQuality()
			src.WLeftHand = GGL
			GGL.suffix = "Equip"
			GGL.loc = src
			var/obj/Items/Armour/Chest/GiantChainShirt/IS = new
			IS.Material = "Iron"
			IS.RandomItemQuality()
			src.WChest = IS
			IS.suffix = "Equip"
			IS.loc = src
			var/obj/Items/Armour/UpperBody/GiantLeatherVest/LV = new
			src.WChest = LV
			LV.suffix = "Equip"
			LV.loc = src
			var/obj/Items/Armour/Legs/GiantChainLeggings/LL = new
			LL.Material = "Iron"
			LL.RandomItemQuality()
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.loc = src
			var/obj/Items/Armour/Head/GiantChainCoif/CC = new
			CC.Material = "Iron"
			CC.RandomItemQuality()
			src.WHead = CC
			CC.suffix = "Equip"
			CC.loc = src
			var/obj/Items/Weapons/Blunts/Maul/M = new
			M.Material = "Iron"
			M.RandomItemQuality()
			src.Weapon = M
			M.suffix = "Equip"
			M.loc = src
			for(var/obj/Items/Q in src)
				Q.layer = Q.ItemLayer
				Q.icon_state = Q.EquipState
			src.overlays+=image(M.icon,M.icon_state,M.ItemLayer)
			src.overlays+=image(CC.icon,CC.icon_state,CC.ItemLayer)
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
			src.overlays+=image(IS.icon,IS.icon_state,IS.ItemLayer)
			src.overlays+=image(GGR.icon,GGR.icon_state,GGR.ItemLayer)
			src.overlays+=image(GGL.icon,GGL.icon_state,GGL.ItemLayer)
			src.overlays+=image(GBR.icon,GBR.icon_state,GBR.ItemLayer)
			src.overlays+=image(GBL.icon,GBL.icon_state,GBL.ItemLayer)
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.GiveName()

/mob/NPC/Evil/Misc/Evil_Cyclops
	icon = 'cyclops.dmi'
	icon_state = "N"
	Race = "Cyclops"

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

	Strength = 20
	Agility = 15
	Endurance = 20
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
	DaggerSkill = 5
	UnarmedSkill = 25

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.4

	Soul = 0

	Blood = 125
	BloodMax = 125
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Cyclops Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Spider Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Evil_Cyclops/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	src.GiveName()
	src.name = "[src.name] The Cyclops"
	var/obj/Items/Armour/UpperBody/GiantLeatherVest/LV = new
	src.WChest = LV
	LV.suffix = "Equip"
	LV.loc = src
	var/obj/Items/Armour/Legs/GiantLeatherLeggings/LL = new
	src.WLegs = LL
	LL.suffix = "Equip"
	LL.loc = src
	for(var/obj/Items/Q in src)
		Q.layer = Q.ItemLayer
		Q.icon_state = Q.EquipState
	src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
	src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
