/mob/NPC/Evil/Misc/Drake
	layer = 7.1
	Race = "Dragon"

/mob/NPC/Evil/Misc/Drake/Drake_TR
	name = "{NPC} Drake"
	icon = 'creatures.dmi'
	icon_state = "drake tr"

/mob/NPC/Evil/Misc/Drake/Drake_TR/New()
	src.pixel_y = 32

/mob/NPC/Evil/Misc/Drake/Drake_TL
	name = "{NPC} Drake"
	icon = 'creatures.dmi'
	icon_state = "drake tl"

/mob/NPC/Evil/Misc/Drake/Drake_TL/New()
	src.pixel_x = -32
	src.pixel_y = 32

/mob/NPC/Evil/Misc/Drake/Drake_BL
	name = "{NPC} Drake"
	icon = 'creatures.dmi'
	icon_state = "drake bl"

/mob/NPC/Evil/Misc/Drake/Drake_BL/New()
	pixel_x = -32

/mob/NPC/Evil/Misc/Drake/Drake
	name = "{NPC} Drake"
	icon = 'creatures.dmi'
	icon_state = "drake br"

	Humanoid = 0

	Strength = 75
	Agility = 70
	Endurance = 75
	Intelligence = 20

	StrengthMulti = 0.3
	AgilityMulti = 0.3
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.3

	SwordSkill = 70
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
	UnarmedSkillMulti = 0.3

	Claws = 100

	Blood = 500
	BloodMax = 500
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 1000
	HPMAX = 1000

	Soul = 0

	Faction = "Dragons"

	HateList = list("Illithid Cultists","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Spider Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes","None","Cyclops Hordes")

/mob/NPC/Evil/Misc/Drake/Drake/New()
	spawn(1)
		var/image/I = new('Target.dmi',src)
		src.TargetIcon = I

		src.DeadIcon = 'corpses.dmi'
		src.DeadState = "drake corpse left"
		src.Attack()
		src.BloodFlow()
		var/mob/NPC/Evil/Misc/Drake/Drake_BL/D1 = new
		var/mob/NPC/Evil/Misc/Drake/Drake_TL/D2 = new
		var/mob/NPC/Evil/Misc/Drake/Drake_TR/D3 = new
		src.overlays += D1
		src.overlays += D2
		src.overlays += D3
		src.NormalAI()
