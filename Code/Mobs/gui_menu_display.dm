/mob/proc/CreateGUI()
	var/obj/HUD/GUI/ScreenOverlay/SO = new
	src.client.screen += SO

	var/obj/HUD/GUI/SW/SW = new
	src.client.screen += SW
	var/obj/HUD/GUI/NW/NW = new
	src.client.screen += NW
	var/obj/HUD/GUI/SE/SE = new
	src.client.screen += SE
	var/obj/HUD/GUI/NE/NE = new
	src.client.screen += NE
	var/obj/HUD/GUI/N/N = new
	src.client.screen += N
	var/obj/HUD/GUI/S/S = new
	src.client.screen += S
	var/obj/HUD/GUI/E/E = new
	src.client.screen += E
	var/obj/HUD/GUI/W/W = new
	src.client.screen += W

	var/obj/HUD/Buttons/Interact/Int = new
	src.client.screen += Int
	var/obj/HUD/Buttons/GameInfo/Help = new
	src.client.screen += Help
	var/obj/HUD/Buttons/PickUp/Pick = new
	src.client.screen += Pick
	var/obj/HUD/Buttons/Examine/Exa = new
	src.client.screen += Exa
	var/obj/HUD/Buttons/Inventory/Inv = new
	src.client.screen += Inv
	var/obj/HUD/Buttons/CombatMode/Com = new
	src.client.screen += Com
	var/obj/HUD/Buttons/Pull/Pul = new
	src.client.screen += Pul
	var/obj/HUD/Buttons/CharacterInfo/Info = new
	src.client.screen += Info
	var/obj/HUD/Buttons/HealthInfo/HInfo = new
	src.client.screen += HInfo
	var/obj/HUD/Buttons/SkillInfo/SInfo = new
	src.client.screen += SInfo
	var/obj/HUD/Buttons/OOC/OOC = new
	src.client.screen += OOC
	var/obj/HUD/Buttons/Say/Say = new
	src.client.screen += Say
	var/obj/HUD/Buttons/Build/B = new
	src.client.screen += B
	var/obj/HUD/Buttons/RolePlay/RP = new
	src.client.screen += RP
	var/obj/HUD/Buttons/LeftHand/Left = new
	src.client.screen += Left
	if(src.CurrentHand == "Left")
		Left.icon_state = "left hand on"
	var/obj/HUD/Buttons/RightHand/Right = new
	src.client.screen += Right
	if(src.CurrentHand == "Right")
		Right.icon_state = "right hand on"

	var/obj/HUD/GUI/BloodBar/BB = new
	src.client.screen += BB

	var/IsAdmin = 0
	for(var/obj/Misc/Admins/Z in Admins)
		if(Z.name == src.key)
			IsAdmin = 1
			src.Admin = Z.Value
	if(IsAdmin == 1)
		var/obj/HUD/AdminButtons/AdminButton/A = new
		src.client.screen += A
	else
		src.Admin = 0
	if(src.Race == "Illithid")
		var/obj/HUD/Buttons/IllithidPowers/IP = new
		src.client.screen += IP
	return

/mob/proc/DeleteInventoryMenu()
	for(var/obj/HUD/Menus/Buildings/O in src.client.screen)
		del(O)
	for(var/obj/HUD/Menus/Inventory/O in src.client.screen)
		del(O)
	for(var/obj/HUD/Text/T in src.client.screen)
		del(T)
	for(var/obj/Items/I in src.client.screen)
		src.client.screen -= I
		I.layer = 4
	return

/mob/proc/CreateAdminMenu()
	var/obj/BG = new/obj/HUD/Menus/Admin/BackGround(src.client)
	var/obj/TM = new/obj/HUD/Menus/Admin/TMiddle(src.client)
	var/obj/T = new/obj/HUD/Menus/Admin/Top(src.client)
	var/obj/TR = new/obj/HUD/Menus/Admin/TR(src.client)
	var/obj/TL = new/obj/HUD/Menus/Admin/TL(src.client)
	var/obj/L = new/obj/HUD/Menus/Admin/Left(src.client)
	var/obj/R = new/obj/HUD/Menus/Admin/Right(src.client)
	var/obj/BR = new/obj/HUD/Menus/Admin/BR(src.client)
	var/obj/BL = new/obj/HUD/Menus/Admin/BL(src.client)
	var/obj/B = new/obj/HUD/Menus/Admin/Bottom(src.client)

	var/obj/Summon = new/obj/HUD/AdminButtons/AdminSummon(src.client)
	var/obj/Teleport = new/obj/HUD/AdminButtons/AdminTeleport(src.client)
	var/obj/Create = new/obj/HUD/AdminButtons/AdminCreate(src.client)
	var/obj/Edit = new/obj/HUD/AdminButtons/AdminEdit(src.client)
	var/obj/Ban = new/obj/HUD/AdminButtons/AdminBan(src.client)
	var/obj/Mute = new/obj/HUD/AdminButtons/AdminMute(src.client)
	var/obj/ChangeDensity = new/obj/HUD/AdminButtons/AdminChangeDensity(src.client)
	var/obj/Invisibility = new/obj/HUD/AdminButtons/AdminInvisibility(src.client)
	var/obj/Reboot = new/obj/HUD/AdminButtons/AdminReboot(src.client)
	var/obj/Prison = new/obj/HUD/AdminButtons/AdminInprison(src.client)
	var/obj/EditStory = new/obj/HUD/AdminButtons/AdminEditStory(src.client)
	var/obj/Reward = new/obj/HUD/AdminButtons/AdminReward(src.client)
	var/obj/Announce = new/obj/HUD/AdminButtons/AdminAnnounce(src.client)
	var/obj/Heal = new/obj/HUD/AdminButtons/AdminHeal(src.client)
	var/obj/ServerOptions = new/obj/HUD/AdminButtons/AdminServerOptions(src.client)
	var/obj/GiveAdmin = new/obj/HUD/AdminButtons/AdminGiveAdmin(src.client)
	BG.screen_loc = "4,4 to 12,12"
	TM.screen_loc = "8,12"
	T.screen_loc = "4,12 to 12,12"
	TL.screen_loc = "4,12"
	TR.screen_loc = "12,12"
	L.screen_loc = "4,4 to 4,12"
	R.screen_loc = "12,12 to 12,4"
	BL.screen_loc = "4,4"
	BR.screen_loc = "12,4"
	B.screen_loc = "4,4 to 12,4"

	Summon.screen_loc = "5,11"
	Teleport.screen_loc = "7,11"
	Create.screen_loc = "9,11"
	Edit.screen_loc = "11,11"
	Ban.screen_loc = "5,9"
	Mute.screen_loc = "7,9"
	ChangeDensity.screen_loc = "9,9"
	if(src.AdminDelete)
		Edit.icon_state = "edit on"
	if(src.AdminEdit)
		Edit.icon_state = "edit on"
	if(src.density == 0)
		ChangeDensity.icon_state = "turn non-dense on"
	if(src.AdminInvis)
		Invisibility.icon_state = "turn invisible on"
	Invisibility.screen_loc = "11,9"
	Reboot.screen_loc = "5,7"
	Prison.screen_loc = "7,7"
	EditStory.screen_loc = "9,7"
	Reward.screen_loc = "11,7"
	Announce.screen_loc = "5,5"
	Heal.screen_loc = "7,5"
	ServerOptions.screen_loc = "9,5"
	GiveAdmin.screen_loc = "11,5"
	src.client.screen += BG
	src.client.screen += TM
	src.client.screen += T
	src.client.screen += TL
	src.client.screen += TR
	src.client.screen += L
	src.client.screen += R
	src.client.screen += BL
	src.client.screen += BR
	src.client.screen += B

	src.client.screen += Summon
	src.client.screen += Teleport
	src.client.screen += Create
	src.client.screen += Edit
	src.client.screen += Ban
	src.client.screen += Mute
	src.client.screen += ChangeDensity
	src.client.screen += Invisibility
	src.client.screen += Reboot
	src.client.screen += Prison
	src.client.screen += EditStory
	src.client.screen += Reward
	src.client.screen += Announce
	src.client.screen += Heal
	src.client.screen += ServerOptions
	src.client.screen += GiveAdmin

