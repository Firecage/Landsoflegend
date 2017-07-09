/obj/MouseEntered()
	if(src in usr)
		if(src.suffix)
			if(usr.InvenUp)
				usr.MouseLocationX = src.Xloc
				usr.MouseLocationY = src.Yloc
				usr.Box()

/obj/MouseExited()
	usr.MouseLocationX = null
	usr.MouseLocationY = null
	usr.Delete("ScrollMiddle","BoxDelete")

/obj/proc/DemonicSwordMagic()
	var/mob/L = null
	if(ismob(src.loc))
		L = src.loc
	if(src.suffix == "Equip")
		var/WillSpeak = prob(10)
		if(WillSpeak)
			var/Speaks = rand(1,10)
			if(Speaks == 1)
				Speaks = "Kill everything..."
			if(Speaks == 2)
				Speaks = "Release me..."
			if(Speaks == 3)
				Speaks = "Feed the swords hunger..."
			if(Speaks == 4)
				Speaks = "Give in to your emotions..."
			if(Speaks == 5)
				Speaks = "Allow me to enter your world through you..."
			if(Speaks == 6)
				Speaks = "I can make you powerful..."
			if(Speaks == 7)
				Speaks = "Can you feel the power?!..."
			if(Speaks == 8)
				Speaks = "Embrace the darkness..."
			if(Speaks == 9)
				Speaks = "Ha...ha...ha..."
			if(Speaks == 10)
				Speaks = "Crush...Kill...Destroy ..."
			for(var/mob/M in src)
				if(L)
					M.loc = L.loc
					M.Speak(Speaks,0)
					M.loc = src
		if(L)
			for(var/mob/M in orange(1,L))
				if(M.client)
					var/Attack = prob(25)
					if(Attack)
						view(6,L) << "<font color = yellow>[src] flares furiously as [L]'s eyes seem to glaze over. [L] attempts to strike out towards [M], having been temporarily possessed by the strange Blade.<br>"
						L.Target = M
			var/BreakOut = prob(1 - L.Strength / 100 - L.Intelligence / 100)
			if(src.Dura <= 1)
				BreakOut = 1
			if(BreakOut)
				view(6,L) << "<font color = purple>[src] begins to ignite furiously with Demonic Flame. Having used [L]'s blood energy, the Demon within the Blade breaks loose!<br>"
				for(var/mob/M in src)
					M.loc = L.loc
					M.CancelDefaultProc = 0
					M.NormalAI()
					M.Target = L
				L.Weight -= src.Weight
				L.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
				L.DeleteInventoryMenu()
				if(L.InvenUp)
					L.InvenUp = 0
				del(src)
				return
	else
		var/WillSpeak = prob(10)
		if(WillSpeak)
			var/Speaks = rand(1,5)
			if(Speaks == 1)
				Speaks = "Use the sword..."
			if(Speaks == 2)
				Speaks = "Only through using the sword will you become mighty..."
			if(Speaks == 3)
				Speaks = "The sword will make you powerful..."
			if(Speaks == 4)
				Speaks = "You must use the sword, it is the only way to save your world..."
			if(Speaks == 5)
				Speaks = "Only in using the sword can you hope to save everything you love..."
			for(var/mob/M in src)
				if(L)
					M.loc = L.loc
					M.Speak(Speaks,0)
					M.loc = src
	spawn(100)
		if(src)
			src.DemonicSwordMagic()

/obj/proc/CoinAdjust()
	if(src.Type >= 5)
		src.icon_state = "gold coin >5"
	if(src.Type >= 10)
		src.icon_state = "gold coin >10"
	if(src.Type >= 50)
		src.icon_state = "gold coin >50"
	if(src.Type >= 100)
		src.icon_state = "gold coin >100"

/obj/proc/CreateLeather()
	spawn(rand(1000,3000))
		if(src)
			if(src.icon_state != "Dry Leather Hide")
				src.icon_state = "Dry Leather Hide"
				src.name = "Dry [src.name]"
				src.Type = "Dry"

/obj/proc/AddBodyWounds(var/mob/m)
	src.WoundLeftArm = m.WoundLeftArm
	src.WoundRightArm = m.WoundRightArm
	src.WoundLeftLeg = m.WoundLeftLeg
	src.WoundRightLeg = m.WoundRightLeg
	src.WoundHead = m.WoundHead
	src.WoundTorso = m.WoundTorso
	if(src.WoundLeftLeg)
		var/obj/W = src.WoundLeftLeg
		var/icon/I = new(W.icon)
		I.Turn(90)
		W.icon = I
		src.overlays += W
	if(src.WoundRightLeg)
		var/obj/W = src.WoundRightLeg
		var/icon/I = new(W.icon)
		I.Turn(90)
		W.icon = I
		src.overlays += W
	if(src.WoundLeftArm)
		var/obj/W = src.WoundLeftArm
		var/icon/I = new(W.icon)
		I.Turn(90)
		W.icon = I
		src.overlays += W
	if(src.WoundRightArm)
		var/obj/W = src.WoundRightArm
		var/icon/I = new(W.icon)
		I.Turn(90)
		W.icon = I
		src.overlays += W
	if(src.WoundTorso)
		var/obj/W = src.WoundTorso
		var/icon/I = new(W.icon)
		I.Turn(90)
		W.icon = I
		src.overlays += W
	if(src.WoundHead)
		var/obj/W = src.WoundHead
		var/icon/I = new(W.icon)
		I.Turn(90)
		W.icon = I
		src.overlays += W

