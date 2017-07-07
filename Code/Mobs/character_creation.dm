/mob/proc/RaceRules()
	src << "<font color = blue>These are the guidelines to Role Playing with the Race you have selected, these guidelines do not effect your character stat wise.<br>"
	if(src.Race == "Alther")
		src << "<font color = blue>Race - Alther<br>"
		src << "<font color = blue>Altherions know all races<br>"
		src << "<font color = blue>Altherions can worship any good god, they start out worshipping the God of Harvest or Beasts.<br>"
		src << "<font color = blue>Altherions hate the following races by default, Undead, Cyclops, Ratlings<br>"
		src << "<font color = blue>Altherions have heard of, but do not know how to use, Elemental Magic, Blood Magic, Chaos Magic, Astral Magic, Necromancy.<br>"
		src << "<font color = blue>Altherions can use Nature Magic for various tasks<br>"
		src << "<font color = blue>Altherions know of all their settlements and all Human towns.<br>"
		src << "<font color = blue>Altherions are a very proud race, and have very strong opinions on things they belive in. They are easily offended and can be quite arrogant at times. They do not wish to harm living beings, but will kill if needed, they hate the Undead, Demonic and Chaos races and have made it their mission to destroy them.<br>."
		src << "<font color = blue>Altherions do not fear death, but do not seek it.<br>"
	if(src.Race == "Ratling")
		src << "<font color = blue>Race - Ratling<br>"
		src << "<font color = blue>Ratlings know the following races, Giants, Cyclops, Undead, Humans, Altherions, Ratlings, Flesh Beast<br>"
		src << "<font color = blue>Ratlings have heard of but not seen, Liches, Chaos Entity, Corpse Devourer<br>"
		src << "<font color = blue>Ratlings can worship any god, they start out worshipping the God of Death.<br>"
		src << "<font color = blue>Ratlings hate the following races by default, Undead, Cyclops, Humans, Altherions, Giants<br>"
		src << "<font color = blue>Ratlings have heard of, but do not know how to use, Blood Magic, Chaos Magic, Necromancy.<br>"
		src << "<font color = blue>Ratlings only know of the sewer they are born in, they do however know there are more sewers in other towns.<br>"
		src << "<font color = blue>Ratlings are very alert and paranoid, they often fight each other over sleeping/living space and food. They tend to hate the sun light and wear cloaks to conceal them selves at day time. They are cunning and quick to anger, but will not openly appear so, they would rather hate an enemy secretly and back stab them later.<br>."
		src << "<font color = blue>Ratlings fear death when outnumbered.<br>"
	if(src.Race == "Frogman")
		src << "<font color = blue>Race - Frogman<br>"
		src << "<font color = blue>Frogmen know the following races, Altherions, Ratlings, Humans, Frogmen<br>"
		src << "<font color = blue>Frogmen have heard of but not seen, Giants, Cyclops, Chaos Entity, Flesh Beast, Corpse Devourer<br>"
		src << "<font color = blue>Frogmen can worship any god, they start out worshipping the Gods of Harvest and Beasts.<br>"
		src << "<font color = blue>Frogmen hate the following races by default, Ratlings<br>"
		src << "<font color = blue>Frogmen have heard of, but do not know how to use, Elemental Magic, Nature Magic, Blood Magic<br>"
		src << "<font color = blue>Frogmen know the location of all their swamps and often fight over them.<br>"
		src << "<font color = blue>Frogmen are very alert and easy to scare, they are brave in numbers. They are usually a friendly primitive people, but fight over breeding grounds during the summer. They are quick to anger if offended and have strong opinions about anything they belive in.<br>."
		src << "<font color = blue>Frogmen fear death if alone, but do not fear it in numbers.<br>"
	if(src.Race == "Cyclops")
		src << "<font color = blue>Race - Cyclops<br>"
		src << "<font color = blue>Cyclops know the following races, Ratlings, Giants, Cyclops, Humans, Undead<br>"
		src << "<font color = blue>Cyclops have heard of but not seen, Altherions, Frogmen, Liches, Chaos Entity, Flesh Beast, Corpse Devourer<br>"
		src << "<font color = blue>Cyclops can worship the Blood and Death god, but start off worshipping the God of Destruction.<br>"
		src << "<font color = blue>Cyclops hate the following races by default, Undead, Giants, Humans<br>"
		src << "<font color = blue>Cyclops have heard of, but do not know how to use, Elemental Magic, Nature Magic, Blood Magic, Chaos Magic, and Necromancy<br>"
		src << "<font color = blue>Cyclops know the location of all their caves.<br>"
		src << "<font color = blue>Cyclops get angry at anything they do not understand, which is most things. They have a short temper and hate anything beautiful. They get pychotic if hurt or hungry, which means they hate everyone they meet, even other Cyclops.<br>"
		src << "<font color = blue>Cyclops dont understand the concept of death, and thus do not fear it.<br>"
	if(src.Race == "Giant")
		src << "<font color = blue>Race - Giant<br>"
		src << "<font color = blue>Giants know the following races, Giants, Cyclops, Undead, Humans<br>"
		src << "<font color = blue>Giants have heard of but not seen, Altherions, Frogmen, Ratlings, Chaos Entity, Flesh Beast, Corpse Devourer<br>"
		src << "<font color = blue>Giants can worship any god, they start out with no worship to any god.<br>"
		src << "<font color = blue>Giants hate the following races by default, Undead, Cyclops<br>"
		src << "<font color = blue>Giants have heard of, but do not know how to use, Elemental Magic, Nature Magic<br>"
		src << "<font color = blue>Giants know the location of all their towns, but do not know the location of their caves, except for the one they start in.<br>"
		src << "<font color = blue>Giants can be very moody. They get angry when hungry or tired, but are quite gentle most of the time<br>."
		src << "<font color = blue>Giants fear death and do not seek it. They can however enter a berzerk state and ignore the thought of pain/death<br>"
	if(src.Race == "Stahlite")
		src << "<font color = blue>Race - Stahlite<br>"
		src << "<font color = blue>Stahlites know the following races, Ratlings, Giants, Cyclops, Frogmen, Altherions, Humans, Undead, Chaos Entity<br>"
		src << "<font color = blue>Stahlites have heard of but not seen, Liches, Flesh Beast, Corpse Devourer<br>"
		src << "<font color = blue>Stahlites can worship any god, they start out worshipping the God of Crafts.<br>"
		src << "<font color = blue>Stahlites hate the following races by default, Ratlings, Undead, Cyclops, Giants<br>"
		src << "<font color = blue>Stahlites have heard of, but do not know how to use, Elemental Magic, Nature Magic, Blood Magic, Chaos Magic, and Necromancy<br>"
		src << "<font color = blue>Stahlites know the location of all their mines and fortresses.<br>"
		src << "<font color = blue>Stahlites do not fear pain, but are a little wary of death, unless drunk.<br>"
	if(src.Race == "Human")
		src << "<font color = blue>Race - Human<br>"
		src << "<font color = blue>Humans know the following races, Ratlings, Giants, Cyclops, Frogmen, Altherions, Undead<br>"
		src << "<font color = blue>Humans have heard of but not seen, Liches, Chaos Entity, Flesh Beast, Corpse Devourer<br>"
		src << "<font color = blue>Humans can worship any god, they start out with no worship to any god.<br>"
		src << "<font color = blue>Humans hate the following races by default, Ratlings, Undead, Cyclops<br>"
		src << "<font color = blue>Humans have heard of, but do not know how to use, Elemental Magic, Nature Magic, Blood Magic, Astral Magic, Chaos Magic, and Necromancy<br>"
		src << "<font color = blue>Humans know the location of all their towns and any fallen towns/chapels taken by the undead.<br>"
		src << "<font color = blue>Humans fear death and do not seek it.<br>"
	if(src.Race == "Wolfman")
		src << "<font color = blue>Race - Wolfman<br>"
		src << "<font color = blue>Wolfmen know the following races, Ratlings, Giants, Cyclops, Frogmen, Altherions, Humans, Stahlite, Undead<br>"
		src << "<font color = blue>Wolfmen have heard of but not seen, Liches, Chaos Entity, Flesh Beast, Corpse Devourer<br>"
		src << "<font color = blue>Wolfmen tend to worship the gods of Beasts, Destruction and very rarely, Death.<br>"
		src << "<font color = blue>Wolfmen hate the following races by default, Ratlings, Humans, Cyclops, Giants, Frogmen, Altherians, Stahlite. <br>"
		src << "<font color = blue>Wolfmen do not know of any magics, except Nature magic, of which they know very little about.<br>"
		src << "<font color = blue>Wolfmen only know the location of their own camps or caves and requently fight with other packs.<br>"
		src << "<font color = blue>Wolfmen do not fear death, and being in a pack sends them berzerk in battle.<br>"
	if(src.Race == "Snakeman")
		src << "<font color = blue>Race - Snakeman<br>"
		src << "<font color = blue>Snakeman know the following races, Wolfmen, Ratlings, Giants, Cyclops, Frogmen, Altherions, Humans, Stahlite, Undead<br>"
		src << "<font color = blue>Snakeman have heard of but not seen, Liches, Chaos Entity, Flesh Beast, Corpse Devourer<br>"
		src << "<font color = blue>Snakeman are obessed with prolonging their own lives, so they worship the Gods of Blood, Death and Wisdom..<br>"
		src << "<font color = blue>Snakeman hate the following races by default, Ratlings, Cyclops, Frogmen, Altherians.<br>"
		src << "<font color = blue>Snakeman know all the magics of the world, but are mainly intrested in ones that manipulate others, or prolong ones life.<br>"
		src << "<font color = blue>Snakeman know the location of the Humans, Altherians and Stahlite settlements, as well as their own. And also know of the Ratlings hiding locations.<br>"
		src << "<font color = blue>Snakeman fear death above all else, and go to great lengths to make sure they do not meet their demise.<br>"
	if(src.Race == "Illithid")
		src << "<font color = blue>Race - Illithid<br>"
		src << "<font color = blue>Illithid have heard of and seen every race.<br>"
		src << "<font color = blue>Illithid do not feel hate, but dis-like all other races except those that dwell in the oceans. They are on good terms with the Frogmen.<br>"
		src << "<font color = blue>Illithid know about all kinds of Magic in this world. They are especially skilled in Astral Magic and use it to manipulate and enslave others using psionic powers.<br>"
		src << "<font color = blue>Illithid know every location of every races settlements and hiding spots.<br>"
		src << "<font color = blue>Illithid do not openly seek death but embrace it in the name of their god if needed.<br>"
		src << "<font color = blue>Illithid are bent on enslaving all races, using them as labour to rebuild their once massive Empire. Arriving upon this world many hundreds of years ago using a great Astral Gate, the Illithid originally enslaved much of the known races. However, thanks to the few free Altheiran mages, they were stopped and stranded here. Having no means to power their Astral Gate, the Illithids must use slaves to gather minerals needed. Illithids also eat and collect brains for their Elder God.<br>"
		src << "<font color = blue>Illithid can use Telekinesis on objects and people while the Interact button is on and they click and drag, it will drain their Tiredness, at which point they can not continue. Upon being attacked, you will deflect the damage with your mind but be drained of tiredness based on the damage.<br>"
	src << "<font color = blue><b>Remember, these are just guidelines, you may role play your character in any direction, so long as the RolePlay is consistant and makes sense.<br>"