/mob/proc/CreateMasonaryMenu(var/obj/Stone)
	src.DeleteInventoryMenu()
	src.InvenUp = 0
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)
	var/obj/Cl = new/obj/HUD/Menus/Inventory/CloseMasonary(src.client)
	H.screen_loc = "2,2 to 12,10"
	O.screen_loc = "2,10"
	A.screen_loc = "12,10"
	B.screen_loc = "2,2"
	C.screen_loc = "12,2"
	D.screen_loc = "2,10 to 12,10"
	E.screen_loc = "2,2 to 12,2"
	F.screen_loc = "2,2 to 2,10"
	G.screen_loc = "12,2 to 12,10"
	Cl.screen_loc = "12,2"
	src.client.screen += H
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Cl
	H.Type = "Masonary"
	O.Type = "Masonary"
	A.Type = "Masonary"
	B.Type = "Masonary"
	C.Type = "Masonary"
	D.Type = "Masonary"
	E.Type = "Masonary"
	F.Type = "Masonary"
	G.Type = "Masonary"
	src.Text("Masonary",src,4,10,0,10,"--Masonary Menu--")
	var/X = 3
	var/Y = 9
	if(Stone)
		for(var/obj/Items/I in src.CreateList)
			if(I.Material == Stone.Material)
				if(X != 11)
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					X += 1
				else
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					Y -= 1
					X = 3

/mob/proc/CreateCarpentryMenu(var/obj/Wood)
	src.DeleteInventoryMenu()
	src.InvenUp = 0
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)
	var/obj/Cl = new/obj/HUD/Menus/Inventory/CloseCarpentry(src.client)
	H.screen_loc = "2,2 to 12,10"
	O.screen_loc = "2,10"
	A.screen_loc = "12,10"
	B.screen_loc = "2,2"
	C.screen_loc = "12,2"
	D.screen_loc = "2,10 to 12,10"
	E.screen_loc = "2,2 to 12,2"
	F.screen_loc = "2,2 to 2,10"
	G.screen_loc = "12,2 to 12,10"
	Cl.screen_loc = "12,2"
	src.client.screen += H
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Cl
	H.Type = "Carpentry"
	O.Type = "Carpentry"
	A.Type = "Carpentry"
	B.Type = "Carpentry"
	C.Type = "Carpentry"
	D.Type = "Carpentry"
	E.Type = "Carpentry"
	F.Type = "Carpentry"
	G.Type = "Carpentry"
	src.Text("Carpentry",src,4,10,0,10,"--Carpentry Menu--")
	var/X = 3
	var/Y = 9
	if(Wood)
		for(var/obj/Items/I in src.CreateList)
			if(I.Material == Wood.Material)
				if(X != 11)
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					X += 1
				else
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					Y -= 1
					X = 3

/mob/proc/CreateBoneMenu(var/obj/Bone)
	src.DeleteInventoryMenu()
	src.InvenUp = 0
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)
	var/obj/Cl = new/obj/HUD/Menus/Inventory/CloseBone(src.client)
	H.screen_loc = "2,2 to 12,10"
	O.screen_loc = "2,10"
	A.screen_loc = "12,10"
	B.screen_loc = "2,2"
	C.screen_loc = "12,2"
	D.screen_loc = "2,10 to 12,10"
	E.screen_loc = "2,2 to 12,2"
	F.screen_loc = "2,2 to 2,10"
	G.screen_loc = "12,2 to 12,10"
	Cl.screen_loc = "12,2"
	src.client.screen += H
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Cl
	H.Type = "Bone"
	O.Type = "Bone"
	A.Type = "Bone"
	B.Type = "Bone"
	C.Type = "Bone"
	D.Type = "Bone"
	E.Type = "Bone"
	F.Type = "Bone"
	G.Type = "Bone"
	src.Text("Bone",src,4,10,0,10,"--Bone Menu--")
	var/X = 3
	var/Y = 9
	if(Bone)
		for(var/obj/Items/I in src.CreateList)
			if(I.Material == Bone.Material)
				if(X != 11)
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					X += 1
				else
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					Y -= 1
					X = 3

