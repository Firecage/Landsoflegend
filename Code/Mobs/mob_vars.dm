/mob/
///////////ANTI SPAM MOB VARS/////////////
	var/tmp/SGS_kick_for_repeat
	var/tmp/SGS_remember_txt
	var/tmp/SGS_locked = 0
///////////END OF ANTI SPAM MOB VARS/////////////

	var/WHead = null
	var/WChest = null
	var/WUpperBody = null
	var/WShoulders = null
	var/WLeftHand = null
	var/WRightHand = null
	var/WLegs = null
	var/WLeftFoot = null
	var/WRightFoot = null
	var/WWaist = null
	var/WBack = null
	var/WExtra = null

	var/Weapon = null
	var/Weapon2 = null

	var/Bleed = null
	var/BleedLast = 0
	var/BloodWallColour = null

	var/Pain = 0
	var/Fainted = 0
	var/Stunned = 0

	var/CanMove = 1
	var/CanAttack = 1
	var/CanSee = 1
	var/CanEat = 1
	var/CanSleep = 1
	var/CanBeRevived = 1
	var/CanEatBodies = 0
	var/CanEatRawMeats = 0 // 0 means you are guranteed to be posioned, 1 means that you can, but may get posioned, 2 means you can and will have no ill effects.
	var/CanSwimWell = 0
	var/CanRegenLimbs = 0
	var/CanBreathe = 1
	var/CanTakeDamage = 1 //For magic shields, ect.
	var/CanUseTK = 0 //Races that can use TK powers.

	var/OrginalName = null

	var/MouseLocationX = null
	var/MouseLocationY = null

	var/tmp/InvenUp = 0
	var/tmp/OOC = 1
	var/tmp/Moving = 1
	var/tmp/CanFireRanged = 1
	var/tmp/SleepNotice = 0
	var/tmp/EatNotice = 0
	var/tmp/StealNotice = 0
	var/tmp/Function = null
	var/tmp/Container = null
	var/tmp/Job = null
	var/tmp/GuardLoc = null
	var/tmp/Ready = 0
	var/tmp/UsingBook = null
	var/tmp/CantDoTask = 0
	var/tmp/Selling = null // List of objects a NPC is selling and that belong to them.

	var/GuardDir = null

	var/CurrentHand = "Right"
	var/DisableAttack = 0

	var/Age = 0
	var/Born = 0
	var/DieAge = 10000000

	var/StrengthMulti = 0
	var/AgilityMulti = 0
	var/EnduranceMulti = 0
	var/IntelligenceMulti = 0

	var/StrengthMax = 100
	var/AgilityMax = 100
	var/EnduranceMax = 100
	var/IntelligenceMax = 100

	var/SwordSkill = 1
	var/AxeSkill = 1
	var/SpearSkill = 1
	var/BluntSkill = 1
	var/RangedSkill = 1
	var/DaggerSkill = 1
	var/UnarmedSkill = 1

	var/SwordSkillMulti = 0
	var/AxeSkillMulti = 0
	var/SpearSkillMulti = 0
	var/BluntSkillMulti = 0
	var/RangedSkillMulti = 0
	var/DaggerSkillMulti = 0
	var/UnarmedSkillMulti = 0
	var/ShieldSkill = 0

	var/CarpentrySkill = 1
	var/MiningSkill = 1
	var/MasonarySkill = 1
	var/SmeltingSkill = 1
	var/ForgingSkill = 1
	var/WoodCuttingSkill = 1
	var/AlchemySkill = 1
	var/CookingSkill = 1
	var/ButcherySkill = 1
	var/SkinningSkill = 1
	var/LeatherCraftSkill = 1
	var/FishingSkill = 1
	var/BuildingSkill = 1
	var/FarmingSkill = 1
	var/WeavingSkill = 1
	var/EngravingSkill = 1
	var/FirstAidSkill = 1
	var/SwimmingSkill = 5
	var/BoneCraftSkill = 1

	var/CarpentrySkillMulti = 0
	var/MiningSkillMulti = 0
	var/MasonarySkillMulti = 0
	var/SmeltingSkillMulti = 0
	var/ForgingSkillMulti = 0
	var/WoodCuttingSkillMulti = 0
	var/AlchemySkillMulti = 0
	var/CookingSkillMulti = 0
	var/SkinningSkillMulti = 0
	var/ButcherySkillMulti = 0
	var/LeatherCraftSkillMulti = 0
	var/FishingSkillMulti = 0
	var/BuildingSkillMulti = 0
	var/FarmingSkillMulti = 0
	var/WeavingSkillMulti = 0
	var/EngravingSkillMulti = 0
	var/FirstAidSkillMulti = 0
	var/ShieldSkillMulti = 0
	var/SwimmingSkillMulti = 0.01
	var/BoneCraftMulti = 0

	var/HungerMulti = 0

	var/Necromancery = 0
	var/BloodMagic = 0
	var/AstralMagic = 0
	var/NatureMagic = 0
	var/WaterMagic = 0
	var/FireMagic = 0
	var/WindMagic = 0
	var/EarthMagic = 0
	var/MagicResistance = 10 // Default for now.
	var/MagicPotentcy = 0
	var/DiseaseResistance = 10 // Default for now
	var/CanUseMagic = 1

	var/StrCap = 11
	var/AgilCap = 11
	var/EndCap = 11
	var/IntCap = 11

	var/SkillCap = 11

	var/CurrentSkill = null
	var/CurrentSkillLevel = 0

	var/Energy = 0
	var/EnergyMax = 0

	var/LoggedIn = 0

	var/Hunger = 100
	var/Sleep = 100
	var/Sleeping = 0

	var/Dead = 0
	var/Soul = 1

	var/Gender = null

	var/DeadState = null
	var/DeadIcon = null

	var/Admin = 0
	var/AdminInvis = null

	var/Muted = 0

	var/HP = 0
	var/HPMAX = 0

	var/AdminEdit = 0
	var/AdminDelete = 0

	var/MoveSpeed = 1

	var/MortalWound = 0

	var/Class = null

	var/SpreadsAffliction = null

	var/Jailed = 0

	var/TargetIcon = null

	var/DarkVision = 0
	var/Vision = 4

	var/SparMode = 0

	var/RPpoints = 0

	var/InWater = 0

	var/SpeakingWith = null
	var/FollowUp = null

	var/StoredFaction = null
	var/PreviousFaction = null

	var/CurrentLanguage = null

	var/CancelDefaultProc = 0

	var/TextOutput = null

	var/CanExamine = 1
	var/CanInteract = 1

	var/HateList = list()
	var/KnowList = list()
	var/Afflictions = list()
	var/CreateList = list()

	var/LangKnow = list()

	var/Preg = 0 // 1 means an NPC birth, 2 for a Player, and 3 means they cant Mate for another year.
	var/PregType = null //How the person Breeds, Womb, Egg, Infection, ect.
	var/PregTimer = 0 //How long until they can have another baby.
	var/FatherStrength = 0
	var/FatherAgility = 0
	var/FatherEndurance = 0