/obj/proc/BodyKeyCheck()
	for(var/mob/M in range(1,src))
		if(M.Dead == 0 && M.client && M.key == src.BodysKey)
			var/Kick = 0
			if(M.Function == "PickUp")
				Kick = 1
			if(M.Function == "Pull")
				Kick = 1
			if(Kick)
				M.loc = M.LastLoc
				world << "<font color = teal><b>[M] was kicked for interacting with their previous body!<br>"
				del(M)
	spawn(1) src.BodyKeyCheck()

/obj/proc/RandomItem()
	var/MadeItem = 1
	if(src.Type == "RandomResource")
		var/R = rand(1,3)
		var/Num = rand(15,33)
		if(R == 1)
			while(Num)
				Num -= 1
				var/obj/Items/Resources/Plank/P = new
				P.loc = src.loc
		if(R == 2)
			while(Num)
				Num -= 1
				var/obj/Items/Resources/LargeBrick/B = new
				B.loc = src.loc
		if(R == 3)
			var/Mat = rand(1,4)
			if(Mat == 1)
				Mat = "Iron"
			if(Mat == 2)
				Mat = "Copper"
			if(Mat == 3)
				Mat = "Gold"
			if(Mat == 4)
				Mat = "Silver"
			while(Num)
				Num -= 1
				var/obj/Items/Resources/Ingot/I = new
				I.Material = Mat
				I.icon_state = "[I.Material] ingot"
				I.name = "[I.Material] ingot"
				I.Weight = 10
				I.CraftPotential = rand(1,100)
				I.loc = src.loc
	if(src.Type == "RandomBone")
		var/obj/Items/Armour/UpperBody/BoneChestPlate/U = new
		U.icon_state = U.CarryState
		U.pixel_y = 12
		U.loc = src.loc
		U.Defence += rand(3,10)
		var/obj/Items/Armour/Shoulders/SkullPauldrons/PS = new
		PS.icon_state = PS.CarryState
		PS.pixel_y = 12
		PS.loc = src.loc
		PS.Defence += rand(3,10)
		var/obj/Items/Armour/Head/SkullHelmet/H = new
		H.icon_state = H.CarryState
		H.pixel_y = 12
		H.loc = src.loc
		H.Defence += rand(3,10)
		var/obj/Items/Armour/LeftArm/BoneLeftGauntlet/PGL = new
		PGL.icon_state = PGL.CarryState
		PGL.pixel_y = 12
		PGL.loc = src.loc
		PGL.Defence += rand(3,10)
		var/obj/Items/Armour/RightArm/BoneRightGauntlet/PGR = new
		PGR.icon_state = PGR.CarryState
		PGR.pixel_y = 12
		PGR.loc = src.loc
		PGR.Defence += rand(3,10)
		var/obj/Items/Armour/LeftFoot/BoneBootLeft/PBL = new
		PBL.icon_state = PBL.CarryState
		PBL.pixel_y = 12
		PBL.loc = src.loc
		PBL.Defence += rand(3,10)
		var/obj/Items/Armour/RightFoot/BoneBootRight/PBR = new
		PBR.icon_state = PBR.CarryState
		PBR.pixel_y = 12
		PBR.loc = src.loc
		PBR.Defence += rand(3,10)
	if(src.Type == "RandomPlateStahlite")
		var/Mat = rand(1,3)
		if(Mat == 1)
			Mat = "Iron"
		if(Mat == 2)
			Mat = "Copper"
		if(Mat == 3)
			Mat = "Gold"
		var/obj/Items/Armour/Chest/SmallChainShirt/C = new
		C.Material = Mat
		C.RandomItemQuality()
		C.name = "[C.Material] [C]"
		C.icon_state = C.CarryState
		C.pixel_y = 12
		C.loc = src.loc
		if(Mat == "Iron")
			C.Defence += rand(3,5)
		if(Mat == "Copper")
			C.Defence += rand(2,4)
		if(Mat == "Gold")
			C.Defence += rand(1,2)
		var/obj/Items/Armour/UpperBody/SmallChestPlate/U = new
		U.Material = Mat
		U.RandomItemQuality()
		U.name = "[U.Material] [U]"
		U.icon_state = U.CarryState
		U.pixel_y = 12
		U.loc = src.loc
		if(Mat == "Iron")
			U.Defence += rand(3,5)
		if(Mat == "Copper")
			U.Defence += rand(2,4)
		if(Mat == "Gold")
			U.Defence += rand(1,2)
		var/obj/Items/Armour/Shoulders/SmallPlatePauldrons/PS = new
		PS.Material = Mat
		PS.RandomItemQuality()
		PS.name = "[PS.Material] [PS]"
		PS.icon_state = PS.CarryState
		PS.pixel_y = 12
		PS.loc = src.loc
		if(Mat == "Iron")
			PS.Defence += rand(3,5)
		if(Mat == "Copper")
			PS.Defence += rand(2,4)
		if(Mat == "Gold")
			PS.Defence += rand(1,2)
		var/obj/Items/Armour/Head/SmallDwarvenHelmet/H = new
		var/HelmNum = rand(1,3)
		H.icon_state = "small stahlite helm[HelmNum]"
		H.EquipState = "small stahlite helm[HelmNum]"
		H.CarryState = "small stahlite helm[HelmNum]"
		H.Material = Mat
		H.RandomItemQuality()
		H.name = "[H.Material] [H]"
		H.icon_state = H.CarryState
		H.pixel_y = 12
		H.loc = src.loc
		if(Mat == "Iron")
			H.Defence += rand(3,5)
		if(Mat == "Copper")
			H.Defence += rand(2,4)
		if(Mat == "Gold")
			H.Defence += rand(1,2)
		var/obj/Items/Armour/LeftArm/SmallPlateGauntletLeft/PGL = new
		PGL.Material = Mat
		PGL.RandomItemQuality()
		PGL.name = "[PGL.Material] [PGL]"
		PGL.icon_state = PGL.CarryState
		PGL.pixel_y = 12
		PGL.loc = src.loc
		if(Mat == "Iron")
			PGL.Defence += rand(3,5)
		if(Mat == "Copper")
			PGL.Defence += rand(2,4)
		if(Mat == "Gold")
			PGL.Defence += rand(1,2)
		var/obj/Items/Armour/RightArm/SmallPlateGauntletRight/PGR = new
		PGR.Material = Mat
		PGR.RandomItemQuality()
		PGR.name = "[PGR.Material] [PGR]"
		PGR.icon_state = PGR.CarryState
		PGR.pixel_y = 12
		PGR.loc = src.loc
		if(Mat == "Iron")
			PGR.Defence += rand(3,5)
		if(Mat == "Copper")
			PGR.Defence += rand(2,4)
		if(Mat == "Gold")
			PGR.Defence += rand(1,2)
		var/obj/Items/Armour/Legs/SmallChainLeggings/CL = new
		CL.Material = Mat
		CL.RandomItemQuality()
		CL.name = "[CL.Material] [CL]"
		CL.icon_state = CL.CarryState
		CL.pixel_y = 12
		CL.loc = src.loc
		if(Mat == "Iron")
			CL.Defence += rand(3,5)
		if(Mat == "Copper")
			CL.Defence += rand(2,4)
		if(Mat == "Gold")
			CL.Defence += rand(1,2)
		var/obj/Items/Armour/Shields/Shield/S = new
		S.Material = Mat
		S.RandomItemQuality()
		S.name = "[S.Material] [S]"
		S.icon_state = S.CarryState
		S.pixel_y = 12
		S.loc = src.loc
		if(Mat == "Iron")
			S.Defence += rand(3,5)
		if(Mat == "Copper")
			S.Defence += rand(2,4)
		if(Mat == "Gold")
			S.Defence += rand(1,2)
		var/obj/Items/Armour/LeftFoot/SmallPlateBootLeft/PBL = new
		PBL.Material = Mat
		PBL.RandomItemQuality()
		PBL.name = "[PBL.Material] [PBL]"
		PBL.icon_state = PBL.CarryState
		PBL.pixel_y = 12
		PBL.loc = src.loc
		if(Mat == "Iron")
			PBL.Defence += rand(3,5)
		if(Mat == "Copper")
			PBL.Defence += rand(2,4)
		if(Mat == "Gold")
			PBL.Defence += rand(1,2)

		var/obj/Items/Armour/RightFoot/SmallPlateBootRight/PBR = new
		PBR.Material = Mat
		PBR.RandomItemQuality()
		PBR.name = "[PBR.Material] [PBR]"
		PBR.icon_state = PBR.CarryState
		PBR.pixel_y = 12
		PBR.loc = src.loc
		if(Mat == "Iron")
			PBR.Defence += rand(3,5)
		if(Mat == "Copper")
			PBR.Defence += rand(2,4)
		if(Mat == "Gold")
			PBR.Defence += rand(1,2)
	if(src.Type == "RandomPlate")
		var/Mat = rand(1,3)
		if(Mat == 1)
			Mat = "Iron"
		if(Mat == 2)
			Mat = "Copper"
		if(Mat == 3)
			Mat = "Gold"
		var/obj/Items/Armour/Chest/ChainShirt/C = new
		C.Material = Mat
		C.RandomItemQuality()
		C.name = "[C.Material] [C]"
		C.icon_state = C.CarryState
		C.pixel_y = 12
		C.loc = src.loc
		if(Mat == "Iron")
			C.Defence += rand(3,5)
		if(Mat == "Copper")
			C.Defence += rand(2,4)
		if(Mat == "Gold")
			C.Defence += rand(1,2)
		var/obj/Items/Armour/UpperBody/ChestPlate/U = new
		U.Material = Mat
		U.RandomItemQuality()
		U.name = "[U.Material] [U]"
		U.icon_state = U.CarryState
		U.pixel_y = 12
		U.loc = src.loc
		if(Mat == "Iron")
			U.Defence += rand(3,5)
		if(Mat == "Copper")
			U.Defence += rand(2,4)
		if(Mat == "Gold")
			U.Defence += rand(1,2)
		var/obj/Items/Armour/Shoulders/PlatePauldrons/PS = new
		PS.Material = Mat
		PS.RandomItemQuality()
		PS.name = "[PS.Material] [PS]"
		PS.icon_state = PS.CarryState
		PS.pixel_y = 12
		PS.loc = src.loc
		if(Mat == "Iron")
			PS.Defence += rand(3,5)
		if(Mat == "Copper")
			PS.Defence += rand(2,4)
		if(Mat == "Gold")
			PS.Defence += rand(1,2)
		var/obj/Items/Armour/Head/PlateHelmet/H = new
		var/HelmNum = rand(1,5)
		H.icon_state = "plate helm[HelmNum]"
		H.EquipState = "plate helm[HelmNum]"
		H.CarryState = "plate helm[HelmNum]"
		H.Material = Mat
		H.RandomItemQuality()
		H.name = "[H.Material] [H]"
		H.icon_state = H.CarryState
		H.pixel_y = 12
		H.loc = src.loc
		if(Mat == "Iron")
			H.Defence += rand(3,5)
		if(Mat == "Copper")
			H.Defence += rand(2,4)
		if(Mat == "Gold")
			H.Defence += rand(1,2)
		var/obj/Items/Armour/LeftArm/PlateGauntletLeft/PGL = new
		PGL.Material = Mat
		PGL.RandomItemQuality()
		PGL.name = "[PGL.Material] [PGL]"
		PGL.icon_state = PGL.CarryState
		PGL.pixel_y = 12
		PGL.loc = src.loc
		if(Mat == "Iron")
			PGL.Defence += rand(3,5)
		if(Mat == "Copper")
			PGL.Defence += rand(2,4)
		if(Mat == "Gold")
			PGL.Defence += rand(1,2)
		var/obj/Items/Armour/RightArm/PlateGauntletRight/PGR = new
		PGR.Material = Mat
		PGR.RandomItemQuality()
		PGR.name = "[PGR.Material] [PGR]"
		PGR.icon_state = PGR.CarryState
		PGR.pixel_y = 12
		PGR.loc = src.loc
		if(Mat == "Iron")
			PGR.Defence += rand(3,5)
		if(Mat == "Copper")
			PGR.Defence += rand(2,4)
		if(Mat == "Gold")
			PGR.Defence += rand(1,2)
		var/obj/Items/Armour/Legs/ChainLeggings/CL = new
		CL.Material = Mat
		CL.RandomItemQuality()
		CL.name = "[CL.Material] [CL]"
		CL.icon_state = CL.CarryState
		CL.pixel_y = 12
		CL.loc = src.loc
		if(Mat == "Iron")
			CL.Defence += rand(3,5)
		if(Mat == "Copper")
			CL.Defence += rand(2,4)
		if(Mat == "Gold")
			CL.Defence += rand(1,2)
		var/obj/Items/Armour/Shields/Shield/S = new
		S.Material = Mat
		S.RandomItemQuality()
		S.name = "[S.Material] [S]"
		S.icon_state = S.CarryState
		S.pixel_y = 12
		S.loc = src.loc
		if(Mat == "Iron")
			S.Defence += rand(3,5)
		if(Mat == "Copper")
			S.Defence += rand(2,4)
		if(Mat == "Gold")
			S.Defence += rand(1,2)
		var/obj/Items/Armour/LeftFoot/PlateBootLeft/PBL = new
		PBL.Material = Mat
		PBL.RandomItemQuality()
		PBL.name = "[PBL.Material] [PBL]"
		PBL.icon_state = PBL.CarryState
		PBL.pixel_y = 12
		PBL.loc = src.loc
		if(Mat == "Iron")
			PBL.Defence += rand(3,5)
		if(Mat == "Copper")
			PBL.Defence += rand(2,4)
		if(Mat == "Gold")
			PBL.Defence += rand(1,2)

		var/obj/Items/Armour/RightFoot/PlateBootRight/PBR = new
		PBR.Material = Mat
		PBR.RandomItemQuality()
		PBR.name = "[PBR.Material] [PBR]"
		PBR.icon_state = PBR.CarryState
		PBR.pixel_y = 12
		PBR.loc = src.loc
		if(Mat == "Iron")
			PBR.Defence += rand(3,5)
		if(Mat == "Copper")
			PBR.Defence += rand(2,4)
		if(Mat == "Gold")
			PBR.Defence += rand(1,2)
	if(src.Type == "RandomWeapon")
		MadeItem = 0
		var/ItemType = 0
		ItemType = rand(1,6)
		if(ItemType == 1)
			var/Swords = list()
			Swords += typesof(/obj/Items/Weapons/Swords/)
			for(var/O in Swords)
				var/obj/I = new O()
				if(I.CanBeCrafted)
					var/Choose = prob(25)
					if(Choose)
						var/obj/A = new I.type()
						var/Make = rand(1,3)
						var/Mat = null
						if(Make == 1)
							Mat = "Iron"
							A.Quality += rand(4,7)
						if(Make == 2)
							Mat = "Copper"
							A.Quality += rand(3,5)
						if(Make == 3)
							Mat = "Silver"
							A.Quality += rand(3,5)
						A.Material = Mat
						A.RandomItemQuality()
						A.name = "[A.Material] [A]"
						A.icon_state = A.CarryState
						A.pixel_y = 12
						A.loc = src.loc
						A.CanBeCrafted = 0
						MadeItem = 1
						break
					else
						del(I)
				else
					del(I)
		if(ItemType == 2)
			var/Axes = list()
			Axes += typesof(/obj/Items/Weapons/Axes/)
			for(var/O in Axes)
				var/obj/I = new O()
				if(I.CanBeCrafted)
					var/Choose = prob(33)
					if(Choose)
						var/obj/A = new I.type()
						var/Make = rand(1,3)
						var/Mat = null
						if(Make == 1)
							Mat = "Iron"
							A.Quality += rand(4,7)
						if(Make == 2)
							Mat = "Copper"
							A.Quality += rand(3,5)
						if(Make == 3)
							Mat = "Silver"
							A.Quality += rand(3,5)
						A.Material = Mat
						A.RandomItemQuality()
						A.name = "[A.Material] [A]"
						A.icon_state = A.CarryState
						A.pixel_y = 12
						A.loc = src.loc
						A.CanBeCrafted = 0
						MadeItem = 1
						break
					else
						del(I)
				else
					del(I)
		if(ItemType == 3)
			var/Blunts = list()
			Blunts += typesof(/obj/Items/Weapons/Blunts/)
			for(var/O in Blunts)
				var/obj/I = new O()
				if(I.CanBeCrafted)
					var/Choose = prob(25)
					if(Choose)
						var/obj/A = new I.type()
						var/Make = rand(1,3)
						var/Mat = null
						if(Make == 1)
							Mat = "Iron"
							A.Quality += rand(4,7)
						if(Make == 2)
							Mat = "Copper"
							A.Quality += rand(3,5)
						if(Make == 3)
							Mat = "Silver"
							A.Quality += rand(3,5)
						A.Material = Mat
						A.RandomItemQuality()
						A.name = "[A.Material] [A]"
						A.icon_state = A.CarryState
						A.pixel_y = 12
						A.loc = src.loc
						A.CanBeCrafted = 0
						MadeItem = 1
						break
					else
						del(I)
				else
					del(I)
		if(ItemType == 4)
			var/Spears = list()
			Spears += typesof(/obj/Items/Weapons/Spears/)
			for(var/O in Spears)
				var/obj/I = new O()
				if(I.CanBeCrafted)
					var/Choose = prob(100)
					if(Choose)
						var/obj/A = new I.type()
						var/Make = rand(1,3)
						var/Mat = null
						if(Make == 1)
							Mat = "Iron"
							A.Quality += rand(4,7)
						if(Make == 2)
							Mat = "Copper"
							A.Quality += rand(3,5)
						if(Make == 3)
							Mat = "Silver"
							A.Quality += rand(3,5)
						A.Material = Mat
						A.RandomItemQuality()
						A.name = "[A.Material] [A]"
						A.icon_state = A.CarryState
						A.pixel_y = 12
						A.loc = src.loc
						A.CanBeCrafted = 0
						MadeItem = 1
						break
					else
						del(I)
				else
					del(I)
		if(ItemType == 5)
			var/Daggers = list()
			Daggers += typesof(/obj/Items/Weapons/Daggers/)
			for(var/O in Daggers)
				var/obj/I = new O()
				if(I.CanBeCrafted)
					var/Choose = prob(50)
					if(Choose)
						var/obj/A = new I.type()
						var/Make = rand(1,3)
						var/Mat = null
						if(Make == 1)
							Mat = "Iron"
							A.Quality += rand(4,7)
						if(Make == 2)
							Mat = "Copper"
							A.Quality += rand(3,5)
						if(Make == 3)
							Mat = "Silver"
							A.Quality += rand(3,5)
						A.Material = Mat
						A.RandomItemQuality()
						A.name = "[A.Material] [A]"
						A.icon_state = A.CarryState
						A.pixel_y = 12
						A.loc = src.loc
						A.CanBeCrafted = 0
						MadeItem = 1
						break
					else
						del(I)
				else
					del(I)
		if(ItemType == 6)
			var/Bows = list()
			Bows += typesof(/obj/Items/Weapons/Ranged/)
			for(var/O in Bows)
				var/obj/I = new O()
				if(I.CanBeCrafted)
					var/Choose = prob(50)
					if(Choose)
						var/obj/A = new I.type()
						var/Make = rand(1,3)
						var/Mat = null
						if(Make == 1)
							Mat = "Iron"
							A.Quality += rand(4,7)
						if(Make == 2)
							Mat = "Copper"
							A.Quality += rand(3,5)
						if(Make == 3)
							Mat = "Silver"
							A.Quality += rand(3,5)
						A.Material = Mat
						A.RandomItemQuality()
						A.name = "[A.Material] [A]"
						A.icon_state = A.CarryState
						A.pixel_y = 12
						A.loc = src.loc
						A.CanBeCrafted = 0
						MadeItem = 1
						break
					else
						del(I)
				else
					del(I)
	if(MadeItem == 0)
		src.RandomItem()
	else
		del(src)
	return