/mob/proc/CreateLeatherMenu(var/obj/Leather)
	src.DeleteInventoryMenu()
	src.InvenUp = 0
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)
	var/obj/Cl = new/obj/HUD/Menus/Inventory/CloseLeather(src.client)
	H.screen_loc = "2,2 to 12,10"
	O.screen_loc = "2,10"
	A.screen_loc = "12,10"
	B.screen_loc = "2,2"
	C.screen_loc = "12,2"
	D.screen_loc = "2,10 to 12,10"
	E.screen_loc = "2,2 to 12,2"
	F.screen_loc = "2,2 to 2,10"
	G.screen_loc = "12,2 to 12,10"
	Cl.screen_loc = "12,2"
	src.client.screen += H
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Cl
	H.Type = "Leather"
	O.Type = "Leather"
	A.Type = "Leather"
	B.Type = "Leather"
	C.Type = "Leather"
	D.Type = "Leather"
	E.Type = "Leather"
	F.Type = "Leather"
	G.Type = "Leather"
	src.Text("Leather",src,4,10,0,10,"--Leather Menu--")
	var/X = 3
	var/Y = 9
	if(Leather)
		for(var/obj/Items/I in src.CreateList)
			if(I.Material == Leather.Material)
				if(X != 11)
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					X += 1
				else
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					Y -= 1
					X = 3

/mob/proc/CreateForgeMenu(var/obj/Ingot)
	src.DeleteInventoryMenu()
	src.InvenUp = 0
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)
	var/obj/Cl = new/obj/HUD/Menus/Inventory/CloseForgeing(src.client)
	H.screen_loc = "2,2 to 12,13"
	O.screen_loc = "2,13"
	A.screen_loc = "12,13"
	B.screen_loc = "2,2"
	C.screen_loc = "12,2"
	D.screen_loc = "2,13 to 12,13"
	E.screen_loc = "2,2 to 12,2"
	F.screen_loc = "2,2 to 2,13"
	G.screen_loc = "12,2 to 12,13"
	Cl.screen_loc = "12,2"
	src.client.screen += H
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Cl
	H.Type = "Forge"
	O.Type = "Forge"
	A.Type = "Forge"
	B.Type = "Forge"
	C.Type = "Forge"
	D.Type = "Forge"
	E.Type = "Forge"
	F.Type = "Forge"
	G.Type = "Forge"
	src.Text("Forge",src,4,13,0,10,"--Forge Menu--")
	var/X = 3
	var/Y = 12
	if(Ingot)
		for(var/obj/Items/I in src.CreateList)
			if(I.Material == Ingot.Material)
				if(X != 11)
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					X += 1
				else
					I.layer = 100
					I.screen_loc = "[X],[Y]"
					src.client.screen += I
					Y -= 1
					X = 3

/mob/proc/CreateBuildMenu()
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)

	var/obj/B1 = new/obj/HUD/Menus/Buildings/BrickWall(src.client)
	var/obj/B2 = new/obj/HUD/Menus/Buildings/LargeBrickWall(src.client)
	var/obj/B3 = new/obj/HUD/Menus/Buildings/StoneSlab(src.client)
	var/obj/B4 = new/obj/HUD/Menus/Buildings/WoodenFloor(src.client)
	var/obj/B5 = new/obj/HUD/Menus/Buildings/WoodenWall(src.client)
	var/obj/B6 = new/obj/HUD/Menus/Buildings/StoneStairs(src.client)
	H.screen_loc = "2,2 to 8,6"
	O.screen_loc = "2,6"
	A.screen_loc = "8,6"
	B.screen_loc = "2,2"
	C.screen_loc = "8,2"
	D.screen_loc = "2,6 to 8,6"
	E.screen_loc = "2,2 to 8,2"
	F.screen_loc = "2,2 to 2,6"
	G.screen_loc = "8,2 to 8,6"

	B1.screen_loc = "3,5"
	B2.screen_loc = "5,5"
	B3.screen_loc = "7,5"
	B4.screen_loc = "3,3"
	B5.screen_loc = "5,3"
	B6.screen_loc = "7,3"
	src.client.screen += H
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += B1
	src.client.screen += B2
	src.client.screen += B3
	src.client.screen += B4
	src.client.screen += B5
	src.client.screen += B6
	H.Type = "Building"
	O.Type = "Building"
	A.Type = "Building"
	B.Type = "Building"
	C.Type = "Building"
	D.Type = "Building"
	E.Type = "Building"
	F.Type = "Building"
	G.Type = "Building"
	B1.Type = "Building"
	B2.Type = "Building"
	B3.Type = "Building"
	B4.Type = "Building"
	B5.Type = "Building"
	B6.Type = "Building"
	src.Text("Building",src,2,6,55,10,"--Build Menu--")
	return

/mob/proc/CheckContainer(var/obj/Con)
	var/NearCon = 0
	if(Con in range(1,src))
		NearCon = 1
	if(NearCon == 0)
		if(src.Container)
			var/obj/C = src.Container
			if(C.ClosedState)
				C.icon_state = C.ClosedState
				C.overlays = null
				for(var/obj/Items/Misc/Lock/L in C)
					if(L.suffix == "Fitted")
						L.icon_state = "[L.Material] lock fitted chest"
						C.overlays += L
		src.Container = null
		src.DeleteInventoryMenu()
		return
	spawn(10) CheckContainer(Con)

