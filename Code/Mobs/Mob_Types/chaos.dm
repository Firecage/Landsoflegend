/mob/NPC/Evil/Chaos/Chaos_Entity
	name = "{NPC} Chaos Entity"
	icon = 'creatures.dmi'
	icon_state = "chaos"

	Race = "Chaos"

	Humanoid = 0

	Strength = 1
	Agility = 50
	Endurance = 10
	Intelligence = 10

	StrengthMulti = 0.1
	AgilityMulti = 0.3
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
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
	UnarmedSkillMulti = 0.3

	Claws = 100

	Blood = 0
	BloodMax = 0

	HP = 50
	HPMAX = 50

	Soul = 0

	Faction = "Chaos"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","None","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Chaos_Entity/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.Attack()
	src.ChaosAI()
