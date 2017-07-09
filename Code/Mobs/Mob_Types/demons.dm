/mob/NPC/Evil/Demonic
	see_in_dark = 6

/mob/NPC/Evil/Demonic/ArchDemon
	name = "{NPC} Arch Demon"
	icon = 'Arch Demon.dmi'

	Humanoid = 1

	Head = 200
	Torso = 200
	LeftArm = 200
	RightArm = 200
	LeftLeg = 200
	RightLeg = 200

	Skull = 200
	Brain = 200
	LeftEye = 200
	RightEye = 200
	LeftEar = 200
	RightEar = 200
	Teeth = 200
	Nose = 200
	Tongue = 200
	Throat = 200

	Heart = 200
	LeftLung = 200
	RightLung = 200
	Spleen = 200
	Intestine = 200
	LeftKidney = 200
	RightKidney = 200
	Liver = 200
	Bladder = 200
	Stomach = 200

	Strength = 100
	Agility = 100
	Endurance = 100
	Intelligence = 50

	StrengthMulti = 2
	AgilityMulti = 2
	EnduranceMulti = 2
	IntelligenceMulti = 2

	SwordSkill = 100
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 100

	SwordSkillMulti = 1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 666
	BloodMax = 666
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Soul = 0

	Faction = "Demonic Legions"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Demonic/ArchDemon/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

	var/obj/Misc/Languages/Demonic/L = new
	L.SpeakPercent = 100
	L.WritePercent = 100
	src.LangKnow += L
	src.CurrentLanguage = L

/mob/NPC/Evil/Demonic/GreaterDemon
	name = "{NPC} Greater Demon"
	icon = 'demon3.dmi'
	icon_state = "N"

	Humanoid = 1

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

	Strength = 80
	Agility = 80
	Endurance = 80
	Intelligence = 20

	StrengthMulti = 1
	AgilityMulti = 1
	EnduranceMulti = 1
	IntelligenceMulti = 1

	SwordSkill = 75
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50

	SwordSkillMulti = 1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 300
	BloodMax = 300
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Soul = 0

	Faction = "Demonic Legions"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Demonic/GreaterDemon/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Swords/DemonicSword/D = new
	src.Weapon = D
	D.suffix = "Equip"
	D.icon_state = D.EquipState
	src.overlays += D

	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

	var/obj/Misc/Languages/Demonic/L = new
	L.SpeakPercent = 100
	L.WritePercent = 100
	src.LangKnow += L
	src.CurrentLanguage = L

/mob/NPC/Evil/Demonic/Demon
	name = "{NPC} Demon"
	icon = 'demon2.dmi'
	icon_state = "N"

	Humanoid = 1

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

	Strength = 70
	Agility = 60
	Endurance = 70
	Intelligence = 10

	StrengthMulti = 0.5
	AgilityMulti = 0.4
	EnduranceMulti = 0.5
	IntelligenceMulti = 0.5

	SwordSkill = 60
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50

	SwordSkillMulti = 0.5
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Soul = 0

	Faction = "Demonic Legions"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Demonic/Demon/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/obj/Items/Weapons/Swords/DemonicSword/D = new
	src.Weapon = D
	D.suffix = "Equip"
	D.icon_state = D.EquipState
	src.overlays += D

	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

	var/obj/Misc/Languages/Demonic/L = new
	L.SpeakPercent = 100
	L.WritePercent = 100
	src.LangKnow += L
	src.CurrentLanguage = L