/mob/proc/CheckBook(var/obj/Bk)
	var/NearBook = 0
	if(Bk.loc == src)
		NearBook = 1
	if(NearBook == 0)
		src.UsingBook = null
		src.Delete("Book")
		for(var/obj/Misc/Spells/S in src.client.screen)
			src.client.screen -= S
		for(var/obj/Misc/SpellText/T in src.client.screen)
			src.client.screen -= T
		return
	spawn(10) CheckBook(Bk)

/mob/proc/CreateContainerMenu(var/obj/Con)
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/Slot = new/obj/HUD/Menus/Inventory/Slot(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)
	var/obj/T = new/obj/HUD/Menus/Inventory/Transfer(src.client)
	var/obj/Cl = new/obj/HUD/Menus/Inventory/Close(src.client)
	H.screen_loc = "10,2 to 14,6"
	Slot.screen_loc = "11,3 to 13,5"
	O.screen_loc = "10,6"
	A.screen_loc = "14,6"
	B.screen_loc = "10,2"
	C.screen_loc = "14,2"
	T.screen_loc = "14,4"
	Cl.screen_loc = "14,3"
	D.screen_loc = "10,6 to 14,6"
	E.screen_loc = "10,2 to 14,2"
	F.screen_loc = "10,2 to 10,6"
	G.screen_loc = "14,2 to 14,6"
	if(src.Function == "Transfer")
		T.icon_state = "trade button on"

	src.client.screen += H
	src.client.screen += Slot
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += T
	src.client.screen += Cl

	src.Text("Container",src,11,6,1,10,"--Container--")
	src.Text("Weight",src,10,2,1,10,"Weight - [Con.Weight]/[Con.WeightMax]")
	src.CheckContainer(Con)
	return

/mob/proc/CreateInventoryMenu()
	var/obj/H = new/obj/HUD/Menus/Inventory/Middle(src.client)
	var/obj/Slot = new/obj/HUD/Menus/Inventory/Slot(src.client)
	var/obj/O = new/obj/HUD/Menus/Inventory/TopLeft(src.client)
	var/obj/A = new/obj/HUD/Menus/Inventory/TopRight(src.client)
	var/obj/B = new/obj/HUD/Menus/Inventory/BottomLeft(src.client)
	var/obj/C = new/obj/HUD/Menus/Inventory/BottomRight(src.client)
	var/obj/D = new/obj/HUD/Menus/Inventory/TopMiddle(src.client)
	var/obj/E = new/obj/HUD/Menus/Inventory/BottomMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Inventory/LeftMiddle(src.client)
	var/obj/G = new/obj/HUD/Menus/Inventory/RightMiddle(src.client)
	var/obj/Eat = new/obj/HUD/Menus/Inventory/Eat(src.client)
	var/obj/Equip = new/obj/HUD/Menus/Inventory/Equip(src.client)
	H.screen_loc = "1,8 to 7,15"
	Slot.screen_loc = "2,9 to 6,14"
	O.screen_loc = "1,15"
	A.screen_loc = "7,15"
	B.screen_loc = "1,8"
	C.screen_loc = "7,8"
	D.screen_loc = "2,15 to 6,15"
	E.screen_loc = "2,8 to 6,8"
	F.screen_loc = "1,9 to 1,14"
	G.screen_loc = "7,9 to 7,14"
	Eat.screen_loc = "7,10"
	Equip.screen_loc = "7,9"

	src.client.screen += H
	src.client.screen += Slot
	src.client.screen += O
	src.client.screen += A
	src.client.screen += B
	src.client.screen += C
	src.client.screen += D
	src.client.screen += E
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Eat
	src.client.screen += Equip

	src.Text("Inventory",src,1,15,13,10,"Inventory")
	src.Text("Weight",src,4,15,0,10,"Weight - [src.Weight]/[src.WeightMax]")
	return

/mob/proc/Delete(var/N,var/N2)
	for(var/obj/HUD/H in src.client.screen)
		if(H.Type == N)
			del(H)
	for(var/obj/HUD/Text/T in src.client.screen)
		if(T.Type == N2)
			del(T)
	return

