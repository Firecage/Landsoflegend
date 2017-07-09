/mob/NPC/Evil/Misc/Baby_Giant_Spider
	name = "{NPC} Baby Giant Spider"
	icon = 'creatures.dmi'
	icon_state = "baby giant spider"
	Race = "GiantSpider"

	Humanoid = 0

	Strength = 5
	Agility = 10
	Endurance = 5
	Intelligence = 0.5

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 35
	BloodMax = 35
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 40
	HPMAX = 40

	Soul = 0

	Faction = "Spider Hordes"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Baby_Giant_Spider/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "baby giant spider corpse"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
	spawn(1500)
		if(src)
			view(src) << "<font color = purple>[src] begins to grow larger and more deadly!<br>"
			var/mob/NPC/Evil/Misc/Giant_Spider/GS = new
			GS.loc = src.loc
			del(src)

/mob/NPC/Evil/Misc/Giant_Spider
	name = "{NPC} Giant Spider"
	icon = 'creatures.dmi'
	icon_state = "giant spider"
	Race = "GiantSpider"

	Humanoid = 0

	Strength = 10
	Agility = 15
	Endurance = 10
	Intelligence = 2

	StrengthMulti = 0.1
	AgilityMulti = 0.2
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 15
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 15

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 60
	BloodMax = 60
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 100
	HPMAX = 100

	Soul = 0

	Faction = "Spider Hordes"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Giant_Spider/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "giant spider corpse"
	src.Attack()
	src.BloodFlow()
	src.SpiderAI()