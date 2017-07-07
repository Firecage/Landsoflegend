/mob/proc/GiveRank(var/Rank)
	if(Rank == "Human Empire Priest")
		src.WeightMax += 100
		src.Intelligence += 15
		src.IntCap += 15
		var/obj/Misc/Languages/Ancient/A = new
		A.SpeakPercent = 75
		A.WritePercent = 50
		src.LangKnow += A
		var/obj/Items/Weapons/Blunts/InquisitorsStaff/St = new
		var/obj/Items/Armour/Head/PriestHelmet/H = new
		var/obj/Items/Armour/Chest/PriestRobe/R = new
		var/obj/Items/Armour/UpperBody/PriestsChestPlate/C = new
		var/obj/Items/Armour/Waist/PriestBelt/B = new
		var/obj/Items/Armour/Shoulders/PriestsPauldrons/S = new
		var/obj/Items/Armour/LeftArm/PriestsLeftGauntlet/LG = new
		var/obj/Items/Armour/RightArm/PriestsRightGauntlet/RG = new
		var/obj/Items/Armour/LeftFoot/PriestsLeftBoot/LB = new
		var/obj/Items/Armour/RightFoot/PriestsRightBoot/RB = new
		var/obj/Items/Books_Scrolls/Book_of_Order/O = new
		O.Delete = 0
		St.Delete = 0
		H.Delete = 0
		R.Delete = 0
		C.Delete = 0
		B.Delete = 0
		S.Delete = 0
		LG.Delete = 0
		RG.Delete = 0
		LB.Delete = 0
		RB.Delete = 0
		O.Move(src)
		St.Move(src)
		H.Move(src)
		R.Move(src)
		C.Move(src)
		B.Move(src)
		S.Move(src)
		LG.Move(src)
		RG.Move(src)
		LB.Move(src)
		RB.Move(src)
		src.Weight += O.Weight
		src.Weight += St.Weight
		src.Weight += H.Weight
		src.Weight += R.Weight
		src.Weight += C.Weight
		src.Weight += B.Weight
		src.Weight += S.Weight
		src.Weight += LG.Weight
		src.Weight += RG.Weight
		src.Weight += LB.Weight
		src.Weight += RB.Weight
		O.suffix = "Carried"
		St.suffix = "Carried"
		H.suffix = "Carried"
		R.suffix = "Carried"
		C.suffix = "Carried"
		B.suffix = "Carried"
		S.suffix = "Carried"
		LG.suffix = "Carried"
		RG.suffix = "Carried"
		LB.suffix = "Carried"
		RB.suffix = "Carried"
		var/obj/Items/Misc/Key/K = new
		K.Material = "Gold"
		K.icon_state = "Gold key"
		K.tag = "Inquisitor Vault Key"
		for(var/obj/Items/Furniture/Doors/InquisitorIronDoor/D in world)
			if(D.loc == locate(106,45,3))
				K.KeyCode = D.KeyCode
		K.Move(src)
		K.suffix = "Carried"
		src.Weight += K.Weight
		var/obj/Items/Armour/Head/InquisitorsHelmet/IH = new
		var/obj/Items/Armour/UpperBody/InquisitorsChestPlate/IC = new
		var/obj/Items/Armour/Shoulders/InquisitorsPauldrons/IS = new
		var/obj/Items/Armour/LeftArm/InquisitorsLeftGauntlet/ILG = new
		var/obj/Items/Armour/RightArm/InquisitorsRightGauntlet/IRG = new
		var/obj/Items/Armour/LeftFoot/InquisitorsLeftBoot/ILB = new
		var/obj/Items/Armour/RightFoot/InquisitorsRightBoot/IRB = new
		IH.Delete = 0
		IC.Delete = 0
		IS.Delete = 0
		ILG.Delete = 0
		IRG.Delete = 0
		ILB.Delete = 0
		IRB.Delete = 0
		IH.pixel_y = 12
		IC.pixel_y = 12
		IS.pixel_y = 12
		ILG.pixel_y = 12
		IRG.pixel_y = 12
		ILB.pixel_y = 12
		IRB.pixel_y = 12
		IH.Move(locate(105,39,3))
		IC.Move(locate(105,39,3))
		IS.Move(locate(105,39,3))
		ILG.Move(locate(105,39,3))
		IRG.Move(locate(105,39,3))
		ILB.Move(locate(105,39,3))
		IRB.Move(locate(105,39,3))
		var/obj/Items/Weapons/Blunts/InquisitorsMaul/IM = new
		IM.pixel_y = 12
		IM.Delete = 0
		IM.Move(locate(103,40,3))
		var/obj/Items/Weapons/Swords/DemonicSword/DS = new
		DS.pixel_y = 12
		DS.Delete = 0
		DS.Move(locate(109,40,3))
		var/mob/NPC/Evil/Demonic/GreaterDemon/D = new
		D.CancelDefaultProc = 1
		spawn(100)
			D.loc = DS
			DS.DemonicSwordMagic()
		var/obj/Items/Armour/RightArm/Glove_of_Corruption/GoC = new
		GoC.pixel_y = 12
		GoC.Move(locate(107,39,3))
		var/obj/Items/Books_Scrolls/Book_of_Necromancy/NB = new
		NB.pixel_y = 10
		NB.Move(locate(106,41,3))
		var/obj/Items/Magical/Mystical_Ball/MB = new
		MB.pixel_y = 17
		MB.Move(locate(106,39,3))
		var/obj/Items/Currency/GoldCoin/G = new
		G.Type = 1000
		G.Move(src)
		G.suffix = "Carried"
		G.name = "[G.Type] [G.name]"
		G.icon_state = "gold coin >100"
		SaveMap()
		src << "<font color = teal>You have been granted the Rank of Human Priest of Order. Your Job will be to Role Play a high ranking Monk, making sure that no harm comes to anyone involved with the Human Empire, or the Inquisition. The King and Queen of the Human Empire know of you. You have been granted a full set of Priest Armour, and a Priest Staff, and also a very powerful Book of Order. You must never, ever, give this book to anyone, not even the King or Queen, the same goes for your armour. They belong to you, and they belong to the God of Order. If there is no offical King or Queen, the Priest rules in place, however, the Priest is never higher rank than the King and Queen, and as such, can not overule any orders that they give. You must be a Good Person, and not Evil, however, you are allowed to be Paranoid. If you suspect someone of being Evil, you can Torture them until they admit to wrong doings or Evil involement, but this all requires good RP reasons, ect. The Book of Order can Revive NPC and Players, but each time you use it, you Must Role Play doing so. Breaking any of the previously mentioned requirements or rules that involve the Priest Rank, will get you stripped of said Rank or even Ban. Your character now has knowledge of all Undead creatures, and also where the Undead lands are, ect. You also know of Demons, and all Gods, as well as any and all Evil Relics, Artifacts, or Books. You have also learned alot of the Ancient Language, from old Scrolls and Books, and have been given a Plus 15 Intelligence boost to help you learn other Languages faster. You've also been given a special key to un-lock the Inquisitor Artifact Vault. You are NOT to take ANYTHING from this vault without having both a Good Role Play Reason and having asked an Admin first. The vaults location is in the bottom of the Inquisitor Tower and is mainly used to lock away dangerous things.<br>"
		world << "<font color = yellow>All around the Human kingdom people far and wide begin to hear of a ceremony. A new Priest of Order had been selected by ancient Decree and instated with the responsibility of ruling the Inquisition and even the entire Human Empire when needed. Word of this slowly spreads outside of the Humans lands as both ally and enemy hear the news."
	if(Rank == "Diplomat")
		src.LangKnow = null
		src.LangKnow = list()

		var/obj/Misc/Languages/Altherian/A = new
		A.SpeakPercent = 100
		A.WritePercent = 100
		src.LangKnow += A
		src.CurrentLanguage = A

		var/obj/Misc/Languages/Common/C = new
		C.SpeakPercent = 100
		C.WritePercent = 100
		src.LangKnow += C

		var/obj/Misc/Languages/Human/H = new
		H.SpeakPercent = 100
		H.WritePercent = 100
		src.LangKnow += H

		var/obj/Misc/Languages/Ribbitus/R = new
		R.SpeakPercent = 100
		R.WritePercent = 100
		src.LangKnow += R

		var/obj/Misc/Languages/Scutter/S = new
		S.SpeakPercent = 100
		S.WritePercent = 100
		src.LangKnow += S

		var/obj/Misc/Languages/Slithus/Sl = new
		Sl.SpeakPercent = 100
		Sl.WritePercent = 100
		src.LangKnow += Sl

		var/obj/Misc/Languages/Stahliteian/St = new
		St.SpeakPercent = 100
		St.WritePercent = 100
		src.LangKnow += St

		var/obj/Misc/Languages/Wolfen/W = new
		W.SpeakPercent = 100
		W.WritePercent = 100
		src.LangKnow += W

		src << "<font color = teal>You have been Granted the Rank of Diplomat, your task is to work along side your King/Queen and his/her minions, translating what other races say and also being a messanger. You have all the Languages and are 100% Fluent in them all. The King/Queen of your Kingdom is aware of you ICly as soon as your Rank is given.<br>"
	if(Rank == "Weapon Master")
		src.Agility += 5
		src.Strength += 5
		src.WeightMax += 10
		src.Endurance += 5
		src.AgilCap += 5
		src.StrCap += 5
		src.EndCap += 5
		src.DieAge += 5
		src.Age += 25
		src.Born -= 25
		var/obj/Wep
		var/list/menu = new()
		menu += "Sword"
		menu += "Broad Sword"
		menu += "Battle Axe"
		menu += "Mace"
		menu += "Maul"
		menu += "Spear"
		menu += "Dagger"
		menu += "Bow"
		var/Result = input(src,"Choose a Custom Weapon. You will gain a +50 Skill Bonus in the weapon type you choose.", "Choose", null) in menu
		if(Result == "Sword")
			var/obj/Items/Weapons/Swords/LongSword/W = new
			Wep = W
			src.SwordSkill += 25
		if(Result == "Broad Sword")
			var/obj/Items/Weapons/Swords/BroadSword/W = new
			Wep = W
			src.SwordSkill += 25
		if(Result == "Battle Axe")
			var/obj/Items/Weapons/Axes/BattleAxe/W = new
			Wep = W
			src.AxeSkill += 25
		if(Result == "Mace")
			var/obj/Items/Weapons/Blunts/Mace/W = new
			Wep = W
			src.BluntSkill += 25
		if(Result == "Maul")
			var/obj/Items/Weapons/Blunts/Maul/W = new
			Wep = W
			src.BluntSkill += 25
		if(Result == "Spear")
			var/obj/Items/Weapons/Spears/Spear/W = new
			Wep = W
			src.SpearSkill += 25
		if(Result == "Dagger")
			var/obj/Items/Weapons/Daggers/Dagger/W = new
			Wep = W
			src.DaggerSkill += 25
		if(Result == "Bow")
			var/obj/Items/Weapons/Ranged/Bow/W = new
			Wep = W
			src.RangedSkill += 25
		Wep.Dura = 500
		Wep.Weight = 7
		Wep.Quality = 15
		Wep.Move(src)
		src.Weight += Wep.Weight
		Wep.suffix = "Carried"
		Wep.Material = "Iron"
		Wep.CarryState = "Iron [Wep.CarryState]"
		Wep.EquipState = "Iron [Wep.EquipState] equip"
		Wep.icon_state = Wep.CarryState
		Wep.overlays+=image(/obj/HUD/C/)
		Wep.desc = "This is a [Wep], it is made from Iron. The Date it was created is etched on the side, Year 1, Month 0. The [Wep] seems to be of Grand Quality."
		var/list/looks = new()
		looks += "Default"
		looks += "Artifact"
		looks += "Corrupted"
		var/Result2 = input(src,"Choose an apperance for your Custom Weapon.", "Choose", null) in looks
		if(Result2 == "Artifact")
			if(Wep.name == "LongSword")
				Wep.icon_state = "Artifact sword"
				Wep.CarryState = "Artifact sword"
				Wep.EquipState = "Artifact sword equip"
			if(Wep.name == "BroadSword")
				Wep.icon_state = "Artifact broadsword"
				Wep.CarryState = "Artifact broadsword"
				Wep.EquipState = "Artifact broadsword equip"
			if(Wep.name == "BattleAxe")
				Wep.icon_state = "Artifact axe"
				Wep.CarryState = "Artifact axe"
				Wep.EquipState = "Artifact axe equip"
			if(Wep.name == "Mace")
				Wep.icon_state = "Artifact mace2"
				Wep.CarryState = "Artifact mace2"
				Wep.EquipState = "Artifact mace2 equip"
			if(Wep.name == "Maul")
				Wep.icon_state = "Artifact maul"
				Wep.CarryState = "Artifact maul"
				Wep.EquipState = "Artifact maul equip"
			if(Wep.name == "Spear")
				Wep.icon_state = "Artifact spear"
				Wep.CarryState = "Artifact spear"
				Wep.EquipState = "Artifact spear equip"
			if(Wep.name == "Dagger")
				Wep.icon_state = "Artifact dagger"
				Wep.CarryState = "Artifact dagger"
				Wep.EquipState = "Artifact dagger equip"
			if(Wep.name == "Bow")
				Wep.icon_state = "Artifact bow"
				Wep.CarryState = "Artifact bow"
				Wep.EquipState = "Artifact bow equip"
		if(Result2 == "Corrupted")
			if(Wep.name == "LongSword")
				Wep.icon_state = "Corrupted sword"
				Wep.CarryState = "Corrupted sword"
				Wep.EquipState = "Corrupted sword equip"
			if(Wep.name == "BroadSword")
				Wep.icon_state = "Corrupted broadsword"
				Wep.CarryState = "Corrupted broadsword"
				Wep.EquipState = "Corrupted broadsword equip"
			if(Wep.name == "BattleAxe")
				Wep.icon_state = "Corrupted axe"
				Wep.CarryState = "Corrupted axe"
				Wep.EquipState = "Corrupted axe equip"
			if(Wep.name == "Mace")
				Wep.icon_state = "Corrupted mace2"
				Wep.CarryState = "Corrupted mace2"
				Wep.EquipState = "Corrupted mace2 equip"
			if(Wep.name == "Maul")
				Wep.icon_state = "Corrupted maul"
				Wep.CarryState = "Corrupted maul"
				Wep.EquipState = "Corrupted maul equip"
			if(Wep.name == "Spear")
				Wep.icon_state = "Corrupted spear"
				Wep.CarryState = "Corrupted spear"
				Wep.EquipState = "Corrupted spear equip"
			if(Wep.name == "Dagger")
				Wep.icon_state = "Corrupted dagger"
				Wep.CarryState = "Corrupted dagger"
				Wep.EquipState = "Corrupted dagger equip"
			if(Wep.name == "Bow")
				Wep.icon_state = "Corrupted bow"
				Wep.CarryState = "Corrupted bow"
				Wep.EquipState = "Corrupted bow equip"
		var/WepName=input(src,"Name your weapon.")as text
		Wep.name = WepName
		src << "<font color = teal>You have been Granted the Rank of Weapon Master, this Rank has no True Static Purpose, you could choose to be a Teacher, Hermit, General, Leader, Villian, anything you desire, but you cant instantly use your skills to attack any of the Kings/Queens directly until Year 15+, if you attempt to, you will be Stripped of your Rank and Deducted. You have also been granted a +5 in Strength, Endurance, and Agility. You are now Twenty Five(25) Years older than before, and you will now live +5 more Years longer than your Average Race. No one knows of you ICly.<br>"
	if(Rank == "King/Queen")
		var/list/kingdom = new()
		kingdom += "Human Kingdom"
		kingdom += "Alther Kingdom"
		kingdom += "Stahlite Kingdom"
		kingdom += "Snakeman Kingdom"
		kingdom += "Frogman Tribe"
		kingdom += "Ratling Horde"
		kingdom += "Giant Kingdom"
		kingdom += "Cyclops Horde"
		var/KingdomResult = input(usr,"Which Kingdom will they rule?", "Choose", null) in kingdom
		world << "<font color = yellow>All around the [KingdomResult] followers far and wide begin to hear of a ceremony. Someone of supposed royal blood had been elected ruler this day. Word of this grand event travels to every corner of the known world, even to those on ill terms with the [KingdomResult].<br>"
		src.DieAge += 10
		var/obj/Items/Currency/GoldCoin/G = new
		G.Type = 500
		G.suffix = "Carried"
		G.Move(src)
		G.name = "[G.Type] [G.name]"
		G.icon_state = "gold coin >100"
		if(src.Race != "Stahlite" && src.Race != "Ratling" && src.Race != "Giant" && src.Race != "Cyclops")
			var/obj/Items/Armour/Head/Crown/C = new
			C.Move(src)
			src.Weight += C.Weight
			C.suffix = "Carried"
			C.overlays+=image(/obj/HUD/C/)

			var/obj/Items/Armour/Chest/KingsRobe/R = new
			R.Move(src)
			src.Weight += R.Weight
			R.suffix = "Carried"
			R.overlays+=image(/obj/HUD/C/)

			var/obj/Items/Armour/Head/PlateHelmet3/H = new
			H.Move(src)
			H.Defence = 10
			H.Dura = 100
			H.CarryState = "Gold [H.icon_state]"
			H.EquipState = "Gold [H.icon_state] equip"
			H.icon_state = "Gold [H.icon_state]"
			src.Weight += H.Weight
			H.suffix = "Carried"
			H.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/UpperBody/ChestPlate/CP = new
			CP.Move(src)
			CP.Defence = 10
			CP.Dura = 100
			CP.CarryState = "Gold [CP.icon_state]"
			CP.EquipState = "Gold [CP.icon_state] equip"
			CP.icon_state = "Gold [CP.icon_state]"
			src.Weight += CP.Weight
			CP.suffix = "Carried"
			CP.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/Shoulders/PlatePauldrons/S = new
			S.Move(src)
			S.Defence = 10
			S.Dura = 100
			S.CarryState = "Gold [S.icon_state]"
			S.EquipState = "Gold [S.icon_state] equip"
			S.icon_state = "Gold [S.icon_state]"
			src.Weight += S.Weight
			S.suffix = "Carried"
			S.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftArm/PlateGauntletLeft/LG = new
			LG.Move(src)
			LG.Defence = 10
			LG.Dura = 100
			LG.CarryState = "Gold [LG.icon_state]"
			LG.EquipState = "Gold [LG.icon_state] equip"
			LG.icon_state = "Gold [LG.icon_state]"
			src.Weight += LG.Weight
			LG.suffix = "Carried"
			LG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightArm/PlateGauntletRight/RG = new
			RG.Move(src)
			RG.Defence = 10
			RG.Dura = 100
			RG.CarryState = "Gold [RG.icon_state]"
			RG.EquipState = "Gold [RG.icon_state] equip"
			RG.icon_state = "Gold [RG.icon_state]"
			src.Weight += RG.Weight
			RG.suffix = "Carried"
			RG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftFoot/PlateBootLeft/LB = new
			LB.Move(src)
			LB.Defence = 10
			LB.Dura = 100
			LB.CarryState = "Gold [LB.icon_state]"
			LB.EquipState = "Gold [LB.icon_state] equip"
			LB.icon_state = "Gold [LB.icon_state]"
			src.Weight += LB.Weight
			LB.suffix = "Carried"
			LB.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightFoot/PlateBootRight/RB = new
			RB.Move(src)
			RB.Defence = 10
			RB.Dura = 100
			RB.CarryState = "Gold [RB.icon_state]"
			RB.EquipState = "Gold [RB.icon_state] equip"
			RB.icon_state = "Gold [RB.icon_state]"
			src.Weight += RB.Weight
			RB.suffix = "Carried"
			RB.overlays+=image(/obj/HUD/C/)
		var/SmallRace = 0
		var/LargeRace = 0
		if(src.Race == "Stahlite")
			SmallRace = 1
			var/obj/Items/Armour/Head/SmallDwarvenHelmet2/H = new
			H.Move(src)
			H.Defence = 10
			H.Dura = 100
			H.CarryState = "Gold [H.icon_state]"
			H.EquipState = "Gold [H.icon_state] equip"
			H.icon_state = "Gold [H.icon_state]"
			src.Weight += H.Weight
			H.suffix = "Carried"
			H.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/UpperBody/SmallChestPlate/CP = new
			CP.Move(src)
			CP.Defence = 10
			CP.Dura = 100
			CP.CarryState = "Gold [CP.icon_state]"
			CP.EquipState = "Gold [CP.icon_state] equip"
			CP.icon_state = "Gold [CP.icon_state]"
			src.Weight += CP.Weight
			CP.suffix = "Carried"
			CP.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/Shoulders/SmallPlatePauldrons/S = new
			S.Move(src)
			S.Defence = 10
			S.Dura = 100
			S.CarryState = "Gold [S.icon_state]"
			S.EquipState = "Gold [S.icon_state] equip"
			S.icon_state = "Gold [S.icon_state]"
			src.Weight += S.Weight
			S.suffix = "Carried"
			S.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftArm/SmallPlateGauntletLeft/LG = new
			LG.Move(src)
			LG.Defence = 10
			LG.Dura = 100
			LG.CarryState = "Gold [LG.icon_state]"
			LG.EquipState = "Gold [LG.icon_state] equip"
			LG.icon_state = "Gold [LG.icon_state]"
			src.Weight += LG.Weight
			LG.suffix = "Carried"
			LG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightArm/SmallPlateGauntletRight/RG = new
			RG.Move(src)
			RG.Defence = 10
			RG.Dura = 100
			RG.CarryState = "Gold [RG.icon_state]"
			RG.EquipState = "Gold [RG.icon_state] equip"
			RG.icon_state = "Gold [RG.icon_state]"
			src.Weight += RG.Weight
			RG.suffix = "Carried"
			RG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftFoot/SmallPlateBootLeft/LB = new
			LB.Move(src)
			LB.Defence = 10
			LB.Dura = 100
			LB.CarryState = "Gold [LB.icon_state]"
			LB.EquipState = "Gold [LB.icon_state] equip"
			LB.icon_state = "Gold [LB.icon_state]"
			src.Weight += LB.Weight
			LB.suffix = "Carried"
			LB.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightFoot/SmallPlateBootRight/RB = new
			RB.Move(src)
			RB.Defence = 10
			RB.Dura = 100
			RB.CarryState = "Gold [RB.icon_state]"
			RB.EquipState = "Gold [RB.icon_state] equip"
			RB.icon_state = "Gold [RB.icon_state]"
			src.Weight += RB.Weight
			RB.suffix = "Carried"
			RB.overlays+=image(/obj/HUD/C/)
		if(src.Race == "Ratling")
			SmallRace = 1
			var/obj/Items/Armour/Head/PlateHelmetRat/H = new
			H.Move(src)
			H.Defence = 10
			H.Dura = 100
			H.CarryState = "Iron rat plate helm"
			H.EquipState = "Iron rat plate helm equip"
			H.icon_state = "Iron rat plate helm"
			src.Weight += H.Weight
			H.suffix = "Carried"
			H.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/Chest/RatChainShirt/CP = new
			CP.Move(src)
			CP.Defence = 10
			CP.Dura = 100
			CP.CarryState = "Iron folded chain"
			CP.EquipState = "Iron [CP.EquipState] equip"
			CP.icon_state = "Iron folded chain"
			src.Weight += CP.Weight
			CP.suffix = "Carried"
			CP.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/UpperBody/RatChestPlate/GCP = new
			GCP.Move(src)
			GCP.Defence = 10
			GCP.Dura = 100
			GCP.CarryState = "Iron rat chestplate"
			GCP.EquipState = "Iron rat chestplate equip"
			GCP.icon_state = "Iron rat chestplate"
			src.Weight += GCP.Weight
			GCP.suffix = "Carried"
			GCP.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/Legs/RatChainLeggings/L = new
			L.Move(src)
			L.Defence = 10
			L.Dura = 100
			L.CarryState = "Iron folded chain"
			L.EquipState = "Iron [L.EquipState] equip"
			L.icon_state = "Iron folded chain"
			src.Weight += CP.Weight
			L.suffix = "Carried"
			L.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftArm/RatPlateGauntletLeft/LG = new
			LG.Move(src)
			LG.Defence = 10
			LG.Dura = 100
			LG.CarryState = "Iron rat plateglove left"
			LG.EquipState = "Iron rat plateglove left equip"
			LG.icon_state = "Iron rat plateglove left"
			src.Weight += LG.Weight
			LG.suffix = "Carried"
			LG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightArm/RatPlateGauntletRight/RG = new
			RG.Move(src)
			RG.Defence = 10
			RG.Dura = 100
			RG.CarryState = "Iron rat plateglove right"
			RG.EquipState = "Iron rat plateglove right equip"
			RG.icon_state = "Iron rat plateglove right"
			src.Weight += RG.Weight
			RG.suffix = "Carried"
			RG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftFoot/RatPlateBootLeft/LB = new
			LB.Move(src)
			LB.Defence = 10
			LB.Dura = 100
			LB.CarryState = "Iron rat plateboot left"
			LB.EquipState = "Iron rat plateboot left equip"
			LB.icon_state = "Iron rat plateboot left"
			src.Weight += LB.Weight
			LB.suffix = "Carried"
			LB.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightFoot/RatPlateBootRight/RB = new
			RB.Move(src)
			RB.Defence = 10
			RB.Dura = 100
			RB.CarryState = "Iron rat plateboot right"
			RB.EquipState = "Iron rat plateboot right equip"
			RB.icon_state = "Iron rat plateboot right"
			src.Weight += RB.Weight
			RB.suffix = "Carried"
			RB.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/Shoulders/RatPlatePauldrons/S = new
			S.Move(src)
			S.Defence = 10
			S.Dura = 100
			S.CarryState = "Iron rat shoulders"
			S.EquipState = "Iron rat shoulders equip"
			S.icon_state = "Iron rat shoulders"
			src.Weight += S.Weight
			S.suffix = "Carried"
			S.overlays+=image(/obj/HUD/C/)
		if(SmallRace)
			var/obj/Items/Armour/Head/SmallCrown/C = new
			C.Move(src)
			src.Weight += C.Weight
			C.suffix = "Carried"
			C.overlays+=image(/obj/HUD/C/)
		if(src.Race == "Giant")
			LargeRace = 1
		if(src.Race == "Cyclops")
			LargeRace = 1
		if(LargeRace)
			var/obj/Items/Armour/Head/GiantCrown/C = new
			C.Move(src)
			src.Weight += C.Weight
			C.suffix = "Carried"
			C.overlays+=image(/obj/HUD/C/)

			var/obj/Items/Armour/Head/GiantChainCoif/H = new
			H.Move(src)
			H.Defence = 10
			H.Dura = 100
			H.CarryState = "Iron folded chain"
			H.EquipState = "Iron [H.EquipState] equip"
			H.icon_state = "Iron folded chain"
			src.Weight += H.Weight
			H.suffix = "Carried"
			H.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/Chest/GiantChainShirt/CP = new
			CP.Move(src)
			CP.Defence = 10
			CP.Dura = 100
			CP.CarryState = "Iron folded chain"
			CP.EquipState = "Iron [CP.EquipState] equip"
			CP.icon_state = "Iron folded chain"
			src.Weight += CP.Weight
			CP.suffix = "Carried"
			CP.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/UpperBody/GiantChestPlate/GCP = new
			GCP.Move(src)
			GCP.Defence = 10
			GCP.Dura = 100
			GCP.CarryState = "Iron giant chestplate"
			GCP.EquipState = "Iron giant chestplate equip"
			GCP.icon_state = "Iron giant chestplate"
			src.Weight += GCP.Weight
			GCP.suffix = "Carried"
			GCP.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/Legs/GiantChainLeggings/L = new
			L.Move(src)
			L.Defence = 10
			L.Dura = 100
			L.CarryState = "Iron folded chain"
			L.EquipState = "Iron [L.EquipState] equip"
			L.icon_state = "Iron folded chain"
			src.Weight += CP.Weight
			L.suffix = "Carried"
			L.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftArm/GiantPlateGloveLeft/LG = new
			LG.Move(src)
			LG.Defence = 10
			LG.Dura = 100
			LG.CarryState = "Iron giant plateglove left"
			LG.EquipState = "Iron giant plateglove left equip"
			LG.icon_state = "Iron giant plateglove left"
			src.Weight += LG.Weight
			LG.suffix = "Carried"
			LG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightArm/GiantPlateGloveRight/RG = new
			RG.Move(src)
			RG.Defence = 10
			RG.Dura = 100
			RG.CarryState = "Iron giant plateglove right"
			RG.EquipState = "Iron giant plateglove right equip"
			RG.icon_state = "Iron giant plateglove right"
			src.Weight += RG.Weight
			RG.suffix = "Carried"
			RG.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/LeftFoot/GiantPlateBootLeft/LB = new
			LB.Move(src)
			LB.Defence = 10
			LB.Dura = 100
			LB.CarryState = "Iron giant plateboot left"
			LB.EquipState = "Iron giant plateboot left equip"
			LB.icon_state = "Iron giant plateboot left"
			src.Weight += LB.Weight
			LB.suffix = "Carried"
			LB.overlays+=image(/obj/HUD/C/)
			var/obj/Items/Armour/RightFoot/GiantPlateBootRight/RB = new
			RB.Move(src)
			RB.Defence = 10
			RB.Dura = 100
			RB.CarryState = "Iron giant plateboot right"
			RB.EquipState = "Iron giant plateboot right equip"
			RB.icon_state = "Iron giant plateboot right"
			src.Weight += RB.Weight
			RB.suffix = "Carried"
			RB.overlays+=image(/obj/HUD/C/)
		var/obj/Wep
		var/list/menu = new()
		menu += "Sword"
		menu += "Broad Sword"
		menu += "Battle Axe"
		menu += "Mace"
		menu += "Maul"
		menu += "Spear"
		menu += "Dagger"
		menu += "Bow"
		var/Result = input(src,"Choose a Custom Royal Weapon.", "Choose", null) in menu
		if(Result == "Sword")
			var/obj/Items/Weapons/Swords/LongSword/W = new
			Wep = W
		if(Result == "Broad Sword")
			var/obj/Items/Weapons/Swords/BroadSword/W = new
			Wep = W
		if(Result == "Battle Axe")
			var/obj/Items/Weapons/Axes/BattleAxe/W = new
			Wep = W
		if(Result == "Mace")
			var/obj/Items/Weapons/Blunts/Mace/W = new
			Wep = W
		if(Result == "Maul")
			var/obj/Items/Weapons/Blunts/Maul/W = new
			Wep = W
		if(Result == "Spear")
			var/obj/Items/Weapons/Spears/Spear/W = new
			Wep = W
		if(Result == "Dagger")
			var/obj/Items/Weapons/Daggers/Dagger/W = new
			Wep = W
		if(Result == "Bow")
			var/obj/Items/Weapons/Ranged/Bow/W = new
			Wep = W
		Wep.Dura = 1000
		Wep.Weight = 5
		Wep.Quality = 15
		Wep.Move(src)
		src.Weight += Wep.Weight
		Wep.Material = "Iron"
		Wep.CarryState = "Iron [Wep.CarryState]"
		Wep.EquipState = "Iron [Wep.EquipState] equip"
		Wep.icon_state = Wep.CarryState
		Wep.suffix = "Carried"
		Wep.overlays+=image(/obj/HUD/C/)
		Wep.desc = "This is a [Wep], it is made from Iron. The Date it was created is etched on the side, Year 1, Month 0. The [Wep] seems to be of Grand Quality."
		var/list/looks = new()
		looks += "Default"
		looks += "Artifact"
		looks += "Corrupted"
		var/Result2 = input(src,"Choose an apperance for your Custom Weapon.", "Choose", null) in looks
		if(Result2 == "Artifact")
			if(Wep.name == "LongSword")
				Wep.icon_state = "Artifact sword"
				Wep.CarryState = "Artifact sword"
				Wep.EquipState = "Artifact sword equip"
			if(Wep.name == "BroadSword")
				Wep.icon_state = "Artifact broadsword"
				Wep.CarryState = "Artifact broadsword"
				Wep.EquipState = "Artifact broadsword equip"
			if(Wep.name == "BattleAxe")
				Wep.icon_state = "Artifact axe"
				Wep.CarryState = "Artifact axe"
				Wep.EquipState = "Artifact axe equip"
			if(Wep.name == "Mace")
				Wep.icon_state = "Artifact mace2"
				Wep.CarryState = "Artifact mace2"
				Wep.EquipState = "Artifact mace2 equip"
			if(Wep.name == "Maul")
				Wep.icon_state = "Artifact maul"
				Wep.CarryState = "Artifact maul"
				Wep.EquipState = "Artifact maul equip"
			if(Wep.name == "Spear")
				Wep.icon_state = "Artifact spear"
				Wep.CarryState = "Artifact spear"
				Wep.EquipState = "Artifact spear equip"
			if(Wep.name == "Dagger")
				Wep.icon_state = "Artifact dagger"
				Wep.CarryState = "Artifact dagger"
				Wep.EquipState = "Artifact dagger equip"
			if(Wep.name == "Bow")
				Wep.icon_state = "Artifact bow"
				Wep.CarryState = "Artifact bow"
				Wep.EquipState = "Artifact bow equip"
		if(Result2 == "Corrupted")
			if(Wep.name == "LongSword")
				Wep.icon_state = "Corrupted sword"
				Wep.CarryState = "Corrupted sword"
				Wep.EquipState = "Corrupted sword equip"
			if(Wep.name == "BroadSword")
				Wep.icon_state = "Corrupted broadsword"
				Wep.CarryState = "Corrupted broadsword"
				Wep.EquipState = "Corrupted broadsword equip"
			if(Wep.name == "BattleAxe")
				Wep.icon_state = "Corrupted axe"
				Wep.CarryState = "Corrupted axe"
				Wep.EquipState = "Corrupted axe equip"
			if(Wep.name == "Mace")
				Wep.icon_state = "Corrupted mace2"
				Wep.CarryState = "Corrupted mace2"
				Wep.EquipState = "Corrupted mace2 equip"
			if(Wep.name == "Maul")
				Wep.icon_state = "Corrupted maul"
				Wep.CarryState = "Corrupted maul"
				Wep.EquipState = "Corrupted maul equip"
			if(Wep.name == "Spear")
				Wep.icon_state = "Corrupted spear"
				Wep.CarryState = "Corrupted spear"
				Wep.EquipState = "Corrupted spear equip"
			if(Wep.name == "Dagger")
				Wep.icon_state = "Corrupted dagger"
				Wep.CarryState = "Corrupted dagger"
				Wep.EquipState = "Corrupted dagger equip"
			if(Wep.name == "Bow")
				Wep.icon_state = "Corrupted bow"
				Wep.CarryState = "Corrupted bow"
				Wep.EquipState = "Corrupted bow equip"
		var/WepName=input(src,"Name your weapon.")as text
		Wep.name = WepName
		src << "<font color = teal>You have been granted the rank of King/Queen, it is your duty to unite your Race under your banner and keep Order, or Choas, within your lands. Lead your Race to glory and create allies with the other Races, or become an Evil Tyrant and crush all that stand in your way. You will need to be fairly Active with this Rank and also Interact with others often. You can choose someone you deem worthy of being a good role player, intelligent, and active to be your spouse, and can also Appoint your own Diplomat and Blacksmith, but you must let an Admin know so they can grant the Player the Rank. As a King/Queen, you will live an extra Ten(10) years longer than anyone else of your race, depending on what your Die Age was orginally. You have been granted a Crown and Weapon, do not give either to anyone at any cost. All of your Race that make a character -After- you are crowned know your name and appearance ICly. You are aware of the Diplomat and BlackSmiths of your race ICly as soon as they recive their Ranks.<br>"
	if(Rank == "BlackSmith")
		src.SmeltingSkill += 10
		src.ForgingSkill += 10
		src.MiningSkill += 10
		src.SmeltingSkillMulti += 0.1
		src.ForgingSkillMulti += 0.1
		src.MiningSkillMulti += 0.1
		src.Strength += 5
		src.Agility += 5
		src.Endurance += 5
		src.SkillCap += 5
		src.StrCap += 5
		src.AgilCap += 5
		src.EndCap += 5
		src.WeightMax += 100
		src.CreateList = null
		src.CreateList = list()
		var/obj/Items/Weapons/Blunts/Hammer/H = new
		H.Material = "Iron"
		H.RandomItemQuality()
		src.Weight += H.Weight
		H.Move(src)
		H.suffix = "Carried"
		H.overlays += image(/obj/HUD/C/)
		H.icon_state = H.CarryState

		var/obj/Items/Weapons/Blunts/Shovel/S = new
		S.Material = "Iron"
		S.RandomItemQuality()
		S.Move(src)
		src.Weight += S.Weight
		S.suffix = "Carried"
		S.overlays += image(/obj/HUD/C/)
		S.icon_state = S.CarryState

		var/obj/Items/Weapons/Axes/Hatchet/Ax = new
		Ax.Material = "Iron"
		Ax.RandomItemQuality()
		Ax.Move(src)
		src.Weight += Ax.Weight
		Ax.suffix = "Carried"
		Ax.overlays += image(/obj/HUD/C/)
		Ax.icon_state = Ax.CarryState

		var/obj/Items/Weapons/Axes/PickAxe/P = new
		P.Material = "Iron"
		P.RandomItemQuality()
		P.Move(src)
		src.Weight += P.Weight
		P.suffix = "Carried"
		P.overlays += image(/obj/HUD/C/)
		P.icon_state = P.CarryState

		var/obj/Items/Weapons/Swords/Saw/Sa = new
		Sa.Material = "Iron"
		Sa.RandomItemQuality()
		Sa.Move(src)
		src.Weight += Sa.Weight
		Sa.suffix = "Carried"
		Sa.overlays += image(/obj/HUD/C/)
		Sa.icon_state = Sa.CarryState
		var/Swords = list()
		Swords += typesof(/obj/Items/Weapons/Swords/)
		for(var/O in Swords)
			var/obj/I = new O()
			if(I.CanBeCrafted)
				var/Mat = list("Iron","Copper","Silver")
				for(var/M in Mat)
					var/obj/A = new I.type()
					A.CarryState = "[M] [I.icon_state]"
					A.EquipState = "[M] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = M
					src.CreateList += A

			else
				del(I)
		var/Axes = list()
		Axes += typesof(/obj/Items/Weapons/Axes/)
		for(var/O in Axes)
			var/obj/I = new O()
			if(I.CanBeCrafted)
				var/Mat = list("Iron","Copper","Silver")
				for(var/M in Mat)
					var/obj/A = new I.type()
					A.CarryState = "[M] [I.icon_state]"
					A.EquipState = "[M] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = M
					src.CreateList += A

			else
				del(I)
		var/Spears = list()
		Spears += typesof(/obj/Items/Weapons/Spears/)
		for(var/O in Spears)
			var/obj/I = new O()
			if(I.CanBeCrafted)
				var/Mat = list("Iron","Copper","Silver")
				for(var/M in Mat)
					var/obj/A = new I.type()
					A.CarryState = "[M] [I.icon_state]"
					A.EquipState = "[M] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = M
					src.CreateList += A

			else
				del(I)
		var/Blunts = list()
		Blunts += typesof(/obj/Items/Weapons/Blunts/)
		for(var/O in Blunts)
			var/obj/I = new O()
			if(I.CanBeCrafted)
				var/Mat = list("Iron","Copper","Silver")
				for(var/M in Mat)
					var/obj/A = new I.type()
					A.CarryState = "[M] [I.icon_state]"
					A.EquipState = "[M] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = M
					src.CreateList += A

			else
				del(I)
		var/Ranged = list()
		Ranged += typesof(/obj/Items/Weapons/Ranged/)
		for(var/O in Ranged)
			var/obj/I = new O()
			if(I.CanBeCrafted)
				var/Mat = list("Iron","Copper","Silver")
				for(var/M in Mat)
					var/obj/A = new I.type()
					A.CarryState = "[M] [I.icon_state]"
					A.EquipState = "[M] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = M
					src.CreateList += A

			else
				del(I)
		var/Daggers = list()
		Daggers += typesof(/obj/Items/Weapons/Daggers/)
		for(var/O in Daggers)
			var/obj/I = new O()
			if(I.CanBeCrafted)
				var/Mat = list("Iron","Copper","Silver")
				for(var/M in Mat)
					var/obj/A = new I.type()
					A.CarryState = "[M] [I.icon_state]"
					A.EquipState = "[M] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = M
					src.CreateList += A

			else
				del(I)

		var/UpperBody = list()
		UpperBody += typesof(/obj/Items/Armour/UpperBody/)
		for(var/O in UpperBody)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/Shoulders = list()
		Shoulders += typesof(/obj/Items/Armour/Shoulders/)
		for(var/O in Shoulders)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/Shields = list()
		Shields += typesof(/obj/Items/Armour/Shields/)
		for(var/O in Shields)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.icon_state] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/Legs = list()
		Legs += typesof(/obj/Items/Armour/Legs/)
		for(var/O in Legs)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.EquipState] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/Chest = list()
		Chest += typesof(/obj/Items/Armour/Chest/)
		for(var/O in Chest)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.EquipState] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/Head = list()
		Head += typesof(/obj/Items/Armour/Head/)
		for(var/O in Head)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.EquipState] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/LeftArm = list()
		LeftArm += typesof(/obj/Items/Armour/LeftArm/)
		for(var/O in LeftArm)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.EquipState] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/RightArm = list()
		RightArm += typesof(/obj/Items/Armour/RightArm/)
		for(var/O in RightArm)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.EquipState] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/LeftFoot = list()
		LeftFoot += typesof(/obj/Items/Armour/LeftFoot/)
		for(var/O in LeftFoot)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.EquipState] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		var/RightFoot = list()
		RightFoot += typesof(/obj/Items/Armour/RightFoot/)
		for(var/O in RightFoot)
			var/obj/I = new O()
			if(I.CanBeCrafted && I.BaseMaterial == "Metal")
				var/Make = 3
				var/Mat = "Iron"
				while(Make)
					Make -= 1
					if(Make == 0)
						Mat = "Copper"
					if(Make == 1)
						Mat = "Gold"
					var/obj/A = new I.type()
					A.Material = I.Material
					A.CarryState = "[Mat] [I.icon_state]"
					A.EquipState = "[Mat] [I.EquipState] equip"
					A.icon_state = A.CarryState
					A.layer = 100
					A.Material = Mat
					src.CreateList += A

			else
				del(I)
		src << "<font color = teal>You have been granted the Rank of Black Smith, you will have the knowledge to craft any and all Designs for Armour and Weapons. You are currently in the service of your Kingdoms King and/or Queen but you may Role Play in any direction, so long as it makes sense. No one knows you are a Black Smith currently, except for the King and/or Queen of your Kingdom. You have also been granted a bonus to your blacksmithing skills and +5 to your strength. You also have +100 carrying Weight.<br>"