/mob/proc/Book()
	var/obj/M = new/obj/HUD/Menus/Scroll/ScrollMiddle(src.client)
	var/obj/L = new/obj/HUD/Menus/Scroll/ScrollLeft(src.client)
	var/obj/R = new/obj/HUD/Menus/Scroll/ScrollRight(src.client)
	var/obj/LM = new/obj/HUD/Menus/Scroll/ScrollLeft(src.client)
	var/obj/RM = new/obj/HUD/Menus/Scroll/ScrollRight(src.client)
	var/obj/TLL = new/obj/HUD/Menus/Book/FrameTLL(src.client)
	var/obj/TML = new/obj/HUD/Menus/Book/FrameTML(src.client)
	var/obj/TRL = new/obj/HUD/Menus/Book/FrameTRL(src.client)
	var/obj/TLR = new/obj/HUD/Menus/Book/FrameTLR(src.client)
	var/obj/TMR = new/obj/HUD/Menus/Book/FrameTMR(src.client)
	var/obj/TRR = new/obj/HUD/Menus/Book/FrameTRR(src.client)
	var/obj/TTR = new/obj/HUD/Menus/Book/FrameTTR(src.client)
	var/obj/BBR = new/obj/HUD/Menus/Book/FrameBBR(src.client)
	var/obj/BRR = new/obj/HUD/Menus/Book/FrameBRR(src.client)
	var/obj/BMR = new/obj/HUD/Menus/Book/FrameBMR(src.client)
	var/obj/BLR = new/obj/HUD/Menus/Book/FrameBLR(src.client)
	var/obj/BRL = new/obj/HUD/Menus/Book/FrameBRL(src.client)
	var/obj/BML = new/obj/HUD/Menus/Book/FrameBML(src.client)
	var/obj/BLL = new/obj/HUD/Menus/Book/FrameBLL(src.client)
	var/obj/BBL = new/obj/HUD/Menus/Book/FrameBBL(src.client)
	var/obj/TTL = new/obj/HUD/Menus/Book/FrameTTL(src.client)
	M.screen_loc = "8,13 to 11,14"
	L.screen_loc = "8,13 to 8,14"
	R.screen_loc = "11,13 to 11,14"
	RM.screen_loc = "9,13 to 9,14"
	LM.screen_loc = "10,13 to 10,14"
	TLL.screen_loc = "7,15"
	TML.screen_loc = "8,15"
	TRL.screen_loc = "9,15"
	TLR.screen_loc = "10,15"
	TMR.screen_loc = "11,15"
	TRR.screen_loc = "12,15"
	TTR.screen_loc = "12,14"
	BBR.screen_loc = "12,13"
	BRR.screen_loc = "12,12"
	BMR.screen_loc = "11,12"
	BLR.screen_loc = "10,12"
	BRL.screen_loc = "9,12"
	BML.screen_loc = "8,12"
	BLL.screen_loc = "7,12"
	BBL.screen_loc = "7,13"
	TTL.screen_loc = "7,14"
	src.client.screen += M
	src.client.screen += L
	src.client.screen += R
	src.client.screen += LM
	src.client.screen += RM
	src.client.screen += TLL
	src.client.screen += TML
	src.client.screen += TRL
	src.client.screen += TLR
	src.client.screen += TMR
	src.client.screen += TRR
	src.client.screen += TTR
	src.client.screen += BBR
	src.client.screen += BRR
	src.client.screen += BMR
	src.client.screen += BLR
	src.client.screen += BRL
	src.client.screen += BML
	src.client.screen += BLL
	src.client.screen += BBL
	src.client.screen += TTL
	M.Type = "Book"
	L.Type = "Book"
	R.Type = "Book"
	RM.Type = "Book"
	LM.Type = "Book"
	TLL.Type = "Book"
	TML.Type = "Book"
	TRL.Type = "Book"
	TLR.Type = "Book"
	TMR.Type = "Book"
	TRR.Type = "Book"
	TTR.Type = "Book"
	BBR.Type = "Book"
	BRR.Type = "Book"
	BMR.Type = "Book"
	BLR.Type = "Book"
	BRL.Type = "Book"
	BML.Type = "Book"
	BLL.Type = "Book"
	BBL.Type = "Book"
	TTL.Type = "Book"
	if(src.UsingBook)
		src.CheckBook(src.UsingBook)
		var/obj/Book = src.UsingBook
		var/Num = 0
		var/X = 9
		var/Y = 14
		for(var/obj/Misc/Spells/S in Book.BookContents)
			if(Num != 4)
				if(Y != 12)
					Num += 1
					S.screen_loc = "[X],[Y]"
					src.client.screen += S
					var/obj/Misc/SpellText/T = new
					T.icon_state = "[S.icon_state] text"
					T.screen_loc = "[X - 1],[Y]"
					src.client.screen += T
					Y -= 1
				else
					Y = 14
					X = 11
					Num += 1
					S.screen_loc = "[X],[Y]"
					src.client.screen += S
					var/obj/Misc/SpellText/T = new
					T.icon_state = "[S.icon_state] text"
					T.screen_loc = "[X - 1],[Y]"
					src.client.screen += T
					Y -= 1
			else
				Book.FuturePages += S

/mob/proc/Box()
	var/obj/H = new/obj/HUD/Menus/Box(src.client)
	var/NameX = src.MouseLocationX + 1
	var/NameY = src.MouseLocationY - 1
	var/PurityX = src.MouseLocationX + 1
	var/PurityY = src.MouseLocationY - 3
	var/WeightLocX = src.MouseLocationX + 1
	var/WeightLocY = src.MouseLocationY - 2
	var/SlotLocX = src.MouseLocationX + 1
	var/SlotLocY = src.MouseLocationY - 3
	var/DuraLocX = src.MouseLocationX + 1
	var/DuraLocY = src.MouseLocationY - 4
	var/LocationX = src.MouseLocationX + 1
	var/LocationY = src.MouseLocationY - 1
	var/MiddleX = src.MouseLocationX + 5
	var/MiddleY = src.MouseLocationY - 5
	H.screen_loc = "[LocationX],[LocationY] to [MiddleX],[MiddleY]"
	H.Type = "ScrollMiddle"
	src.client.screen += H
	for(var/obj/Items/I in src)
		if(I.Xloc == src.MouseLocationX)
			if(I.Yloc == src.MouseLocationY)
				src.Text("BoxDelete",src,NameX,NameY,8,13,"[I.name]")
				src.Text("BoxDelete",src,WeightLocX,WeightLocY,8,13,"Weight-[I.Weight]")
				if(I.CraftPotential)
					src.Text("BoxDelete",src,PurityX,PurityY,8,13,"Potential-[I.CraftPotential]")
				if(I.Defence)
					src.Text("BoxDelete",src,SlotLocX,SlotLocY,8,13,"Defence-[I.Defence]")
				if(I.Quality)
					var/DMG = I.Quality
					src.Text("BoxDelete",src,SlotLocX,SlotLocY,8,13,"Damage-[DMG]")
				if(I.Dura)
					src.Text("BoxDelete",src,DuraLocX,DuraLocY,8,13,"Durability-[I.Dura]")
	return

/mob/proc/CreateContainerContents(var/obj/Con)
	src.CreateContainerMenu(Con)
	var/count = 0
	var/x = 11
	var/y = 5
	for(var/obj/Items/O in Con.contents)
		if(O && O.suffix != "Fitted")
			if(y >= 3)
				if(count < 3)
					count++
					O.layer = 20
					src.client.screen += O
					O.screen_loc = "[x],[y]"
					O.Xloc = x
					O.Yloc = y
					x++
				else
					count = 0
					count++
					y -= 1
					x = 11
					if(y >= 3)
						O.layer = 20
						src.client.screen += O
						O.screen_loc = "[x],[y]"
						O.Xloc = x
						O.Yloc = y
						x++
	return

