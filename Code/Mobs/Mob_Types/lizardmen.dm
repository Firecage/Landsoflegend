/mob/NPC/Evil/Misc/Lizardman
	icon = 'lizardman.dmi'
	icon_state = "N"
	name = "{NPC} Lizardman"
	Race = "Lizardman"
	Head = 115
	Torso = 115
	LeftArm = 115
	RightArm = 115
	LeftLeg = 115
	RightLeg = 115

	Skull = 115
	Brain = 115
	LeftEye = 115
	RightEye = 115
	LeftEar = 115
	RightEar = 115
	Teeth = 115
	Nose = 115
	Tongue = 115
	Throat = 115

	Heart = 115
	LeftLung = 115
	RightLung = 115
	Spleen = 115
	Intestine = 115
	LeftKidney = 115
	RightKidney = 115
	Liver = 115
	Bladder = 115
	Stomach = 115

	Strength = 10
	Agility = 15
	Endurance = 15
	Intelligence = 1

	StrengthMulti = 0.13
	AgilityMulti = 0.13
	EnduranceMulti = 0.13
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 15
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 15
	ShieldSkill = 15

	SwordSkillMulti = 0.13
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.13
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.13

	Soul = 0

	Blood = 75
	BloodMax = 75
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/
	CanRegenLimbs = 1
	Claws = 100

	Faction = "Lizardman Tribes"

	HateList = list("Cyclops Hordes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Giant Hordes","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Spider Hordes","Goblin Hordes","Neutral","Human Empire Unholy","Human Empire Outlaw","Ratling Hordes")

/mob/NPC/Evil/Misc/Lizardman/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	src.DeadIcon = src.icon
	src.Attack()
	src.BloodFlow()
	src.NormalAI()
