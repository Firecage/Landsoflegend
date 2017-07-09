/mob/NPC/Evil/Misc/Troll
	layer = 7.1
	Race = "Troll"
	Type = "HatesLight"

/mob/NPC/Evil/Misc/Troll/Troll_TR
	name = "{NPC} Troll"
	icon = 'creatures.dmi'
	icon_state = "troll TR"

/mob/NPC/Evil/Misc/Troll/Troll_TR/New()
	src.pixel_y = 32

/mob/NPC/Evil/Misc/Troll/Troll_TL
	name = "{NPC} Troll"
	icon = 'creatures.dmi'
	icon_state = "troll TL"

/mob/NPC/Evil/Misc/Troll/Troll_TL/New()
	src.pixel_x = -32
	src.pixel_y = 32

/mob/NPC/Evil/Misc/Troll/Troll_BL
	name = "{NPC} Troll"
	icon = 'creatures.dmi'
	icon_state = "troll BL"

/mob/NPC/Evil/Misc/Troll/Troll_BL/New()
	pixel_x = -32

/mob/NPC/Evil/Misc/Troll/Troll
	name = "{NPC} Troll"
	icon = 'creatures.dmi'
	icon_state = "troll BR"

	Humanoid = 0

	Strength = 35
	Agility = 20
	Endurance = 40
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 35

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.3

	Blood = 200
	BloodMax = 200
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 400
	HPMAX = 400

	Soul = 0

	Faction = "Goblin Hordes"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Troll/Troll/New()
	spawn(1)
		var/image/I = new('Target.dmi',src)
		src.TargetIcon = I
		src.DeadIcon = 'corpses.dmi'
		src.DeadState = "troll corpse left"
		src.Attack()
		src.BloodFlow()
		var/mob/NPC/Evil/Misc/Troll/Troll_BL/T1 = new
		var/mob/NPC/Evil/Misc/Troll/Troll_TL/T2 = new
		var/mob/NPC/Evil/Misc/Troll/Troll_TR/T3 = new
		src.overlays += T1
		src.overlays += T2
		src.overlays += T3
		src.NormalAI()
