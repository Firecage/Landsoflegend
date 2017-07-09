/mob/NPC/Evil/Misc/Scorpion
	name = "{NPC} Scorpion"
	icon = 'creatures.dmi'
	icon_state = "scorpion"
	Race = "Scorpion"
	Type = "DesertArea"

	Humanoid = 0

	Strength = 7
	Agility = 7
	Endurance = 15
	Intelligence = 2

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 20
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 10

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 50
	BloodMax = 50
	BloodColour = /obj/Misc/Gore/GreenBloodSplat/
	BloodWallColour = /obj/Misc/Gore/GreenWallBloodSplat/

	HP = 75
	HPMAX = 75

	Soul = 0

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Spider Hordes","Cyclops Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Scorpion/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "scorpion corpse"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

/mob/NPC/Evil/Misc/Large_Scorpion
	name = "{NPC} Large Scorpion"
	icon = 'creatures.dmi'
	icon_state = "large scorpion"
	Race = "LargeScorpion"
	Type = "DesertArea"

	Humanoid = 0

	Strength = 17
	Agility = 17
	Endurance = 25
	Intelligence = 2

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 20
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 20

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 100
	BloodMax = 100
	BloodColour = /obj/Misc/Gore/GreenBloodSplat/
	BloodWallColour = /obj/Misc/Gore/GreenWallBloodSplat/

	HP = 150
	HPMAX = 150

	Soul = 0

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Spider Hordes","Cyclops Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Large_Scorpion/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "large scorpion corpse"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