/obj/proc/TreasureChest()
	if(src.Type == "HasTreasure")
		var/obj/Items/Currency/GoldCoin/G = new
		G.loc = src
		G.suffix = "Carried"
		G.Type = rand(1,20)
		G.name = "[G.Type] Gold Coins"
		G.CoinAdjust()
		G.overlays+=image(/obj/HUD/C/)
		var/Items = rand(0,3)
		while(Items)
			Items -= 1
			var/ItemType = rand(1,2)
			if(ItemType == 1)
				ItemType = 0
				ItemType = rand(1,10)
				if(ItemType == 1)
					var/Chest = list()
					Chest += typesof(/obj/Items/Armour/Chest/)
					for(var/O in Chest)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Metal = 0
							if(I.BaseMaterial == "Metal")
								Metal = 1
							if(Metal)
								var/Choose = prob(50)
								if(Choose)
									var/Make = rand(1,3)
									var/Mat = null
									if(Make == 1)
										Mat = "Iron"
									if(Make == 2)
										Mat = "Copper"
									if(Make == 3)
										Mat = "Gold"
									var/obj/A = new I.type()
									A.suffix = "Carried"
									A.layer = 100
									A.Material = Mat
									A.RandomItemQuality()
									A.name = "[A.Material] [A]"
									A.icon_state = A.CarryState
									A.overlays += image(/obj/HUD/C/)
									A.loc = src
									break
								else
									del(I)
							else
								del(I)
				if(ItemType == 2)
					var/LeftArm = list()
					LeftArm += typesof(/obj/Items/Armour/LeftArm/)
					for(var/O in LeftArm)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Metal = 0
							if(I.BaseMaterial == "Metal")
								Metal = 1
							if(Metal)
								var/Choose = prob(50)
								if(Choose)
									var/Make = rand(1,3)
									var/Mat = null
									if(Make == 1)
										Mat = "Iron"
									if(Make == 2)
										Mat = "Copper"
									if(Make == 3)
										Mat = "Gold"
									var/obj/A = new I.type()
									A.suffix = "Carried"
									A.layer = 100
									A.Material = Mat
									A.RandomItemQuality()
									A.name = "[A.Material] [A]"
									A.icon_state = A.CarryState
									A.overlays += image(/obj/HUD/C/)
									A.loc = src
									break
								else
									del(I)
							else
								del(I)
				if(ItemType == 3)
					var/RightArm = list()
					RightArm += typesof(/obj/Items/Armour/RightArm/)
					for(var/O in RightArm)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Metal = 0
							if(I.BaseMaterial == "Metal")
								Metal = 1
							if(Metal)
								var/Choose = prob(50)
								if(Choose)
									var/Make = rand(1,3)
									var/Mat = null
									if(Make == 1)
										Mat = "Iron"
									if(Make == 2)
										Mat = "Copper"
									if(Make == 3)
										Mat = "Gold"
									var/obj/A = new I.type()
									A.suffix = "Carried"
									A.layer = 100
									A.Material = Mat
									A.RandomItemQuality()
									A.name = "[A.Material] [A]"
									A.icon_state = A.CarryState
									A.overlays += image(/obj/HUD/C/)
									A.loc = src
									break
								else
									del(I)
							else
								del(I)
				if(ItemType == 4)
					var/LeftFoot = list()
					LeftFoot += typesof(/obj/Items/Armour/LeftFoot/)
					for(var/O in LeftFoot)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Metal = 0
							if(I.BaseMaterial == "Metal")
								Metal = 1
							if(Metal)
								var/Choose = prob(50)
								if(Choose)
									var/Make = rand(1,3)
									var/Mat = null
									if(Make == 1)
										Mat = "Iron"
									if(Make == 2)
										Mat = "Copper"
									if(Make == 3)
										Mat = "Gold"
									var/obj/A = new I.type()
									A.suffix = "Carried"
									A.layer = 100
									A.Material = Mat
									A.RandomItemQuality()
									A.name = "[A.Material] [A]"
									A.icon_state = A.CarryState
									A.overlays += image(/obj/HUD/C/)
									A.loc = src
									break
								else
									del(I)
							else
								del(I)
				if(ItemType == 5)
					var/RightFoot = list()
					RightFoot += typesof(/obj/Items/Armour/RightFoot/)
					for(var/O in RightFoot)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Metal = 0
							if(I.BaseMaterial == "Metal")
								Metal = 1
							if(Metal)
								var/Choose = prob(50)
								if(Choose)
									var/Make = rand(1,3)
									var/Mat = null
									if(Make == 1)
										Mat = "Iron"
									if(Make == 2)
										Mat = "Copper"
									if(Make == 3)
										Mat = "Gold"
									var/obj/A = new I.type()
									A.suffix = "Carried"
									A.layer = 100
									A.Material = Mat
									A.RandomItemQuality()
									A.name = "[A.Material] [A]"
									A.icon_state = A.CarryState
									A.overlays += image(/obj/HUD/C/)
									A.loc = src
									break
								else
									del(I)
							else
								del(I)
				if(ItemType == 6)
					var/Legs = list()
					Legs += typesof(/obj/Items/Armour/Legs/)
					for(var/O in Legs)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Metal = 0
							if(I.BaseMaterial == "Metal")
								Metal = 1
							if(Metal)
								var/Choose = prob(50)
								if(Choose)
									var/Make = rand(1,3)
									var/Mat = null
									if(Make == 1)
										Mat = "Iron"
									if(Make == 2)
										Mat = "Copper"
									if(Make == 3)
										Mat = "Gold"
									var/obj/A = new I.type()
									A.suffix = "Carried"
									A.layer = 100
									A.Material = Mat
									A.RandomItemQuality()
									A.name = "[A.Material] [A]"
									A.icon_state = A.CarryState
									A.overlays += image(/obj/HUD/C/)
									A.loc = src
									break
								else
									del(I)
							else
								del(I)
				if(ItemType == 7)
					var/Shields = list()
					Shields += typesof(/obj/Items/Armour/Shields/)
					for(var/O in Shields)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Metal = 0
							if(I.BaseMaterial == "Metal")
								Metal = 1
							if(Metal)
								var/Choose = prob(100)
								if(Choose)
									var/Make = rand(1,2)
									var/Mat = null
									if(Make == 1)
										Mat = "Iron"
									if(Make == 2)
										Mat = "Copper"
									var/obj/A = new I.type()
									A.suffix = "Carried"
									A.layer = 100
									A.Material = Mat
									A.RandomItemQuality()
									A.name = "[A.Material] [A]"
									A.icon_state = A.CarryState
									A.overlays += image(/obj/HUD/C/)
									A.loc = src
									break
								else
									del(I)
							else
								del(I)
			if(ItemType == 2)
				ItemType = 0
				ItemType = rand(1,5)
				if(ItemType == 1)
					var/Swords = list()
					Swords += typesof(/obj/Items/Weapons/Swords/)
					for(var/O in Swords)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Choose = prob(25)
							if(Choose)
								var/Make = rand(1,3)
								var/Mat = null
								if(Make == 1)
									Mat = "Iron"
								if(Make == 2)
									Mat = "Copper"
								if(Make == 3)
									Mat = "Silver"
								var/obj/A = new I.type()
								A.suffix = "Carried"
								A.layer = 100
								A.Material = Mat
								A.RandomItemQuality()
								A.name = "[A.Material] [A]"
								A.icon_state = A.CarryState
								A.overlays += image(/obj/HUD/C/)
								A.loc = src
								break
							else
								del(I)
				if(ItemType == 2)
					var/Axes = list()
					Axes += typesof(/obj/Items/Weapons/Axes/)
					for(var/O in Axes)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Choose = prob(50)
							if(Choose)
								var/Make = rand(1,3)
								var/Mat = null
								if(Make == 1)
									Mat = "Iron"
								if(Make == 2)
									Mat = "Copper"
								if(Make == 3)
									Mat = "Silver"
								var/obj/A = new I.type()
								A.suffix = "Carried"
								A.layer = 100
								A.Material = Mat
								A.RandomItemQuality()
								A.name = "[A.Material] [A]"
								A.icon_state = A.CarryState
								A.overlays += image(/obj/HUD/C/)
								A.loc = src
								break
							else
								del(I)
				if(ItemType == 3)
					var/Blunts = list()
					Blunts += typesof(/obj/Items/Weapons/Blunts/)
					for(var/O in Blunts)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Choose = prob(25)
							if(Choose)
								var/Make = rand(1,3)
								var/Mat = null
								if(Make == 1)
									Mat = "Iron"
								if(Make == 2)
									Mat = "Copper"
								if(Make == 3)
									Mat = "Silver"
								var/obj/A = new I.type()
								A.suffix = "Carried"
								A.layer = 100
								A.Material = Mat
								A.RandomItemQuality()
								A.name = "[A.Material] [A]"
								A.icon_state = A.CarryState
								A.overlays += image(/obj/HUD/C/)
								A.loc = src
								break
							else
								del(I)
				if(ItemType == 4)
					var/Spears = list()
					Spears += typesof(/obj/Items/Weapons/Spears/)
					for(var/O in Spears)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Choose = prob(100)
							if(Choose)
								var/Make = rand(1,3)
								var/Mat = null
								if(Make == 1)
									Mat = "Iron"
								if(Make == 2)
									Mat = "Copper"
								if(Make == 3)
									Mat = "Silver"
								var/obj/A = new I.type()
								A.suffix = "Carried"
								A.layer = 100
								A.Material = Mat
								A.RandomItemQuality()
								A.name = "[A.Material] [A]"
								A.icon_state = A.CarryState
								A.overlays += image(/obj/HUD/C/)
								A.loc = src
								break
							else
								del(I)
				if(ItemType == 5)
					var/Daggers = list()
					Daggers += typesof(/obj/Items/Weapons/Daggers/)
					for(var/O in Daggers)
						var/obj/I = new O()
						if(I.CanBeCrafted)
							var/Choose = prob(50)
							if(Choose)
								var/Make = rand(1,3)
								var/Mat = null
								if(Make == 1)
									Mat = "Iron"
								if(Make == 2)
									Mat = "Copper"
								if(Make == 3)
									Mat = "Silver"
								var/obj/A = new I.type()
								A.suffix = "Carried"
								A.layer = 100
								A.Material = Mat
								A.RandomItemQuality()
								A.name = "[A.Material] [A]"
								A.icon_state = A.CarryState
								A.overlays += image(/obj/HUD/C/)
								A.loc = src
								break
							else
								del(I)