/mob/proc/CreateCharacter()
	src.DeleteAll()
	var/find_player = "players/[ckey].sav"
	if(length(file(find_player)))
		src << "<font color = teal>File [find_player] Deleted...<br>"
		fdel(find_player)
	var/N = input("Character Name - This must be a Role Play name, names with extensions like Sir, Lord, and Master are not allowed. An example of a good Role Play name would be Valmire Thelinos or Elsandra Malvoire")as null|text
	if(!N)
		N = "Nameless"
	for(var/mob/M in Players)
		if(M.name == N)
			N = "Nameless"
	src.LoggedIn = 1
	src.name = "[Safe_Guard(N)]"
	src.Head = 100
	src.Torso = 100
	src.LeftArm = 100
	src.RightArm = 100
	src.LeftLeg = 100
	src.RightLeg = 100
	src.Skull = 100
	src.Brain = 100
	src.LeftEye = 100
	src.RightEye = 100
	src.LeftEar = 100
	src.RightEar = 100
	src.Teeth = 100
	src.Nose = 100
	src.Tongue = 100
	src.Throat = 100
	src.RaceRules()
	src.Heart = 100
	src.LeftLung = 100
	src.RightLung = 100
	src.Spleen = 100
	src.Intestine = 100
	src.LeftKidney = 100
	src.RightKidney = 100
	src.Liver = 100
	src.Bladder = 100
	src.Stomach = 100
	src.CanMove = 1
	src.BloodColour = /obj/Misc/Gore/BloodSplat/
	src.BloodWallColour = /obj/Misc/Gore/WallBloodSplat/
	if(src.Race == "Illithid")
		src.HungerMulti = 1
		src.CanUseTK = 1
		src.DieAge = rand(200,500)
		src.MagicPotentcy = rand(50,150)
		src.loc = locate(286,173,3)
		src.icon = 'illithid.dmi'
		src.icon_state = "N"
		src.WeightMax = 100
		src.AstralMagic = 20
		src.Strength += 2.5
		src.Agility += 10
		src.Endurance += 2.5
		src.Intelligence += 25
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 25
		src.AgilityMax = 30
		src.EnduranceMax = 25
		src.IntelligenceMax = 80

		src.StrengthMulti = 0.05
		src.AgilityMulti = 0.2
		src.EnduranceMulti = 0.05
		src.IntelligenceMulti = 0.5

		src.SwordSkill += 10
		src.AxeSkill += 0
		src.SpearSkill += 10
		src.BluntSkill += 10
		src.RangedSkill += 10
		src.DaggerSkill += 10
		src.UnarmedSkill += 10
		src.ShieldSkill += 10

		src.SwordSkillMulti = 0.2
		src.AxeSkillMulti = 0.1
		src.SpearSkillMulti = 0.2
		src.BluntSkillMulti = 0.2
		src.RangedSkillMulti = 0.2
		src.DaggerSkillMulti = 0.2
		src.UnarmedSkillMulti = 0.2
		src.ShieldSkillMulti = 0.2

		src.CarpentrySkillMulti = 0.6
		src.MiningSkillMulti = 0.2
		src.MasonarySkillMulti = 0.6
		src.SmeltingSkillMulti = 0.6
		src.ForgingSkillMulti = 0.6
		src.WoodCuttingSkillMulti = 0.6
		src.AlchemySkillMulti = 1
		src.CookingSkillMulti = 0.6
		src.SkinningSkillMulti = 0.6
		src.LeatherCraftSkillMulti = 0.6
		src.FishingSkillMulti = 1
		src.BuildingSkillMulti = 1
		src.FarmingSkillMulti = 0.6
		src.WeavingSkillMulti = 0.6
		src.EngravingSkillMulti = 1
		src.FirstAidSkillMulti = 0.6
		src.ButcherySkillMulti = 0.6
		src.BoneCraftMulti = 0.6
		var/obj/Items/Armour/Chest/Robe/R = new
		R.overlays += image(/obj/HUD/E/)
		R.Defence = 2
		R.suffix = "Equip"
		R.icon_state = R.EquipState
		R.layer = 20
		R.Move(src)
		src.WChest = R
		src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
		var/obj/Items/Weapons/Spears/Trident/T = new
		T.Material = "Iron"
		T.Move(src)
		T.suffix = "Equip"
		T.overlays += image(/obj/HUD/E)
		T.icon_state = T.EquipState
		src.overlays+=image(T.icon,T.icon_state,T.ItemLayer)
		src.Weapon = T
		src.Blood = 85
		src.BloodMax = 85
		src.Faction = "Illithid Cultists"
		src.DarkVision = 4
		src.Born = Year - 100
		src.Age = Year - 100
		src.CanSwimWell = 1
		src.CanRegenLimbs = 1
		src.Claws = 100
		src.CanBreathe = 0
		src.see_in_dark = 3
		src.DarkVision = 3
		src.CanEatRawMeats = 2
	if(src.Race == "Alther")
		if(src.Gender == "Male")
			src.icon = 'elf.dmi'
		if(src.Gender == "Female")
			src.icon = 'elf(F).dmi'
		src.PregType = "Womb"
		src.HungerMulti = 1
		src.DieAge = rand(150,200)
		src.MagicPotentcy = rand(20,101)
		src.loc = locate(237,82,1)
		src.icon_state = "N"
		src.WeightMax = 90
		src.Strength += 4.5
		src.Agility += 10
		src.Endurance += 4
		src.Intelligence += 15
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 40
		src.AgilityMax = 60
		src.EnduranceMax = 40
		src.IntelligenceMax = 65
		var/PlayerBorn = 0
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Gender == "Female" && M.Preg == 2)
				if(src.client.address == M.client.address && M != src)
					world << "<font color = teal><b>([src.key])[src] - [src.OrginalName] was booted for Alt Key Interaction involving character creation!<br>"
					del(src)
					return
				PlayerBorn = 1
				src.Strength += M.Strength / 8
				src.Strength += M.FatherStrength
				src.Agility += M.Agility / 8
				src.Agility += M.FatherAgility
				src.Endurance += M.Endurance / 8
				src.Endurance += M.FatherEndurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				M.FatherEndurance = 0
				M.FatherAgility = 0
				M.FatherAgility = 0
				M.Preg = 3
				M.BirthTimer()
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] is born to [M]!<br>"
				break
		src.StrengthMulti = 0.09
		src.AgilityMulti = 0.2
		src.EnduranceMulti = 0.08
		src.IntelligenceMulti = 0.3

		src.SwordSkill += 10
		src.AxeSkill += 0
		src.SpearSkill += 10
		src.BluntSkill += 10
		src.RangedSkill += 10
		src.DaggerSkill += 10
		src.UnarmedSkill += 10
		src.ShieldSkill += 10

		src.SwordSkillMulti = 0.5
		src.AxeSkillMulti = 0.1
		src.SpearSkillMulti = 0.5
		src.BluntSkillMulti = 0.5
		src.RangedSkillMulti = 0.5
		src.DaggerSkillMulti = 0.5
		src.UnarmedSkillMulti = 0.5
		src.ShieldSkillMulti = 0.5

		src.CarpentrySkillMulti = 0.4
		src.MiningSkillMulti = 0.2
		src.MasonarySkillMulti = 0.8
		src.SmeltingSkillMulti = 0.8
		src.ForgingSkillMulti = 0.8
		src.WoodCuttingSkillMulti = 0.2
		src.AlchemySkillMulti = 0.8
		src.CookingSkillMulti = 0.6
		src.SkinningSkillMulti = 0.2
		src.LeatherCraftSkillMulti = 0.2
		src.FishingSkillMulti = 0.4
		src.BuildingSkillMulti = 0.8
		src.FarmingSkillMulti = 0.8
		src.WeavingSkillMulti = 0.8
		src.EngravingSkillMulti = 0.6
		src.FirstAidSkillMulti = 0.8
		src.ButcherySkillMulti = 0.2
		src.BoneCraftMulti = 0.2
		if(PlayerBorn == 0)
			var/obj/Items/Armour/UpperBody/LeatherVest/LV = new
			LV.overlays += image(/obj/HUD/E/)
			LV.Defence = 2
			LV.suffix = "Equip"
			LV.icon_state = LV.EquipState
			LV.layer = 20
			LV.Move(src)
			src.WUpperBody = LV
			src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
			var/obj/Items/Armour/Legs/LeatherLeggings/LL = new
			LL.overlays += image(/obj/HUD/E/)
			LL.Defence = 2
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.icon_state = LL.EquipState
			LL.Move(src)
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			var/obj/Items/Armour/LeftFoot/LeatherBootLeft/LBL = new
			LBL.overlays += image(/obj/HUD/E/)
			LBL.Defence = 2
			src.WLeftFoot = LBL
			LBL.icon_state = LBL.EquipState
			LBL.suffix = "Equip"
			LBL.Move(src)
			src.overlays+=image(LBL.icon,LBL.icon_state,LBL.ItemLayer)
			var/obj/Items/Armour/RightFoot/LeatherBootRight/LBR = new
			LBR.overlays += image(/obj/HUD/E/)
			LBR.Defence = 2
			src.WRightFoot = LBR
			LBR.suffix = "Equip"
			LBR.icon_state = LBR.EquipState
			LBR.Move(src)
			src.overlays+=image(LBR.icon,LBR.icon_state,LBR.ItemLayer)
			var/obj/Items/Armour/LeftArm/LeatherGloveLeft/LGL = new
			LGL.overlays += image(/obj/HUD/E/)
			LGL.Defence = 2
			src.WLeftHand = LGL
			LGL.suffix = "Equip"
			LGL.icon_state = LGL.EquipState
			LGL.Move(src)
			src.overlays+=image(LGL.icon,LGL.icon_state,LGL.ItemLayer)
			var/obj/Items/Armour/RightArm/LeatherGloveRight/LGR = new
			LGR.overlays += image(/obj/HUD/E/)
			LGR.Defence = 2
			src.WRightHand = LGR
			LGR.suffix = "Equip"
			LGR.icon_state = LGR.EquipState
			LGR.Move(src)
			src.overlays+=image(LGR.icon,LGR.icon_state,LGR.ItemLayer)
			LGR.suffix = "Equip"
			LGR.overlays += image(/obj/HUD/E/)
			var/obj/Items/Weapons/Daggers/Dagger/D = new
			D.Material = "Iron"
			D.RandomItemQuality()
			D.Move(src)
			D.suffix = "Equip"
			D.overlays += image(/obj/HUD/E)
			D.icon_state = D.EquipState
			src.overlays+=image(D.icon,D.icon_state,D.ItemLayer)
			src.Weapon = D
		src.GiveHair("NoBald")
		src.Blood = 85
		src.BloodMax = 85
		src.Faction = "Altherian Empire"
		src.DarkVision = 2
		src.Born = Year

	if(src.Race == "Stahlite")
		if(src.Gender == "Male")
			src.icon = 'dwarf.dmi'
			var/obj/Misc/Beards/StahliteBeard/Z = new
			src.Beard = Z
			src.overlays += src.Beard
		if(src.Gender == "Female")
			src.icon = 'dwarf(F).dmi'
			var/obj/Misc/Hairs/SmallHairFemale/Z = new
			src.Hair = Z
			src.overlays += src.Hair
		src.PregType = "Womb"
		src.loc = locate(11,233,1)
		src.HungerMulti = 1
		src.icon_state = "N"
		src.WeightMax = 110
		src.Strength += 10
		src.DieAge = rand(100,150)
		src.Agility += 4
		src.Endurance += 10
		src.Intelligence += 12.5
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 60
		src.AgilityMax = 40
		src.EnduranceMax = 65
		src.IntelligenceMax = 60
		var/PlayerBorn = 0
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Gender == "Female" && M.Preg == 2)
				if(src.client.address == M.client.address && M != src)
					world << "<font color = teal><b>([src.key])[src] - [src.OrginalName] was booted for Alt Key Interaction involving character creation!<br>"
					del(src)
					return
				PlayerBorn = 1
				src.Strength += M.Strength / 8
				src.Strength += M.FatherStrength
				src.Agility += M.Agility / 8
				src.Agility += M.FatherAgility
				src.Endurance += M.Endurance / 8
				src.Endurance += M.FatherEndurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				M.FatherEndurance = 0
				M.FatherAgility = 0
				M.FatherAgility = 0
				M.Preg = 3
				M.BirthTimer()
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] is born to [M]!<br>"
				break

		src.StrengthMulti = 0.2
		src.AgilityMulti = 0.08
		src.EnduranceMulti = 0.2
		src.IntelligenceMulti = 0.25

		src.SwordSkill += 0
		src.AxeSkill += 10
		src.SpearSkill += 0
		src.BluntSkill += 10
		src.RangedSkill += 8
		src.DaggerSkill += 0
		src.UnarmedSkill += 10
		src.ShieldSkill += 10

		src.SwordSkillMulti = 0.2
		src.AxeSkillMulti = 0.6
		src.SpearSkillMulti = 0.2
		src.BluntSkillMulti = 0.6
		src.RangedSkillMulti = 0.4
		src.DaggerSkillMulti = 0.2
		src.UnarmedSkillMulti = 0.4
		src.ShieldSkillMulti = 0.4
		src.ButcherySkillMulti = 0.6
		src.BoneCraftMulti = 0.4
		if(PlayerBorn == 0)
			var/obj/Items/Armour/Chest/SmallChainShirt/IC = new
			IC.Material = "Iron"
			IC.RandomItemQuality()
			IC.overlays += image(/obj/HUD/E/)
			IC.Defence = 4
			src.WChest = IC
			IC.suffix = "Equip"
			IC.Move(src)
			IC.icon_state = IC.EquipState
			src.overlays+=image(IC.icon,IC.icon_state,IC.ItemLayer)
			var/obj/Items/Armour/Legs/SmallChainLeggings/LL = new
			LL.Material = "Iron"
			LL.RandomItemQuality()
			LL.overlays += image(/obj/HUD/E/)
			LL.Defence = 4
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.Move(src)
			LL.icon_state = LL.EquipState
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			var/obj/Items/Weapons/Axes/PickAxe/A = new
			A.Material = "Iron"
			A.RandomItemQuality()
			A.Move(src)
			A.suffix = "Equip"
			A.overlays += image(/obj/HUD/E/)
			A.icon_state = A.EquipState
			src.overlays+=image(A.icon,A.icon_state,A.ItemLayer)
			src.Weapon = A
		src.CarpentrySkillMulti = 0.4
		src.MiningSkillMulti = 0.4
		src.MasonarySkillMulti = 0.8
		src.SmeltingSkillMulti = 0.8
		src.ForgingSkillMulti = 0.8
		src.WoodCuttingSkillMulti = 0.4
		src.AlchemySkillMulti = 0.2
		src.CookingSkillMulti = 0.8
		src.SkinningSkillMulti = 0.8
		src.LeatherCraftSkillMulti = 0.8
		src.FishingSkillMulti = 0.4
		src.BuildingSkillMulti = 0.8
		src.FarmingSkillMulti = 0.4
		src.WeavingSkillMulti = 0.8
		src.EngravingSkillMulti = 0.8
		src.FirstAidSkillMulti = 0.6
		src.Blood = 105
		src.BloodMax = 105
		src.Faction = "Stahlite Empire"
		src.see_in_dark = 3
		src.DarkVision = 3
		src.CanEatRawMeats = 1
		src.Born = Year

	if(src.Race == "Cyclops")
		src.icon = 'cyclops.dmi'
		src.loc = locate(215,234,1)
		src.PregType = "Womb"
		src.icon_state = "N"
		src.WeightMax = 115
		src.Strength += 11
		src.DieAge = rand(80,110)
		src.MagicPotentcy = rand(0,25)
		src.Agility += 4.5
		src.Endurance += 11
		src.Intelligence += 5
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 65
		src.AgilityMax = 40
		src.EnduranceMax = 65
		src.IntelligenceMax = 30
		var/PlayerBorn = 0
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Gender == "Female" && M.Preg == 2)
				if(src.client.address == M.client.address && M != src)
					world << "<font color = teal><b>([src.key])[src] - [src.OrginalName] was booted for Alt Key Interaction involving character creation!<br>"
					del(src)
					return
				PlayerBorn = 1
				src.Strength += M.Strength / 8
				src.Strength += M.FatherStrength
				src.Agility += M.Agility / 8
				src.Agility += M.FatherAgility
				src.Endurance += M.Endurance / 8
				src.Endurance += M.FatherEndurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				M.FatherEndurance = 0
				M.FatherAgility = 0
				M.FatherAgility = 0
				M.Preg = 3
				M.BirthTimer()
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] is born to [M]!<br>"
				break

		src.StrengthMulti = 0.22
		src.AgilityMulti = 0.09
		src.EnduranceMulti = 0.22
		src.IntelligenceMulti = 0.1

		src.SwordSkill += 0
		src.AxeSkill += 0
		src.SpearSkill += 0
		src.BluntSkill += 10
		src.RangedSkill += 0
		src.DaggerSkill += 0
		src.UnarmedSkill += 10
		src.ShieldSkill += 0

		src.SwordSkillMulti = 0.2
		src.AxeSkillMulti = 0.2
		src.SpearSkillMulti = 0.2
		src.BluntSkillMulti = 0.6
		src.RangedSkillMulti = 0.2
		src.DaggerSkillMulti = 0.2
		src.UnarmedSkillMulti = 0.2
		src.ShieldSkillMulti = 0.2
		if(PlayerBorn == 0)
			var/obj/Items/Armour/UpperBody/GiantLeatherVest/LV = new
			LV.overlays += image(/obj/HUD/E/)
			LV.Defence = 2
			src.WUpperBody = LV
			LV.suffix = "Equip"
			LV.Move(src)
			LV.icon_state = LV.EquipState
			src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
			var/obj/Items/Armour/Legs/GiantLeatherLeggings/LL = new
			LL.overlays += image(/obj/HUD/E/)
			LL.Defence = 2
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.Move(src)
			LL.icon_state = LL.EquipState
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			var/obj/Items/Weapons/Blunts/Hammer/H = new
			H.Material = "Iron"
			H.RandomItemQuality()
			H.Move(src)
			H.suffix = "Equip"
			H.overlays += image(/obj/HUD/E)
			H.icon_state = H.EquipState
			src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
			src.Weapon = H
		src.CarpentrySkillMulti = 0.6
		src.MiningSkillMulti = 0.4
		src.MasonarySkillMulti = 0.6
		src.SmeltingSkillMulti = 0.6
		src.ForgingSkillMulti = 0.6
		src.WoodCuttingSkillMulti = 0.8
		src.AlchemySkillMulti = 0.4
		src.CookingSkillMulti = 0.6
		src.SkinningSkillMulti = 0.6
		src.LeatherCraftSkillMulti = 0.6
		src.FishingSkillMulti = 0.6
		src.BuildingSkillMulti = 0.6
		src.FarmingSkillMulti = 0.4
		src.WeavingSkillMulti = 0.2
		src.EngravingSkillMulti = 0.2
		src.FirstAidSkillMulti = 0.6
		src.ButcherySkillMulti = 0.8
		src.BoneCraftMulti = 0.4
		src.HungerMulti = 1.5

		src.Blood = 105
		src.BloodMax = 105
		src.Faction = "Cyclops Hordes"
		src.see_in_dark = 3
		src.DarkVision = 3
		src.CanEatRawMeats = 1
		src.Born = Year
		src.GiveHair()

	if(src.Race == "Ratling")
		var/Colour = rand(1,4)
		if(Colour == 1)
			src.icon = 'ratling brown.dmi'
		if(Colour == 2)
			src.icon = 'ratling black.dmi'
		if(Colour == 3)
			src.icon = 'ratling.dmi'
		if(Colour == 4)
			src.icon = 'ratling white.dmi'
		src.loc = locate(27,80,3)
		src.icon_state = "N"
		src.PregType = "Womb"
		src.DieAge = rand(60,80)
		src.MagicPotentcy = rand(0,75)
		src.WeightMax = 85
		src.Strength += 3.5
		src.Agility += 12.5
		src.Endurance += 3.5
		src.Intelligence += 10
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 35
		src.AgilityMax = 75
		src.EnduranceMax = 35
		src.IntelligenceMax = 40
		src.Claws = 100
		var/PlayerBorn = 0
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Gender == "Female" && M.Preg == 2)
				if(src.client.address == M.client.address && M != src)
					world << "<font color = teal><b>([src.key])[src] - [src.OrginalName] was booted for Alt Key Interaction involving character creation!<br>"
					del(src)
					return
				PlayerBorn = 1
				src.Strength += M.Strength / 8
				src.Strength += M.FatherStrength
				src.Agility += M.Agility / 8
				src.Agility += M.FatherAgility
				src.Endurance += M.Endurance / 8
				src.Endurance += M.FatherEndurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				M.FatherEndurance = 0
				M.FatherAgility = 0
				M.FatherAgility = 0
				M.Preg = 3
				M.BirthTimer()
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] is born to [M]!<br>"
				break

		src.StrengthMulti = 0.07
		src.AgilityMulti = 0.25
		src.EnduranceMulti = 0.07
		src.IntelligenceMulti = 0.2

		src.SwordSkill += 4
		src.AxeSkill += 3
		src.SpearSkill += 7
		src.BluntSkill += 3
		src.RangedSkill += 10
		src.DaggerSkill += 10
		src.UnarmedSkill += 7
		src.ShieldSkill += 10

		src.SwordSkillMulti = 0.3
		src.AxeSkillMulti = 0.3
		src.SpearSkillMulti = 0.5
		src.BluntSkillMulti = 0.3
		src.RangedSkillMulti = 0.5
		src.DaggerSkillMulti = 0.6
		src.UnarmedSkillMulti = 0.4
		src.ShieldSkillMulti = 0.4

		src.CarpentrySkillMulti = 0.4
		src.MiningSkillMulti = 0.4
		src.MasonarySkillMulti = 0.8
		src.SmeltingSkillMulti = 0.6
		src.ForgingSkillMulti = 0.6
		src.WoodCuttingSkillMulti = 0.6
		src.AlchemySkillMulti = 0.8
		src.CookingSkillMulti = 0.2
		src.SkinningSkillMulti = 0.6
		src.LeatherCraftSkillMulti = 0.6
		src.FishingSkillMulti = 0.6
		src.BuildingSkillMulti = 0.6
		src.FarmingSkillMulti = 0.2
		src.WeavingSkillMulti = 0.2
		src.EngravingSkillMulti = 0.2
		src.FirstAidSkillMulti = 0.8
		src.ButcherySkillMulti = 0.6
		src.BoneCraftMulti = 1
		src.HungerMulti = 1

		if(PlayerBorn == 0)
			var/obj/Items/Weapons/Daggers/Dagger/D = new
			D.Material = "Iron"
			D.RandomItemQuality()
			D.Move(src)
			src.Weight += D.Weight
			D.suffix = "Equip"
			D.overlays += image(/obj/HUD/E)
			D.icon_state = D.EquipState
			src.overlays+=image(D.icon,D.icon_state,D.ItemLayer)
			src.Weapon = D

			var/obj/Items/Armour/Head/SkullHelmet/H = new
			var/obj/Items/Armour/UpperBody/BoneChestPlate/C = new
			var/obj/Items/Armour/Shoulders/SkullPauldrons/P = new
			var/obj/Items/Armour/LeftArm/BoneLeftGauntlet/LG = new
			var/obj/Items/Armour/RightArm/BoneRightGauntlet/RG = new
			var/obj/Items/Armour/LeftFoot/BoneBootLeft/LB = new
			var/obj/Items/Armour/RightFoot/BoneBootRight/RB = new
			src.CreateList += H
			src.CreateList += C
			src.CreateList += P
			src.CreateList += LG
			src.CreateList += RG
			src.CreateList += LB
			src.CreateList += RB


		src.Blood = 90
		src.BloodMax = 90
		src.see_in_dark = 4
		src.DarkVision = 4
		src.Faction = "Ratling Hordes"
		src.CanEatRawMeats = 2
		src.Born = Year

	if(src.Race == "Frogman")
		src.Noise()
		src.icon = 'frogman.dmi'
		src.DieAge = rand(65,90)
		src.icon_state = "N"
		src.PregType = "Egg"
		src.CanSwimWell = 1
		src.CanRegenLimbs = 1
		src.SwimmingSkill += 25
		src.loc = locate(287,228,1)
		src.MagicPotentcy = rand(0,75)
		src.WeightMax = 100
		src.Strength += 4
		src.Agility += 12.5
		src.Endurance += 4
		src.Intelligence += 7.5
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 45
		src.AgilityMax = 55
		src.EnduranceMax = 40
		src.IntelligenceMax = 45
		var/PlayerBorn = 0
		for(var/mob/NPC/M in Players)
			if(M.Race == src.Race && M.Preg == 2 && src != M)
				PlayerBorn = 1
				src.Strength += M.Strength
				src.Agility += M.Agility
				src.Endurance += M.Endurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] hatches from [M]!<br>"
				del(M)
				break
		src.StrengthMulti = 0.08
		src.AgilityMulti = 0.25
		src.EnduranceMulti = 0.08
		src.IntelligenceMulti = 0.15

		src.SwordSkill += 4
		src.AxeSkill += 4
		src.SpearSkill += 10
		src.BluntSkill += 4
		src.RangedSkill += 10
		src.DaggerSkill += 5
		src.UnarmedSkill += 10
		src.ShieldSkill += 10

		src.SwordSkillMulti = 0.3
		src.AxeSkillMulti = 0.2
		src.SpearSkillMulti = 0.5
		src.BluntSkillMulti = 0.2
		src.RangedSkillMulti = 0.5
		src.DaggerSkillMulti = 0.4
		src.UnarmedSkillMulti = 0.5
		src.ShieldSkillMulti = 0.5

		src.CarpentrySkillMulti = 0.6
		src.MiningSkillMulti = 0.2
		src.MasonarySkillMulti = 0.6
		src.SmeltingSkillMulti = 0.6
		src.ForgingSkillMulti = 0.6
		src.WoodCuttingSkillMulti = 0.8
		src.AlchemySkillMulti = 0.8
		src.CookingSkillMulti = 0.6
		src.SkinningSkillMulti = 0.6
		src.LeatherCraftSkillMulti = 0.6
		src.FishingSkillMulti = 1
		src.BuildingSkillMulti = 0.6
		src.FarmingSkillMulti = 0.4
		src.WeavingSkillMulti = 0.4
		src.EngravingSkillMulti = 0.4
		src.FirstAidSkillMulti = 0.6
		src.ButcherySkillMulti = 0.4
		src.BoneCraftMulti = 0.4
		src.HungerMulti = 1
		if(PlayerBorn == 0)
			var/obj/Items/Armour/UpperBody/LeatherVest/LV = new
			LV.overlays += image(/obj/HUD/E/)
			LV.Defence = 2
			LV.suffix = "Equip"
			LV.icon_state = LV.EquipState
			LV.layer = 20
			LV.Move(src)
			src.WUpperBody = LV
			src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
			var/obj/Items/Armour/Legs/LeatherLeggings/LL = new
			LL.overlays += image(/obj/HUD/E/)
			LL.Defence = 2
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.icon_state = LL.EquipState
			LL.Move(src)
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			var/obj/Items/Armour/LeftFoot/LeatherBootLeft/LBL = new
			LBL.overlays += image(/obj/HUD/E/)
			LBL.Defence = 2
			src.WLeftFoot = LBL
			LBL.icon_state = LBL.EquipState
			LBL.suffix = "Equip"
			LBL.Move(src)
			src.overlays+=image(LBL.icon,LBL.icon_state,LBL.ItemLayer)
			var/obj/Items/Armour/RightFoot/LeatherBootRight/LBR = new
			LBR.overlays += image(/obj/HUD/E/)
			LBR.Defence = 2
			src.WRightFoot = LBR
			LBR.suffix = "Equip"
			LBR.icon_state = LBR.EquipState
			LBR.Move(src)
			src.overlays+=image(LBR.icon,LBR.icon_state,LBR.ItemLayer)
			var/obj/Items/Armour/LeftArm/LeatherGloveLeft/LGL = new
			LGL.overlays += image(/obj/HUD/E/)
			LGL.Defence = 2
			src.WLeftHand = LGL
			LGL.suffix = "Equip"
			LGL.icon_state = LGL.EquipState
			LGL.Move(src)
			src.overlays+=image(LGL.icon,LGL.icon_state,LGL.ItemLayer)
			var/obj/Items/Armour/RightArm/LeatherGloveRight/LGR = new
			LGR.overlays += image(/obj/HUD/E/)
			LGR.Defence = 2
			src.WRightHand = LGR
			LGR.suffix = "Equip"
			LGR.icon_state = LGR.EquipState
			LGR.Move(src)
			src.overlays+=image(LGR.icon,LGR.icon_state,LGR.ItemLayer)
			src.Blood = 100
			src.BloodMax = 100
			src.Faction = "Frogmen Hordes"
			var/obj/Items/Weapons/Spears/Spear/S = new
			S.Material = "Iron"
			S.RandomItemQuality()
			S.Move(src)
			S.suffix = "Equip"
			S.overlays += image(/obj/HUD/E)
			S.icon_state = S.EquipState
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.Weapon = S
		src.DarkVision = 2
		src.Born = Year
		src.CanEatRawMeats = 1
		src.CanBreathe = 0

	if(src.Race == "Giant")
		if(src.Gender == "Male")
			src.icon = 'giant.dmi'
		if(src.Gender == "Female")
			src.icon = 'giant(F).dmi'
		src.icon_state = "N"
		src.PregType = "Womb"
		src.DieAge = rand(90,120)
		src.MagicPotentcy = rand(0,30)
		src.loc = locate(28,75,1)
		src.WeightMax = 125
		src.Strength += 12.5
		src.Agility += 3.5
		src.Endurance += 12.5
		src.Intelligence += 5
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 75
		src.AgilityMax = 35
		src.EnduranceMax = 75
		src.IntelligenceMax = 25
		var/PlayerBorn = 0
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Gender == "Female" && M.Preg == 2)
				if(src.client.address == M.client.address && M != src)
					world << "<font color = teal><b>([src.key])[src] - [src.OrginalName] was booted for Alt Key Interaction involving character creation!<br>"
					del(src)
					return
				PlayerBorn = 1
				src.Strength += M.Strength / 8
				src.Strength += M.FatherStrength
				src.Agility += M.Agility / 8
				src.Agility += M.FatherAgility
				src.Endurance += M.Endurance / 8
				src.Endurance += M.FatherEndurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				M.FatherEndurance = 0
				M.FatherAgility = 0
				M.FatherAgility = 0
				M.Preg = 3
				M.BirthTimer()
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] is born to [M]!<br>"
				break

		src.StrengthMulti = 0.25
		src.AgilityMulti = 0.07
		src.EnduranceMulti = 0.25
		src.IntelligenceMulti = 0.1

		src.SwordSkill += 0
		src.AxeSkill += 0
		src.SpearSkill += 0
		src.BluntSkill += 10
		src.RangedSkill += 0
		src.DaggerSkill += 0
		src.UnarmedSkill += 10
		src.ShieldSkill += 0

		src.SwordSkillMulti = 0.2
		src.AxeSkillMulti = 0.2
		src.SpearSkillMulti = 0.2
		src.BluntSkillMulti = 0.6
		src.RangedSkillMulti = 0.2
		src.DaggerSkillMulti = 0.2
		src.UnarmedSkillMulti = 0.5
		src.ShieldSkillMulti = 0.2
		if(PlayerBorn == 0)
			var/obj/Items/Armour/UpperBody/GiantLeatherVest/LV = new
			LV.overlays += image(/obj/HUD/E/)
			LV.Defence = 2
			src.WUpperBody = LV
			LV.suffix = "Equip"
			LV.Move(src)
			LV.icon_state = LV.EquipState
			src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
			var/obj/Items/Armour/Legs/GiantLeatherLeggings/LL = new
			LL.overlays += image(/obj/HUD/E/)
			LL.Defence = 2
			src.WLegs = LL
			LL.suffix = "Equip"
			LL.Move(src)
			LL.icon_state = LL.EquipState
			src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
			var/obj/Items/Weapons/Blunts/Hammer/H = new
			H.Material = "Iron"
			H.RandomItemQuality()
			H.Move(src)
			H.suffix = "Equip"
			H.overlays += image(/obj/HUD/E)
			H.icon_state = H.EquipState
			src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
			src.Weapon = H
		src.CarpentrySkillMulti = 0.6
		src.MiningSkillMulti = 0.4
		src.MasonarySkillMulti = 0.8
		src.SmeltingSkillMulti = 0.8
		src.ForgingSkillMulti = 0.8
		src.WoodCuttingSkillMulti = 0.8
		src.AlchemySkillMulti = 0.4
		src.CookingSkillMulti = 0.6
		src.SkinningSkillMulti = 0.6
		src.LeatherCraftSkillMulti = 0.6
		src.FishingSkillMulti = 0.6
		src.BuildingSkillMulti = 0.6
		src.FarmingSkillMulti = 0.6
		src.WeavingSkillMulti = 0.4
		src.EngravingSkillMulti = 0.4
		src.FirstAidSkillMulti = 0.4
		src.ButcherySkillMulti = 0.6
		src.BoneCraftMulti = 0.4
		src.HungerMulti = 1.5
		src.Faction = "Giant Hordes"
		src.Blood = 110
		src.BloodMax = 110
		src.DarkVision = 2
		src.Born = Year
		src.GiveHair()

	if(src.Race == "Wolfman")
		var/Colour = rand(1,4)
		if(Colour == 1)
			src.icon = 'wolfman gray.dmi'
		if(Colour == 2)
			src.icon = 'wolfman black.dmi'
		if(Colour == 3)
			src.icon = 'wolfman brown.dmi'
		if(Colour == 4)
			src.icon = 'wolfman white.dmi'
		src.icon_state = "N"
		src.PregType = "Womb"
		src.WeightMax = 150
		src.DieAge = rand(80,120)
		src.MagicPotentcy = rand(0,85)
		src.Strength += 7.5
		src.Agility += 7.5
		src.Endurance += 4
		src.Intelligence += 7.5
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year

		src.StrengthMax = 55
		src.AgilityMax = 55
		src.EnduranceMax = 45
		src.IntelligenceMax = 40

		src.StrengthMulti = 0.15
		src.AgilityMulti = 0.15
		src.EnduranceMulti = 0.08
		src.IntelligenceMulti = 0.15

		src.SwordSkill += 5
		src.AxeSkill += 5
		src.SpearSkill += 5
		src.BluntSkill += 5
		src.RangedSkill += 5
		src.DaggerSkill += 5
		src.UnarmedSkill += 15
		src.ShieldSkill += 5

		src.SwordSkillMulti = 0.1
		src.AxeSkillMulti = 0.1
		src.SpearSkillMulti = 0.2
		src.BluntSkillMulti = 0.1
		src.RangedSkillMulti = 0.1
		src.DaggerSkillMulti = 0.1
		src.UnarmedSkillMulti = 0.5
		src.ShieldSkillMulti = 0.2
		src.CarpentrySkillMulti = 0.2
		src.MiningSkillMulti = 0.2
		src.MasonarySkillMulti = 0.2
		src.SmeltingSkillMulti = 0.2
		src.ForgingSkillMulti = 0.2
		src.WoodCuttingSkillMulti = 0.4
		src.AlchemySkillMulti = 0.4
		src.CookingSkillMulti = 0.2
		src.SkinningSkillMulti = 1
		src.LeatherCraftSkillMulti = 1
		src.FishingSkillMulti = 1
		src.BuildingSkillMulti = 0.4
		src.FarmingSkillMulti = 0.4
		src.WeavingSkillMulti = 0.2
		src.EngravingSkillMulti = 0.2
		src.FirstAidSkillMulti = 1
		src.ButcherySkillMulti = 0.8
		src.BoneCraftMulti = 0.4
		src.HungerMulti = 1.5
		src.Faction = "Dangerous Beasts"
		src.Blood = 120
		src.BloodMax = 120
		src.Born = Year
		src.FindSuitableLocation()
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Gender == "Female" && M.Preg == 2)
				if(src.client.address == M.client.address && M != src)
					world << "<font color = teal><b>([src.key])[src] - [src.OrginalName] was booted for Alt Key Interaction involving character creation!<br>"
					del(src)
					return
				src.Strength += M.Strength / 8
				src.Strength += M.FatherStrength
				src.Agility += M.Agility / 8
				src.Agility += M.FatherAgility
				src.Endurance += M.Endurance / 8
				src.Endurance += M.FatherEndurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				M.FatherEndurance = 0
				M.FatherAgility = 0
				M.FatherAgility = 0
				M.Preg = 3
				M.BirthTimer()
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] is born to [M]!<br>"
				break
		src.see_in_dark = 5
		src.DarkVision = 5
		src.CanEatBodies = 1
		src.CanEatRawMeats = 2
		src.Claws = 100
	if(src.Race == "Snakeman")
		src.icon = 'snakeman.dmi'
		src.icon_state = "N"
		src.PregType = "Egg"
		src.WeightMax = 100
		src.DieAge = rand(75,100)
		src.MagicPotentcy = rand(0,101)
		src.Strength += 8.5
		src.Agility += 11
		src.Endurance += 3.75
		src.Intelligence += 10
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 50
		src.AgilityMax = 60
		src.EnduranceMax = 45
		src.IntelligenceMax = 50
		var/PlayerBorn = 0
		src.loc = locate(232,44,3)
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Preg == 2 && M != src)
				PlayerBorn = 1
				src.Strength += M.Strength
				src.Agility += M.Agility
				src.Endurance += M.Endurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] hatches from [M]!<br>"
				del(M)
				break
		src.StrengthMulti = 0.17
		src.AgilityMulti = 0.22
		src.EnduranceMulti = 0.075
		src.IntelligenceMulti = 0.2

		src.SwordSkill += 10
		src.AxeSkill += 5
		src.SpearSkill += 5
		src.BluntSkill += 5
		src.RangedSkill += 8
		src.DaggerSkill += 5
		src.UnarmedSkill += 8
		src.ShieldSkill += 10

		src.SwordSkillMulti = 0.44
		src.AxeSkillMulti = 0.2
		src.SpearSkillMulti = 0.2
		src.BluntSkillMulti = 0.2
		src.RangedSkillMulti = 0.4
		src.DaggerSkillMulti = 0.2
		src.UnarmedSkillMulti = 0.4
		src.ShieldSkillMulti = 0.44
		if(PlayerBorn == 0)
			var/obj/Items/Armour/UpperBody/LeatherVest/LV = new
			LV.overlays += image(/obj/HUD/E/)
			LV.Defence = 2
			LV.suffix = "Equip"
			LV.icon_state = LV.EquipState
			LV.layer = 20
			LV.Move(src)
			src.WUpperBody = LV
			src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
			var/obj/Items/Armour/LeftArm/LeatherGloveLeft/LGL = new
			LGL.overlays += image(/obj/HUD/E/)
			LGL.Defence = 2
			src.WLeftHand = LGL
			LGL.suffix = "Equip"
			LGL.icon_state = LGL.EquipState
			LGL.Move(src)
			src.overlays+=image(LGL.icon,LGL.icon_state,LGL.ItemLayer)
			var/obj/Items/Armour/RightArm/LeatherGloveRight/LGR = new
			LGR.overlays += image(/obj/HUD/E/)
			LGR.Defence = 2
			src.WRightHand = LGR
			LGR.suffix = "Equip"
			LGR.icon_state = LGR.EquipState
			LGR.Move(src)
			src.overlays+=image(LGR.icon,LGR.icon_state,LGR.ItemLayer)
			var/obj/Items/Weapons/Swords/Scimitar/S = new
			S.Material = "Copper"
			S.RandomItemQuality()
			S.Move(src)
			S.suffix = "Equip"
			S.overlays += image(/obj/HUD/E)
			S.icon_state = S.EquipState
			src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
			src.Weapon = S
		src.CarpentrySkillMulti = 1
		src.MiningSkillMulti = 0.2
		src.MasonarySkillMulti = 0.8
		src.SmeltingSkillMulti = 0.8
		src.ForgingSkillMulti = 0.8
		src.WoodCuttingSkillMulti = 1
		src.AlchemySkillMulti = 1
		src.CookingSkillMulti = 1
		src.SkinningSkillMulti = 0.8
		src.LeatherCraftSkillMulti = 0.8
		src.FishingSkillMulti = 0.8
		src.BuildingSkillMulti = 0.8
		src.FarmingSkillMulti = 0.8
		src.WeavingSkillMulti = 0.8
		src.EngravingSkillMulti = 0.6
		src.FirstAidSkillMulti = 0.8
		src.ButcherySkillMulti = 0.6
		src.BoneCraftMulti = 0.4
		src.HungerMulti = 1
		src.Faction = "Snakeman Empire"
		src.Blood = 100
		src.BloodMax = 100
		src.Born = Year
		src.see_in_dark = 5
		src.DarkVision = 5
		src.CanEatBodies = 1
		src.CanEatRawMeats = 2
	if(src.Race == "Human")
		var/Black = 0
		switch(alert("Choose skin color.",,"White","Black"))
			if("Black")
				Black = 1
		var/PlayerBorn = 0
		for(var/mob/M in Players)
			if(M.Race == src.Race && M.Gender == "Female" && M.Preg == 2)
				if(src.client.address == M.client.address && M != src)
					world << "<font color = teal><b>([src.key])[src] - [src.OrginalName] was booted for Alt Key Interaction involving character creation!<br>"
					del(src)
					return
				PlayerBorn = 1
				src.Strength += M.Strength / 8
				src.Strength += M.FatherStrength
				src.Agility += M.Agility / 8
				src.Agility += M.FatherAgility
				src.Endurance += M.Endurance / 8
				src.Endurance += M.FatherEndurance
				src.SkillCap += src.Endurance / 3 + src.Strength / 3 + src.Agility / 3
				src.StrCap = src.Strength + 3
				src.AgilCap = src.Agility + 3
				src.EndCap = src.Endurance + 3

				M.FatherEndurance = 0
				M.FatherAgility = 0
				M.FatherAgility = 0
				M.Preg = 3
				M.BirthTimer()
				src.loc = M.loc
				range(8,src) << "<font color = yellow>[src] is born to [M]!<br>"
				break
		if(Black == 0)
			if(src.Gender == "Male")
				src.icon = 'human.dmi'
			if(src.Gender == "Female")
				src.icon = 'human(F).dmi'
			var/Locs = rand(1,2)
			if(Locs == 1)
				src.loc = locate(28,75,1)
			if(Locs == 2)
				src.loc = locate(176,22,1)
			if(PlayerBorn == 0)
				var/obj/Items/Armour/UpperBody/LeatherVest/LV = new
				LV.overlays += image(/obj/HUD/E/)
				LV.Defence = 2
				LV.suffix = "Equip"
				LV.icon_state = LV.EquipState
				LV.layer = 20
				LV.Move(src)
				src.WUpperBody = LV
				src.overlays+=image(LV.icon,LV.icon_state,LV.ItemLayer)
				var/obj/Items/Armour/Legs/LeatherLeggings/LL = new
				LL.overlays += image(/obj/HUD/E/)
				LL.Defence = 2
				src.WLegs = LL
				LL.suffix = "Equip"
				LL.icon_state = LL.EquipState
				LL.Move(src)
				src.overlays+=image(LL.icon,LL.icon_state,LL.ItemLayer)
				var/obj/Items/Armour/LeftFoot/LeatherBootLeft/LBL = new
				LBL.overlays += image(/obj/HUD/E/)
				LBL.Defence = 2
				src.WLeftFoot = LBL
				LBL.icon_state = LBL.EquipState
				LBL.suffix = "Equip"
				LBL.Move(src)
				src.overlays+=image(LBL.icon,LBL.icon_state,LBL.ItemLayer)
				var/obj/Items/Armour/RightFoot/LeatherBootRight/LBR = new
				LBR.overlays += image(/obj/HUD/E/)
				LBR.Defence = 2
				src.WRightFoot = LBR
				LBR.suffix = "Equip"
				LBR.icon_state = LBR.EquipState
				LBR.Move(src)
				src.overlays+=image(LBR.icon,LBR.icon_state,LBR.ItemLayer)
				var/obj/Items/Armour/LeftArm/LeatherGloveLeft/LGL = new
				LGL.overlays += image(/obj/HUD/E/)
				LGL.Defence = 2
				src.WLeftHand = LGL
				LGL.suffix = "Equip"
				LGL.icon_state = LGL.EquipState
				LGL.Move(src)
				src.overlays+=image(LGL.icon,LGL.icon_state,LGL.ItemLayer)
				var/obj/Items/Armour/RightArm/LeatherGloveRight/LGR = new
				LGR.overlays += image(/obj/HUD/E/)
				LGR.Defence = 2
				src.WRightHand = LGR
				LGR.suffix = "Equip"
				LGR.icon_state = LGR.EquipState
				LGR.Move(src)
				src.overlays+=image(LGR.icon,LGR.icon_state,LGR.ItemLayer)
				var/obj/Items/Weapons/Axes/Hatchet/H = new
				H.Material = "Iron"
				H.RandomItemQuality()
				H.Move(src)
				H.suffix = "Equip"
				H.overlays += image(/obj/HUD/E)
				H.icon_state = H.EquipState
				src.overlays+=image(H.icon,H.icon_state,H.ItemLayer)
				src.Weapon = H
				src.GiveHair()
		if(Black)
			if(src.Gender == "Male")
				src.icon = 'human black.dmi'
			if(src.Gender == "Female")
				src.icon = 'human black(F).dmi'
			src.loc = locate(230,25,1)
			if(PlayerBorn == 0)
				var/obj/Items/Armour/Chest/DesertRobe/R = new
				R.overlays += image(/obj/HUD/E/)
				R.suffix = "Equip"
				R.icon_state = R.EquipState
				R.layer = 20
				R.Move(src)
				src.WChest = R
				src.overlays+=image(R.icon,R.icon_state,R.ItemLayer)
				var/obj/Items/Armour/Head/Turban/T = new
				T.overlays += image(/obj/HUD/E/)
				T.suffix = "Equip"
				T.icon_state = T.EquipState
				T.layer = 20
				T.Move(src)
				src.WHead = T
				src.overlays+=image(T.icon,T.icon_state,T.ItemLayer)
				var/obj/Items/Armour/Legs/ChainLeggings/L = new
				L.Material = "Iron"
				L.RandomItemQuality()
				L.overlays += image(/obj/HUD/E/)
				L.suffix = "Equip"
				L.icon_state = L.EquipState
				L.layer = 20
				L.Move(src)
				src.overlays+=image(L.icon,L.icon_state,L.ItemLayer)
				src.WLegs = L
				var/obj/Items/Weapons/Swords/Scimitar/S = new
				S.Material = "Copper"
				S.RandomItemQuality()
				S.Move(src)
				S.suffix = "Equip"
				S.overlays += image(/obj/HUD/E)
				S.icon_state = S.EquipState
				src.overlays+=image(S.icon,S.icon_state,S.ItemLayer)
				src.Weapon = S
				var/obj/Misc/Hairs/PotHead/Z = new
				src.Hair = Z
		src.icon_state = "N"
		src.PregType = "Womb"
		src.WeightMax = 100
		src.DieAge = rand(65,90)
		src.MagicPotentcy = rand(0,100)
		src.Strength += 5
		src.Agility += 5
		src.Endurance += 5
		src.Intelligence += 10
		src.StrCap = src.StrCap + 36 * Year
		src.EndCap = src.EndCap + 36 * Year
		src.AgilCap = src.AgilCap + 36 * Year
		src.IntCap = src.IntCap + 36 * Year
		src.SkillCap = src.SkillCap + 36 * Year
		src.StrengthMax = 50
		src.AgilityMax = 50
		src.EnduranceMax = 50
		src.IntelligenceMax = 50

		src.StrengthMulti = 0.1
		src.AgilityMulti = 0.1
		src.EnduranceMulti = 0.1
		src.IntelligenceMulti = 0.2

		src.SwordSkill += 10
		src.AxeSkill += 5
		src.SpearSkill += 5
		src.BluntSkill += 5
		src.RangedSkill += 10
		src.DaggerSkill += 5
		src.UnarmedSkill += 5
		src.ShieldSkill += 10

		src.SwordSkillMulti = 0.5
		src.AxeSkillMulti = 0.3
		src.SpearSkillMulti = 0.3
		src.BluntSkillMulti = 0.3
		src.RangedSkillMulti = 0.3
		src.DaggerSkillMulti = 0.3
		src.UnarmedSkillMulti = 0.3
		src.ShieldSkillMulti = 0.4
		src.CarpentrySkillMulti = 1
		src.MiningSkillMulti = 0.2
		src.MasonarySkillMulti = 0.8
		src.SmeltingSkillMulti = 0.8
		src.ForgingSkillMulti = 0.8
		src.WoodCuttingSkillMulti = 1
		src.AlchemySkillMulti = 1
		src.CookingSkillMulti = 1
		src.SkinningSkillMulti = 0.8
		src.LeatherCraftSkillMulti = 0.8
		src.FishingSkillMulti = 0.8
		src.BuildingSkillMulti = 0.8
		src.FarmingSkillMulti = 0.8
		src.WeavingSkillMulti = 0.8
		src.EngravingSkillMulti = 0.6
		src.FirstAidSkillMulti = 0.8
		src.ButcherySkillMulti = 0.6
		src.BoneCraftMulti = 0.2
		src.HungerMulti = 1
		src.Faction = "Human Empire"
		src.Blood = 100
		src.BloodMax = 100
		src.Born = Year
		src.DarkVision = 2
	src.CreateGUI()
	src.DisableAttack = 0
	src.Attack()
	src.BloodFlow()
	src.SleepTick()
	src.HungerTick()
	src.Regen()
	src.Update()
	src.DeadIcon = src.icon
	src.GiveRaceLanguages()
	if(src.Strength >= StrengthMax)
		src.Strength = StrengthMax
	if(src.Agility >= AgilityMax)
		src.Agility = AgilityMax
	if(src.Endurance >= EnduranceMax)
		src.Endurance = EnduranceMax
	if(src.Intelligence >= IntelligenceMax)
		src.Intelligence = IntelligenceMax
	for(var/obj/I in src)
		src.Weight += I.Weight
	for(var/obj/Items/Body/Bod in world)
		if(Bod.Owner == src.name)
			Bod.Owner = null

