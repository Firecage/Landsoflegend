/mob/NPC/Evil/Undead/Corpse_Devourer_Cacoon
	icon = 'misc.dmi'
	icon_state = "devourer cacoon"

	Race = "Undead"

	density = 0

	Humanoid = 0

	Type = "Egg"

	BloodColour = /obj/Misc/Gore/GreenBloodSplat/
	BloodWallColour = /obj/Misc/Gore/GreenWallBloodSplat/

	HP = 200
	HPMAX = 200

	Soul = 0

	Faction = "Undead"

/mob/NPC/Evil/Undead/Corpse_Devourer_Cacoon/Click()
	if(usr.Function == "Combat")
		usr.Target = src
		usr << "<b>You target [src]!<br>"

	if(usr.Function == "Pull")
		if(src in range(1,usr))
			if(usr.Pull == src)
				usr.Pull = null
				if(src.Pull == usr)
					src.Pull = null
				view(usr) << "<b>[usr] stops pulling [src]<br>"
				return
			if(src.suffix == null)
				if(usr.Pull == null)
					usr.Pull = src
					src.Pull = usr
					usr.Pull()
					view(usr) << "<b>[usr] starts pulling [src]<br>"
					return

/mob/NPC/Evil/Undead/Corpse_Devourer_Cacoon/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.DeadIcon = 'misc.dmi'
	src.DeadState = "devourer cacoon dead"
	src.BloodFlow()
	src.DevourerCacoonHatch()

/mob/NPC/Evil/Undead/Corpse_Devourer
	name = "{NPC} Corpse Devourer"
	icon = 'creatures.dmi'
	icon_state = "corpse devourer"

	Race = "Undead"

	Humanoid = 0

	Strength = 25
	Agility = 25
	Endurance = 35
	Intelligence = 5

	StrengthMulti = 0.2
	AgilityMulti = 0.2
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.05

	SwordSkill = 25
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 25

	SwordSkillMulti = 0.3
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	BloodColour = /obj/Misc/Gore/GreenBloodSplat/
	BloodWallColour = /obj/Misc/Gore/GreenWallBloodSplat/

	SpreadsAffliction = "Undead Bite"

	HP = 300
	HPMAX = 300

	Soul = 0

	Faction = "Undead"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Undead/Corpse_Devourer/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "devourer corpse"
	src.Attack()
	src.BloodFlow()
	src.DevourerAI()