/obj/proc/Cook(var/Loc,var/obj/Fire,var/mob/DroppedBy,var/Cooked,var/WillBurn,)
	if(src.icon == 'Skeleton.dmi')
		return
	spawn(rand(100,300))
		if(Fire && src)
			if(Fire in range(1,src))
				if(src && src.suffix == null && src.loc == Loc && Fire.OnFire)
					if(WillBurn)
						view(2,src.loc) << "<font color = yellow>The [src] burns to ash!<br>"
						var/obj/Items/Resources/Ash/A = new
						A.loc = src.loc
						del(src)
						return
					if(src.CookingFood != 2)
						if(Cooked == 2)
							view(2,src.loc) << "<font color = yellow>The [src] seems to be done cooking!<br>"
							src.CookingFood = 2
							if(src.icon != 'food.dmi')
								src.icon = 'food.dmi'
							if(src.tag == "Limb")
								src.CookedState = "cooked meat2"
							src.icon_state = src.CookedState
							if(DroppedBy)
								if(DroppedBy in view(4,src))
									DroppedBy.CookingSkill += DroppedBy.CookingSkillMulti
							src.Cook(Loc,Fire,DroppedBy,Cooked,WillBurn)
							return
						else
							view(2,src.loc) << "<font color = yellow>The [src] seems to be cooking nicely!<br>"
							Cooked += 1
							if(DroppedBy)
								if(DroppedBy in view(4,src))
									DroppedBy.CookingSkill += DroppedBy.CookingSkillMulti / 4
									src.Type += DroppedBy.CookingSkill / 4
							src.Cook(Loc,Fire,DroppedBy,Cooked,WillBurn)
							return
					if(Cooked == 3)
						view(2,src.loc) << "<font color = yellow>The [src] seems to be burning!<br>"
						src.Cook(Loc,Fire,DroppedBy,Cooked,1)
						return

