/mob/NPC/Evil/Chaos/Illithid_Elder_God
	name = "{NPC} Illithid Elder God"
	icon = 'elder god.dmi'
	Race = "Chaos"

	Humanoid = 0

	Strength = 25
	Agility = 50
	Endurance = 25
	Intelligence = 100

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
	UnarmedSkill = 33

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.3

	Claws = 100

	Blood = 100
	BloodMax = 100

	HP = 150
	HPMAX = 150

	Soul = 0

	Faction = "Illithid Cultists"
	CanEat = 1
	HungerMulti = 0.5
	Hunger = 100
	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Ratling Hordes","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","None","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Illithid_Elder_God/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.Attack()
	src.ElderGodAI()
	src.HungerTick()
	var/obj/Misc/Languages/Ancient/L = new
	L.SpeakPercent = 100
	L.WritePercent = 100
	src.LangKnow += L
	src.CurrentLanguage = L
	src.Ressurect()