/mob/proc/ResetSelections()
	for(var/obj/HUD/Text/T in src.client.screen)
		del(T)
	for(var/obj/HUD/RaceSelection/S in src.client.screen)
		if(S.Type != "DontChange")
			S.icon_state = "[S.Type] off"
	src.Gender = null
	src.Race = null

/mob/proc/SwitchChild(var/mob/Child)
	src.loc = Child.loc
	src.Hair = Child.Hair
	src.Strength = Child.Strength
	src.Agility = Child.Agility
	src.Endurance = Child.Endurance
	src.luminosity = 0
	src.see_in_dark = src.DarkVision
	src.invisibility  = 0
	src.see_invisible = 0
	src.Fuel = 100
	src.Target = null
	src.CanMove = 1
	src.Dead = 0
	src.BloodMax = Child.BloodMax
	src.Blood = src.BloodMax
	src.Bleed = null
	src.Bleed()
	src.BloodFlow()
	src.CanSleep = 1
	src.CanEat = 1
	src.Pain = 0
	src.CanAttack = 1
	src.density = 1
	src.LeftArm = Child.LeftArm
	src.RightArm = Child.RightArm
	src.Torso = Child.Torso
	src.Head = Child.Head
	src.LeftLeg = Child.LeftLeg
	src.RightLeg = Child.RightLeg
	src.Skull = Child.Skull
	src.Brain = Child.Brain
	src.LeftEye = Child.LeftEye
	src.RightEye = Child.RightEye
	src.LeftEar = Child.LeftEar
	src.RightEar = Child.RightEar
	src.Nose = Child.Nose
	src.Teeth = Child.Teeth
	src.Tongue = Child.Tongue
	src.Throat = Child.Throat
	src.Heart = Child.Heart
	src.LeftLung = Child.LeftLung
	src.RightLung = Child.RightLung
	src.Spleen = Child.Spleen
	src.Intestine = Child.Intestine
	src.LeftKidney = Child.LeftKidney
	src.RightKidney = Child.RightKidney
	src.Liver = Child.Liver
	src.Bladder = Child.Bladder
	src.Stomach = Child.Stomach
	src.Faction = Child.Faction
	src.GoreCheck()
	if(src.client)
		src.Update()
		if(src.CanEat)
			src.HungerTick()
		if(src.CanSleep)
			src.SleepTick()
	if(Child.Hair)
		var/obj/Hir = Child.Hair
		var/icon/I
		I = initial(Hir.icon)
		Hir.icon = I
		src.overlays += Hir
		src.Hair = Hir
	if(Child.Beard)
		var/obj/Brd = Child.Beard
		var/icon/I
		I = initial(Brd.icon)
		Brd.icon = I
		src.overlays += Brd
		src.Beard = Brd
	src.icon = Child.icon
	src.LimbLoss()