/obj/proc/LightProc(var/mob/M)
	if(src && src.Type == "Torch Lit")
		src.Dura -= 0.5
		if(M && src in M)
			M.luminosity = 5
			if(M.InWater)
				M.luminosity = 0
				M.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
				M.overlays-=image(src.icon,"[src.icon_state] left",src.ItemLayer)
				src.Type = "Torch"
				src.CarryState = "torch"
				src.EquipState = "torch equip"
				src.icon_state = src.EquipState
				if(src == M.Weapon)
					M.overlays+=image(src.icon,src.icon_state,src.ItemLayer)
				if(src == M.Weapon2)
					M.overlays+=image(src.icon,"[src.icon_state] left",src.ItemLayer)
		else
			if(M)
				M.luminosity = 0
				src.luminosity = 5
				M = null
		if(src.Dura <= 1)
			view(2,src.loc) << "<font color = yellow>[src] burns out!<br>"
			if(M && src in M)
				M.Weight -= src.Weight
				M.overlays-=image(src.icon,src.icon_state,src.ItemLayer)
				M.overlays-=image(src.icon,"[src.icon_state] left",src.ItemLayer)
				M.luminosity = 1
			del(src)
			return
	else
		if(M)
			M.luminosity = 0
		return
	spawn(10) LightProc(M)
