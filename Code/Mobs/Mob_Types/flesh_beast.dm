/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/
	layer = 7.1
	Race = "Large Flesh Beast"

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_TR
	name = "Large Flesh Beast"
	icon = 'creatures.dmi'
	icon_state = "flesh beast TR"

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_TR/New()
	src.pixel_y = 32
	src.pixel_x = 32

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_TL
	name = "Large Flesh Beast"
	icon = 'creatures.dmi'
	icon_state = "flesh beast TL"

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_TL/New()
	src.pixel_y = 32

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_BR
	name = "Large Flesh Beast"
	icon = 'creatures.dmi'
	icon_state = "flesh beast BR"

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast_BR/New()
	src.pixel_x = 32

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast
	name = "{NPC} Large Flesh Beast"
	icon = 'creatures.dmi'
	icon_state = "flesh beast BL"

	Humanoid = 0

	Strength = 45
	Agility = 25
	Endurance = 60
	Intelligence = 2

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.4
	IntelligenceMulti = 0.1

	SwordSkill = 45
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.4
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 400
	BloodMax = 400
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 500
	HPMAX = 500

	Soul = 0

	Faction = "Chaos"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","None","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Large_Flesh_Beasts/Large_Flesh_Beast/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "flesh beast corpse left"
	src.Attack()
	src.BloodFlow()
	src.FleshAI()
	src.FleshBurst()

/mob/NPC/Evil/Chaos/Flesh_Beast
	name = "{NPC} Flesh Beast"
	icon = 'creatures.dmi'
	icon_state = "flesh beast"

	Race = "Chaos"

	Humanoid = 0

	Strength = 30
	Agility = 15
	Endurance = 40
	Intelligence = 1

	StrengthMulti = 0.2
	AgilityMulti = 0.1
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.05

	SwordSkill = 30
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 250
	HPMAX = 250

	Soul = 0

	Faction = "Chaos"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","None","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Flesh_Beast/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "flesh beast corpse"
	src.Attack()
	src.BloodFlow()
	src.BloodTrail()
	src.FleshAI()
