/mob/NPC/Evil/Misc/Yeti/
	layer = 7.1

/mob/NPC/Evil/Misc/Yeti/Yeti_Top
	icon = 'yeti.dmi'
	icon_state = "Top"
	pixel_y = 32
	layer = 8

/mob/NPC/Evil/Misc/Yeti/Yeti_Right
	icon = 'yeti.dmi'
	icon_state = "Right"
	pixel_y = 32
	pixel_x = 32
	layer = 8

/mob/NPC/Evil/Misc/Yeti/Yeti_Left
	icon = 'yeti.dmi'
	icon_state = "Left"
	pixel_y = 32
	pixel_x = -32
	layer = 8

/mob/NPC/Evil/Misc/Yeti/Yeti_Bottom
	name = "{NPC} Yeti"
	icon = 'yeti.dmi'
	icon_state = "Bottom"
	Type = "SnowArea"
	Race = "Yeti"

	Humanoid = 0

	Strength = 35
	Agility = 25
	Endurance = 35
	Intelligence = 5

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 35
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

	HP = 400
	HPMAX = 400

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

mob/NPC/Evil/Misc/Yeti/Yeti_Bottom/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"
	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "yeti corpse left"
	src.Attack()
	src.BloodFlow()
	src.Regen()
	src.NormalAI()
	var/mob/NPC/Evil/Misc/Yeti/Yeti_Top/T = new
	src.overlays += T
	var/mob/NPC/Evil/Misc/Yeti/Yeti_Right/R = new
	src.overlays += R
	var/mob/NPC/Evil/Misc/Yeti/Yeti_Left/L = new
	src.overlays += L
	src.Noise()