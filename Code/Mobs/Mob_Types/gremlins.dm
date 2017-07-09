/mob/NPC/Evil/Misc/Gremlin
	name = "{NPC} Gremlin"
	icon = 'creatures.dmi'
	icon_state = "gremlin"
	Race = "Gremlin"

	see_in_dark = 5

	Humanoid = 0

	Strength = 2.5
	Agility = 30
	Endurance = 2.5
	Intelligence = 2.5

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
	UnarmedSkill = 10

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.2

	Claws = 100

	Soul = 0

	HP = 50
	HPMAX = 50

	Blood = 20
	BloodMax = 20
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Gremlin Hordes"

	HateList = list("Lizardman Tribes","Kobold Hordes","Goblin Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Gremlin/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
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