/mob/proc/RemakeChoice()
	var/list/menu = new()
	menu += "Remake"
	menu += "Remain Dead"
	var/Result = input(src,"You have died. - Remaking will allow you to keep all of your stats and all of your skills, but your name, gender, race and IC knowledge will be lost. You will however be able to choose your race again, along with a new name and gender. Remaining dead will simply leave you as a ghost until someone revives you or your body is destroyed. Relogging will open this option up again.", "Choose", null) in menu
	if(Result == "Remake")
		for(var/obj/HUD/H in src.client.screen)
			del(H)
		src.loc = locate(11,11,2)
		src.CanEatRawMeats = 0
		src.CanSwimWell = 0
		src.CanRegenLimbs = 0
		src.CanBreathe = 1
		src.CanTakeDamage = 1
		src.CanUseTK = 0
		src.Pain = 0
		src.LoggedIn = 0
		src.Dead = 0
		src.Age = 0
		src.Born = 0
		src.DieAge = 10000000
		src.DisableAttack = 1
		src.Fainted = 0
		src.Stunned = 0
		src.density = 0
		src.invisibility = 0
		src.CanMove = 0
		src.luminosity = 0
		src.icon = null
		src.Race = null
		src.Gender = null
		src.Faction = null
		var/player_sav = "players/[src.ckey].sav"
		if(length(file(player_sav)))
			fdel(player_sav)