/mob/proc/CreateInventory()
	for(var/obj/HUD/Menus/H in src.client.screen)
		if(H.Type != "Book")
			del(H)
	src.CreateInventoryMenu()
	var/count = 0
	var/x = 2
	var/y = 14
	for(var/obj/O in src.contents)
		if(O)
			if(y >= 9)
				if(count < 5)
					count++
					O.layer = 20
					O.screen_loc = "[x],[y]"
					src.client.screen += O
					O.Xloc = x
					O.Yloc = y
					x++
				else
					count = 0
					count++
					y -= 1
					x = 2
					if(y >= 9)
						O.layer = 20
						src.client.screen += O
						O.screen_loc = "[x],[y]"
						O.Xloc = x
						O.Yloc = y
						x++
	return

/mob/proc/CreateRaceSelection()
	var/obj/H = new/obj/HUD/Menus/Scroll/ScrollMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Scroll/ScrollLeft(src.client)
	var/obj/G = new/obj/HUD/Menus/Scroll/ScrollRight(src.client)
	var/obj/Scroll1 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/Scroll2 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/ScrollLeft1 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollLeft2 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollRight1 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)
	var/obj/ScrollRight2 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)

	var/obj/Human = new/obj/HUD/RaceSelection/Human(src.client)
	var/obj/Wolfman = new/obj/HUD/RaceSelection/Wolfman(src.client)
	var/obj/Alther = new/obj/HUD/RaceSelection/Alther(src.client)
	var/obj/Cyclops = new/obj/HUD/RaceSelection/Cyclops(src.client)
	var/obj/Frogman = new/obj/HUD/RaceSelection/Frogman(src.client)
	var/obj/Giant = new/obj/HUD/RaceSelection/Giant(src.client)
	var/obj/Ratling = new/obj/HUD/RaceSelection/Ratling(src.client)
	var/obj/Stahlite = new/obj/HUD/RaceSelection/Stahlite(src.client)
	var/obj/Snakeman = new/obj/HUD/RaceSelection/Snakeman(src.client)

	var/obj/Cancel = new/obj/HUD/RaceSelection/Cancel(src.client)
	var/obj/Accept = new/obj/HUD/RaceSelection/Accept(src.client)
	var/obj/Male = new/obj/HUD/RaceSelection/Male(src.client)
	var/obj/Female = new/obj/HUD/RaceSelection/Female(src.client)
	Scroll1.screen_loc = "2,15 to 14,15"
	ScrollLeft1.screen_loc = "1,15"
	ScrollLeft2.screen_loc = "1,2"
	ScrollRight1.screen_loc = "15,15"
	ScrollRight2.screen_loc = "15,2"
	H.screen_loc = "2,14 to 14,3"
	F.screen_loc = "2,3 to 2,14"
	G.screen_loc = "14,3 to 14,14"
	Scroll2.screen_loc = "2,2 to 14,2"

	Human.screen_loc = "2,14"
	Wolfman.screen_loc = "3,14"
	Alther.screen_loc = "4,14"
	Cyclops.screen_loc = "6,14"
	Stahlite.screen_loc = "14,14"
	Snakeman.screen_loc = "13,14"
	Frogman.screen_loc = "8,14"
	Giant.screen_loc = "10,14"
	Ratling.screen_loc = "12,14"

	Accept.screen_loc = "2,3"
	Cancel.screen_loc = "4,3"
	Male.screen_loc = "14,3"
	Female.screen_loc = "12,3"
	src.client.screen += H
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Scroll1
	src.client.screen += Scroll2
	src.client.screen += ScrollLeft1
	src.client.screen += ScrollLeft2
	src.client.screen += ScrollRight1
	src.client.screen += ScrollRight2

	src.client.screen += Human
	src.client.screen += Wolfman
	src.client.screen += Alther
	src.client.screen += Snakeman
	src.client.screen += Cyclops
	src.client.screen += Frogman
	src.client.screen += Giant
	src.client.screen += Ratling
	src.client.screen += Stahlite

	src.client.screen += Accept
	src.client.screen += Cancel
	src.client.screen += Male
	src.client.screen += Female
	H.Type = "RaceSelection"
	F.Type = "RaceSelection"
	G.Type = "RaceSelection"
	Scroll1.Type = "RaceSelection"
	Scroll2.Type = "RaceSelection"
	ScrollLeft1.Type = "RaceSelection"
	ScrollLeft2.Type = "RaceSelection"
	ScrollRight1.Type = "RaceSelection"
	ScrollRight2.Type = "RaceSelection"
	if(src.key in IllithidList)
		var/obj/Illithid = new/obj/HUD/RaceSelection/Illithid(src.client)
		Illithid.screen_loc = "5,14"
		src.client.screen += Illithid

