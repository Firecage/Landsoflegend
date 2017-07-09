/mob/NPC/Evil/Misc/Kobold
	name = "{NPC} Kobold"
	icon = 'Kobold.dmi'
	icon_state = "N"
	Race = "Kobold"

	see_in_dark = 4

	Head = 30
	Torso = 30
	LeftArm = 30
	RightArm = 30
	LeftLeg = 30
	RightLeg = 30

	Skull = 30
	Brain = 30
	LeftEye = 30
	RightEye = 30
	LeftEar = 30
	RightEar = 30
	Teeth = 30
	Nose = 30
	Tongue = 30
	Throat = 30

	Heart = 30
	LeftLung = 30
	RightLung = 30
	Spleen = 30
	Intestine = 30
	LeftKidney = 30
	RightKidney = 30
	Liver = 30
	Bladder = 30
	Stomach = 30

	Strength = 5
	Agility = 15
	Endurance = 5
	Intelligence = 5

	StrengthMulti = 0.1
	AgilityMulti = 0.2
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 10
	UnarmedSkill = 5

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.2
	SpearSkillMulti = 0.2
	BluntSkillMulti = 0.2
	RangedSkillMulti = 0.2
	DaggerSkillMulti = 0.2
	UnarmedSkillMulti = 0.2

	Soul = 0

	Blood = 35
	BloodMax = 35
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	Faction = "Kobold Hordes"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Goblin Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Dangerous Beasts","Cyclops Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Evil/Misc/Kobold/New()
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
	D.Delete = 1
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
	Gold.Type = rand(1,2)
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