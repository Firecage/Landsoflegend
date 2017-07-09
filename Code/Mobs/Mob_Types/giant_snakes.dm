/mob/NPC/Evil/Misc/GiantSnake/GiantSnake_Top
	icon = 'creatures.dmi'
	icon_state = "giant snake top"
	pixel_y = 32
	layer = 8

/mob/NPC/Evil/Misc/GiantSnake/GiantSnake_Bottom
	name = "{NPC} Giant Snake"
	icon = 'creatures.dmi'
	icon_state = "giant snake bottom"
	Type = "DesertArea"
	Race = "GiantSnake"

	Humanoid = 0

	Strength = 20
	Agility = 35
	Endurance = 20
	Intelligence = 5

	StrengthMulti = 0.1
	AgilityMulti = 0.2
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 40
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.4

	Claws = 100

	Soul = 0

	HP = 325
	HPMAX = 325

	Blood = 150
	BloodMax = 150
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Snakeman Empire"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Goblin Hordes","Spider Hordes","Dangerous Beasts","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/GiantSnake/GiantSnake_Bottom/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"
	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "giant snake corpse left"
	src.Attack()
	src.BloodFlow()
	src.Regen()
	src.NormalAI()
	var/mob/NPC/Evil/Misc/GiantSnake/GiantSnake_Top/T = new
	src.overlays += T