/mob/proc/CreateSkillDisplay()
	var/obj/H = new/obj/HUD/Menus/Scroll/ScrollMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Scroll/ScrollLeft(src.client)
	var/obj/G = new/obj/HUD/Menus/Scroll/ScrollRight(src.client)
	var/obj/Scroll1 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/Scroll2 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/ScrollLeft1 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollLeft2 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollRight1 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)
	var/obj/ScrollRight2 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)
	Scroll1.screen_loc = "2,15 to 14,15"
	ScrollLeft1.screen_loc = "1,15"
	ScrollLeft2.screen_loc = "1,2"
	ScrollRight1.screen_loc = "15,15"
	ScrollRight2.screen_loc = "15,2"
	H.screen_loc = "2,14 to 14,3"
	F.screen_loc = "2,3 to 2,14"
	G.screen_loc = "14,3 to 14,14"
	Scroll2.screen_loc = "2,2 to 14,2"
	src.client.screen += H
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Scroll1
	src.client.screen += Scroll2
	src.client.screen += ScrollLeft1
	src.client.screen += ScrollLeft2
	src.client.screen += ScrollRight1
	src.client.screen += ScrollRight2
	H.Type = "SkillDisplay"
	F.Type = "SkillDisplay"
	G.Type = "SkillDisplay"
	Scroll1.Type = "SkillDisplay"
	Scroll2.Type = "SkillDisplay"
	ScrollLeft1.Type = "SkillDisplay"
	ScrollLeft2.Type = "SkillDisplay"
	ScrollRight1.Type = "SkillDisplay"
	ScrollRight2.Type = "SkillDisplay"
	src.Text("SkillDisplay",src,2,14,10,14,"--Skill Information--")
	src.Text("SkillDisplay",src,2,13,10,14,"SwordSkill-[src.SwordSkill]")
	src.Text("SkillDisplay",src,2,12,10,14,"SpearSkill-[src.SpearSkill]")
	src.Text("SkillDisplay",src,2,11,10,14,"BluntSkill-[src.BluntSkill]")
	src.Text("SkillDisplay",src,2,10,10,14,"AxeSkill-[src.AxeSkill]")
	src.Text("SkillDisplay",src,2,9,10,14,"DaggerSkill-[src.DaggerSkill]")
	src.Text("SkillDisplay",src,2,8,10,14,"RangedSkill-[src.RangedSkill]")
	src.Text("SkillDisplay",src,2,7,10,14,"UnarmedSkill-[src.UnarmedSkill]")
	src.Text("SkillDisplay",src,2,6,10,14,"ShieldSkill-[src.ShieldSkill]")
	src.Text("SkillDisplay",src,2,5,10,14,"Mining-[src.MiningSkill]")
	src.Text("SkillDisplay",src,2,4,10,14,"Smelting-[src.SmeltingSkill]")
	src.Text("SkillDisplay",src,2,3,10,14,"FirstAid-[src.FirstAidSkill]")
	src.Text("SkillDisplay",src,6,13,10,14,"Forging-[src.ForgingSkill]")
	src.Text("SkillDisplay",src,6,12,10,14,"Masonary-[src.MasonarySkill]")
	src.Text("SkillDisplay",src,6,11,10,14,"Cooking-[src.CookingSkill]")
	src.Text("SkillDisplay",src,6,10,10,14,"Fishing-[src.FishingSkill]")
	src.Text("SkillDisplay",src,6,9,10,14,"Alchemy-[src.AlchemySkill]")
	src.Text("SkillDisplay",src,6,8,10,14,"LeatherCraft-[src.LeatherCraftSkill]")
	src.Text("SkillDisplay",src,6,7,10,14,"WoodCutting-[src.WoodCuttingSkill]")
	src.Text("SkillDisplay",src,6,6,10,14,"Building-[src.BuildingSkill]")
	src.Text("SkillDisplay",src,6,5,10,14,"Farming-[src.FarmingSkill]")
	src.Text("SkillDisplay",src,6,4,10,14,"Weaving-[src.WeavingSkill]")
	src.Text("SkillDisplay",src,6,3,10,14,"Carpentry-[src.CarpentrySkill]")
	src.Text("SkillDisplay",src,10,13,10,14,"Skinning-[src.SkinningSkill]")
	src.Text("SkillDisplay",src,10,12,10,14,"Butchery-[src.ButcherySkill]")
	src.Text("SkillDisplay",src,10,11,10,14,"Engraving-[src.EngravingSkill]")
	src.Text("SkillDisplay",src,10,10,10,14,"Swimming-[src.SwimmingSkill]")
	src.Text("SkillDisplay",src,10,9,10,14,"BoneCraft-[src.BoneCraftSkill]")
	src.Text("SkillDisplay",src,10,8,10,14,"Astral Magic-[src.AstralMagic]")
	src.Text("SkillDisplay",src,10,7,10,14,"Necromancy-[src.Necromancery]")
	src.Text("SkillDisplay",src,10,6,10,14,"Blood Magic-[src.BloodMagic]")

