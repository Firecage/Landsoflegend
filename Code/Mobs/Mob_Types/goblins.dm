/mob/NPC/Evil/Misc/Goblin
	name = "{NPC} Goblin"
	icon = 'goblin.dmi'
	icon_state = "N"
	Race = "Goblin"
	Type = "HatesLight"

	see_in_dark = 4

	Head = 40
	Torso = 40
	LeftArm = 40
	RightArm = 40
	LeftLeg = 40
	RightLeg = 40

	Skull = 40
	Brain = 40
	LeftEye = 40
	RightEye = 40
	LeftEar = 40
	RightEar = 40
	Teeth = 40
	Nose = 40
	Tongue = 40
	Throat = 40

	Heart = 40
	LeftLung = 40
	RightLung = 40
	Spleen = 40
	Intestine = 40
	LeftKidney = 40
	RightKidney = 40
	Liver = 40
	Bladder = 40
	Stomach = 40

	Strength = 5
	Agility = 10
	Endurance = 5
	Intelligence = 5

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

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2

	Blood = 45
	BloodMax = 45
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Soul = 0

	Faction = "Goblin Hordes"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Goblin/New()
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
	var/obj/Items/Currency/GoldCoin/Gold = new
	Gold.loc = src
	Gold.suffix = "Carried"
	Gold.Type = rand(1,3)
	Gold.name = "[Gold.Type] Gold Coins"
	Gold.CoinAdjust()
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
