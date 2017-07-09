/mob/NPC/Evil/Misc/Wolfman_Warrior
	name = "{NPC} Wolfman Warrior"
	icon = 'wolfman white.dmi'
	icon_state = "N"
	Race = "Wolfman"

	Head = 100
	Torso = 100
	LeftArm = 100
	RightArm = 100
	LeftLeg = 100
	RightLeg = 100

	Skull = 100
	Brain = 100
	LeftEye = 100
	RightEye = 100
	LeftEar = 100
	RightEar = 100
	Teeth = 100
	Nose = 100
	Tongue = 100
	Throat = 100

	Heart = 100
	LeftLung = 100
	RightLung = 100
	Spleen = 100
	Intestine = 100
	LeftKidney = 100
	RightKidney = 100
	Liver = 100
	Bladder = 100
	Stomach = 100

	Strength = 55
	Agility = 55
	Endurance = 55
	Intelligence = 1

	StrengthMulti = 0.2
	AgilityMulti = 0.1
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3

	Soul = 0

	Blood = 110
	BloodMax = 110
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Spider Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Wolfman_Warrior/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()

/mob/NPC/Evil/Misc/Wolfman_Shaman
	name = "{NPC} Wolfman Shaman"
	icon = 'wolfman white.dmi'
	icon_state = "N"
	Race = "Wolfman"

	Head = 100
	Torso = 100
	LeftArm = 100
	RightArm = 100
	LeftLeg = 100
	RightLeg = 100

	Skull = 100
	Brain = 100
	LeftEye = 100
	RightEye = 100
	LeftEar = 100
	RightEar = 100
	Teeth = 100
	Nose = 100
	Tongue = 100
	Throat = 100

	Heart = 100
	LeftLung = 100
	RightLung = 100
	Spleen = 100
	Intestine = 100
	LeftKidney = 100
	RightKidney = 100
	Liver = 100
	Bladder = 100
	Stomach = 100

	Strength = 55
	Agility = 55
	Endurance = 55
	Intelligence = 1

	StrengthMulti = 0.3
	AgilityMulti = 0.2
	EnduranceMulti = 0.3
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 50

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.3
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.3

	Soul = 0

	Blood = 135
	BloodMax = 135
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Spider Hordes","Goblin Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Wolfman_Shaman/New()
	spawn(10)
		if(src)
			var/image/I = new('Target.dmi',src)
			src.TargetIcon = I
			src.GuardLoc = src.loc
			src.GuardDir = src.dir
			src.DeadIcon = src.icon
			src.Attack()
			src.BloodFlow()
			src.GuardAI()
			src.Regen()
			src.Ressurect()