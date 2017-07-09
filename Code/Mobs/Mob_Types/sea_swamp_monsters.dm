/mob/NPC/Evil/Misc/Sea_Monster
	name = "{NPC} Sea Monster"
	icon = 'creatures.dmi'
	icon_state = "sea monster"

	Race = "Sea Monster"

	Humanoid = 0

	Strength = 20
	Agility = 30
	Endurance = 20
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.3
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.05

	SwordSkill = 25
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 135
	BloodMax = 135
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 200
	HPMAX = 200

	Soul = 0

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Sea_Monster/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "sea monster corpse"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

/mob/NPC/Evil/Misc/Swamp_Monster
	name = "{NPC} Swamp Monster"
	icon = 'creatures.dmi'
	icon_state = "swamp monster"
	Race = "Monster"
	Type = "SwampArea"

	Humanoid = 0

	Strength = 18
	Agility = 12
	Endurance = 25
	Intelligence = 2

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 22
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 22

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/GreenBloodSplat/
	BloodWallColour = /obj/Misc/Gore/GreenWallBloodSplat/

	HP = 200
	HPMAX = 200

	Soul = 0

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Spider Hordes","Cyclops Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Swamp_Monster/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "swamp monster corpse"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

