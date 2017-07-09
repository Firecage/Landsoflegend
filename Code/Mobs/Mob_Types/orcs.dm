/mob/NPC/Evil/Misc/Orc
	name = "{NPC} Orc"
	icon = 'orc.dmi'
	icon_state = "N"
	Race = "Orc"

	see_in_dark = 3

	Head = 125
	Torso = 125
	LeftArm = 125
	RightArm = 125
	LeftLeg = 125
	RightLeg = 125

	Skull = 125
	Brain = 125
	LeftEye = 125
	RightEye = 125
	LeftEar = 125
	RightEar = 125
	Teeth = 125
	Nose = 125
	Tongue = 125
	Throat = 125

	Heart = 125
	LeftLung = 125
	RightLung = 125
	Spleen = 125
	Intestine = 125
	LeftKidney = 125
	RightKidney = 125
	Liver = 125
	Bladder = 125
	Stomach = 125

	Strength = 20
	Agility = 15
	Endurance = 25
	Intelligence = 5

	StrengthMulti = 0.2
	AgilityMulti = 0.1
	EnduranceMulti = 0.25
	IntelligenceMulti = 0.1

	SwordSkill = 15
	AxeSkill = 15
	SpearSkill = 5
	BluntSkill = 15
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 15

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2

	Blood = 125
	BloodMax = 125
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Orc Hordes"

	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Goblin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Orc/New()
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
	var/obj/Items/Weapons/Daggers/Dagger/D = new
	D.Material = "Iron"
	D.RandomItemQuality()
	src.Weapon = D
	D.suffix = "Equip"
	D.loc = src
	for(var/obj/Items/Z in src)
		Z.Dura = 100
		Z.icon_state = Z.EquipState
		Z.layer = Z.ItemLayer
	src.overlays+=image(D.icon,D.icon_state,D.ItemLayer)
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
