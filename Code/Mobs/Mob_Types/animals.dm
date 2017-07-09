/mob/NPC/Evil/Chaos/Sewer_Rat
	name = "{NPC} Sewer Rat"
	icon = 'creatures.dmi'
	icon_state = "rat"

	Humanoid = 0

	Strength = 4
	Agility = 6
	Endurance = 4
	Intelligence = 2

	StrengthMulti = 0.1
	AgilityMulti = 0.2
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.1

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 30
	BloodMax = 30
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 15
	HPMAX = 15

	Soul = 0

	Faction = "Ratling Hordes"
	HateList = list("Illithid Cultists","Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Undead","Human Empire","Demonic Legions","Dangerous Beasts","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw")

/mob/NPC/Evil/Chaos/Sewer_Rat/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead rat"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

/mob/NPC/Neutral/Snake
	name = "{NPC} Snake"
	icon = 'creatures.dmi'
	icon_state = "snake"

	Humanoid = 0

	Strength = 3
	Agility = 6
	Endurance = 3
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 20
	BloodMax = 20
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 10
	HPMAX = 10

	Soul = 0

	Faction = "Snakeman Empire"

/mob/NPC/Neutral/Snake/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead snake"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/Rat
	name = "{NPC} Rat"
	icon = 'creatures.dmi'
	icon_state = "rat"

	Humanoid = 0

	Strength = 2
	Agility = 7
	Endurance = 2
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 15
	BloodMax = 15
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 5
	HPMAX = 5

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/Rat/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead rat"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/Chicken
	name = "{NPC} Chicken"
	icon = 'creatures.dmi'
	icon_state = "chicken"

	Humanoid = 0

	Strength = 2
	Agility = 5
	Endurance = 2
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 25
	BloodMax = 25
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 15
	HPMAX = 15

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/Chicken/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead chicken"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/ArcticRabbit
	name = "{NPC} Arctic Rabbit"
	icon = 'creatures.dmi'
	icon_state = "arctic rabbit"
	Type = "SnowArea"

	Humanoid = 0

	Strength = 3
	Agility = 5
	Endurance = 3
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 25
	BloodMax = 25
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 15
	HPMAX = 15

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/ArcticRabbit/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead arctic rabbit"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/Rabbit
	name = "{NPC} Rabbit"
	icon = 'creatures.dmi'
	icon_state = "rabbit"

	Humanoid = 0

	Strength = 2
	Agility = 5
	Endurance = 2
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 25
	BloodMax = 25
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 15
	HPMAX = 15

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/Rabbit/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead rabbit"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/ArcticFox
	name = "{NPC} Arctic Fox"
	icon = 'creatures.dmi'
	icon_state = "arctic fox"
	Type = "SnowArea"

	Humanoid = 0

	Strength = 5
	Agility = 7
	Endurance = 5
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.15
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 35
	BloodMax = 35
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 35
	HPMAX = 35

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/ArcticFox/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead arctic fox"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/Fox
	name = "{NPC} Fox"
	icon = 'creatures.dmi'
	icon_state = "fox"

	Humanoid = 0

	Strength = 5
	Agility = 7
	Endurance = 5
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.15
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 35
	BloodMax = 35
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 35
	HPMAX = 35

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/Fox/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead fox"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/PolarBear
	name = "{NPC} Polar Bear"
	icon = 'creatures.dmi'
	icon_state = "polar bear"
	Type = "SnowArea"

	Humanoid = 0

	Strength = 15
	Agility = 10
	Endurance = 20
	Intelligence = 1

	StrengthMulti = 0.2
	AgilityMulti = 0.1
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.01

	SwordSkill = 10
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 60
	BloodMax = 60
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 100
	HPMAX = 100

	Soul = 0

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Neutral/PolarBear/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead polar bear"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

/mob/NPC/Neutral/BlackWolf
	name = "{NPC} Black Wolf"
	icon = 'creatures.dmi'
	icon_state = "black wolf"

	Humanoid = 0

	Strength = 7
	Agility = 10
	Endurance = 7
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.1
	EnduranceMulti = 0.1
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 35
	BloodMax = 35
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 50
	HPMAX = 50

	Soul = 0

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Neutral/BlackWolf/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead black wolf"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

/mob/NPC/Neutral/Bear
	name = "{NPC} Bear"
	icon = 'creatures.dmi'
	icon_state = "bear"

	Humanoid = 0

	Strength = 15
	Agility = 10
	Endurance = 20
	Intelligence = 1

	StrengthMulti = 0.2
	AgilityMulti = 0.1
	EnduranceMulti = 0.2
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.2
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Claws = 100

	Blood = 50
	BloodMax = 50
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 100
	HPMAX = 100

	Soul = 0

	Faction = "Dangerous Beasts"

	HateList = list("Lizardman Tribes","Gremlin Hordes","Kobold Hordes","Stahlite Empire","Frogmen Hordes","Giant Hordes","Altherian Empire","Dragons","Demonic Legions","Undead","Human Empire","Chaos","Cyclops Hordes","Goblin Hordes","Spider Hordes","Snakeman Empire","Neutral","Human Empire Unholy","Human Empire Outlaw","None","Ratling Hordes")

/mob/NPC/Neutral/Bear/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I

	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"

	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead bear"
	src.Attack()
	src.BloodFlow()
	src.NormalAI()

/mob/NPC/Neutral/Deer
	name = "{NPC} Deer"
	icon = 'creatures.dmi'
	icon_state = "deer"

	Humanoid = 0

	Strength = 10
	Agility = 10
	Endurance = 5
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.2
	EnduranceMulti = 0.15
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 50
	BloodMax = 50
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 75
	HPMAX = 75

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/Deer/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	var/C
	if(G == 1)
		src.Gender = "Male"
		C = "dead deer m"
	if(G == 2)
		src.Gender = "Female"
		src.icon_state = "deer f"
		C = "dead deer f"
	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "[C]"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()

/mob/NPC/Neutral/Horse
	name = "{NPC} Horse"
	icon = 'creatures.dmi'
	icon_state = "horse"

	Humanoid = 0

	Strength = 20
	Agility = 15
	Endurance = 20
	Intelligence = 1

	StrengthMulti = 0.1
	AgilityMulti = 0.2
	EnduranceMulti = 0.15
	IntelligenceMulti = 0.01

	SwordSkill = 5
	AxeSkill = 5
	SpearSkill = 5
	BluntSkill = 5
	RangedSkill = 5
	DaggerSkill = 5
	UnarmedSkill = 5

	SwordSkillMulti = 0.1
	AxeSkillMulti = 0.1
	SpearSkillMulti = 0.1
	BluntSkillMulti = 0.1
	RangedSkillMulti = 0.1
	DaggerSkillMulti = 0.1
	UnarmedSkillMulti = 0.1

	Blood = 75
	BloodMax = 75
	BloodColour = /obj/Misc/Gore/BloodSplat/
	BloodWallColour = /obj/Misc/Gore/WallBloodSplat/

	HP = 125
	HPMAX = 125

	Soul = 0

	Faction = "Neutral"

/mob/NPC/Neutral/Horse/New()
	var/image/I = new('Target.dmi',src)
	src.TargetIcon = I
	var/G = rand(1,2)
	if(G == 1)
		src.Gender = "Male"
	if(G == 2)
		src.Gender = "Female"
	src.DeadIcon = 'corpses.dmi'
	src.DeadState = "dead [src.icon_state]"
	src.Attack()
	src.BloodFlow()
	src.AnimalAI()