/mob/proc/CreateHealthDisplay()
	var/obj/H = new/obj/HUD/Menus/Scroll/ScrollMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Scroll/ScrollLeft(src.client)
	var/obj/G = new/obj/HUD/Menus/Scroll/ScrollRight(src.client)
	var/obj/Scroll1 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/Scroll2 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/ScrollLeft1 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollLeft2 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollRight1 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)
	var/obj/ScrollRight2 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)
	Scroll1.screen_loc = "2,15 to 14,15"
	ScrollLeft1.screen_loc = "1,15"
	ScrollLeft2.screen_loc = "1,3"
	ScrollRight1.screen_loc = "15,15"
	ScrollRight2.screen_loc = "15,3"
	H.screen_loc = "2,14 to 14,4"
	F.screen_loc = "2,4 to 2,14"
	G.screen_loc = "14,4 to 14,14"
	Scroll2.screen_loc = "2,3 to 14,3"
	src.client.screen += H
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Scroll1
	src.client.screen += Scroll2
	src.client.screen += ScrollLeft1
	src.client.screen += ScrollLeft2
	src.client.screen += ScrollRight1
	src.client.screen += ScrollRight2
	H.Type = "HealthDisplay"
	F.Type = "HealthDisplay"
	G.Type = "HealthDisplay"
	Scroll1.Type = "HealthDisplay"
	Scroll2.Type = "HealthDisplay"
	ScrollLeft1.Type = "HealthDisplay"
	ScrollLeft2.Type = "HealthDisplay"
	ScrollRight1.Type = "HealthDisplay"
	ScrollRight2.Type = "HealthDisplay"
	var/Blood
	if(src.Bleed)
		Blood = src.Bleed
	else
		Blood = "None"
	src.Text("HealthDisplay",src,4,14,1,14,"--Health Information--")
	if(src.Race != "Snakeman")
		src.Text("HealthDisplay",src,2,13,1,14,"RightLeg-[src.RightLeg]%")
		src.Text("HealthDisplay",src,2,12,1,14,"LeftLeg-[src.LeftLeg]%")
	src.Text("HealthDisplay",src,2,11,1,14,"RightArm-[src.RightArm]%")
	src.Text("HealthDisplay",src,2,10,1,14,"LeftArm-[src.LeftArm]%")
	src.Text("HealthDisplay",src,2,9,1,14,"Nose-[src.Nose]%")
	src.Text("HealthDisplay",src,2,8,1,14,"LeftEar-[src.LeftEar]%")
	src.Text("HealthDisplay",src,2,7,1,14,"RightEar-[src.RightEar]%")
	src.Text("HealthDisplay",src,2,6,1,14,"Teeth-[src.Teeth]%")
	if(src.Race != "Cyclops")
		src.Text("HealthDisplay",src,2,5,1,14,"LeftEye-[src.LeftEye]%")
		src.Text("HealthDisplay",src,2,4,1,14,"RightEye-[src.RightEye]%")
	else
		src.Text("HealthDisplay",src,2,5,1,14,"Eye-[src.RightEye]%")
	src.Text("HealthDisplay",src,7,13,1,14,"Tongue-[src.Tongue]%")
	src.Text("HealthDisplay",src,7,12,1,14,"Skull-[src.Skull]%")
	src.Text("HealthDisplay",src,7,11,1,14,"Brain-[src.Brain]%")
	src.Text("HealthDisplay",src,7,10,1,14,"Heart-[src.Heart]%")
	src.Text("HealthDisplay",src,7,9,1,14,"LeftLung-[src.LeftLung]%")
	src.Text("HealthDisplay",src,7,8,1,14,"RightLung-[src.RightLung]%")
	src.Text("HealthDisplay",src,7,7,1,14,"Liver-[src.Liver]%")
	src.Text("HealthDisplay",src,7,6,1,14,"Spleen-[src.Spleen]%")
	src.Text("HealthDisplay",src,7,5,1,14,"LeftKidney-[src.LeftKidney]%")
	src.Text("HealthDisplay",src,7,4,1,14,"RightKidney-[src.RightKidney]%")
	src.Text("HealthDisplay",src,11,13,-5,14,"Intestines-[src.Intestine]%")
	src.Text("HealthDisplay",src,11,12,-5,14,"Stomach-[src.Stomach]%")
	src.Text("HealthDisplay",src,11,11,-5,14,"Throat-[src.Throat]%")
	if(src.Claws != 0)
		src.Text("HealthDisplay",src,11,10,-5,14,"Claws-[src.Claws]%")
	src.Text("HealthDisplay",src,10,14,10,14,"Bleeding-[Blood]")

/mob/proc/CreateInfoDisplay()
	var/obj/H = new/obj/HUD/Menus/Scroll/ScrollMiddle(src.client)
	var/obj/F = new/obj/HUD/Menus/Scroll/ScrollLeft(src.client)
	var/obj/G = new/obj/HUD/Menus/Scroll/ScrollRight(src.client)
	var/obj/Scroll1 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/Scroll2 = new/obj/HUD/Menus/Scroll/Scroll(src.client)
	var/obj/ScrollLeft1 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollLeft2 = new/obj/HUD/Menus/Scroll/ScrollLeft2(src.client)
	var/obj/ScrollRight1 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)
	var/obj/ScrollRight2 = new/obj/HUD/Menus/Scroll/ScrollRight2(src.client)
	Scroll1.screen_loc = "4,15 to 14,15"
	ScrollLeft1.screen_loc = "3,15"
	ScrollLeft2.screen_loc = "3,3"
	ScrollRight1.screen_loc = "15,15"
	ScrollRight2.screen_loc = "15,3"
	H.screen_loc = "4,14 to 14,4"
	F.screen_loc = "4,4 to 4,14"
	G.screen_loc = "14,4 to 14,14"
	Scroll2.screen_loc = "4,3 to 14,3"
	src.client.screen += H
	src.client.screen += F
	src.client.screen += G
	src.client.screen += Scroll1
	src.client.screen += Scroll2
	src.client.screen += ScrollLeft1
	src.client.screen += ScrollLeft2
	src.client.screen += ScrollRight1
	src.client.screen += ScrollRight2
	H.Type = "InfoDisplay"
	F.Type = "InfoDisplay"
	G.Type = "InfoDisplay"
	Scroll1.Type = "InfoDisplay"
	Scroll2.Type = "InfoDisplay"
	ScrollLeft1.Type = "InfoDisplay"
	ScrollLeft2.Type = "InfoDisplay"
	ScrollRight1.Type = "InfoDisplay"
	ScrollRight2.Type = "InfoDisplay"
	src.Text("InfoDisplay",src,4,14,10,10,"--General Information--")
	src.Text("InfoDisplay",src,4,13,10,10,"Name-[src.name]")
	src.Text("InfoDisplay",src,4,12,10,10,"Age-[src.Age]")
	src.Text("InfoDisplay",src,4,11,10,10,"Gender-[src.Gender]")
	src.Text("InfoDisplay",src,4,10,10,10,"Hunger-[src.Hunger]")
	src.Text("InfoDisplay",src,4,9,10,10,"Tiredness-[src.Sleep]")
	src.Text("InfoDisplay",src,4,8,10,10,"Strength-[src.Strength]")
	src.Text("InfoDisplay",src,4,7,10,10,"Agility-[src.Agility]")
	src.Text("InfoDisplay",src,4,6,10,10,"Endurance-[src.Endurance]")
	src.Text("InfoDisplay",src,4,5,10,10,"Intelligence-[src.Intelligence]")

