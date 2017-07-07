/mob/proc/LearnRaceLanguages(var/Lang)
	src << "<font color = purple>You hear the basics of [Lang] and begin to understand it!<br>"
	if(Lang == "Common")
		var/obj/Misc/Languages/Common/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Demonic")
		var/obj/Misc/Languages/Demonic/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Ancient")
		var/obj/Misc/Languages/Ancient/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "DarkTongue")
		var/obj/Misc/Languages/DarkTongue/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Human")
		var/obj/Misc/Languages/Human/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Altherian")
		var/obj/Misc/Languages/Altherian/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Stahliteian")
		var/obj/Misc/Languages/Stahliteian/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Slithus")
		var/obj/Misc/Languages/Slithus/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Wolfen")
		var/obj/Misc/Languages/Wolfen/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Scutter")
		var/obj/Misc/Languages/Scutter/L = new
		L.SpeakPercent = 1
		src.LangKnow += L
	if(Lang == "Ribbitus")
		var/obj/Misc/Languages/Ribbitus/L = new
		L.SpeakPercent = 1
		src.LangKnow += L

/mob/proc/GiveRaceLanguages()
	if(src.Race == "Cyclops")
		var/obj/Misc/Languages/Human/L = new
		L.SpeakPercent = 100
		L.WritePercent = 15
		src.CurrentLanguage = L
		src.LangKnow += L

	if(src.Race == "Giant")
		var/obj/Misc/Languages/Human/L = new
		L.SpeakPercent = 100
		L.WritePercent = 10
		src.CurrentLanguage = L
		src.LangKnow += L

	if(src.Race == "Human")
		var/obj/Misc/Languages/Human/L = new
		L.SpeakPercent = 100
		L.WritePercent = 100
		src.CurrentLanguage = L
		src.LangKnow += L

		var/obj/Misc/Languages/Altherian/L2 = new
		L2.SpeakPercent = 85
		L2.WritePercent = 50
		src.LangKnow += L2

		var/obj/Misc/Languages/Stahliteian/L3 = new
		L3.SpeakPercent = 85
		L3.WritePercent = 50
		src.LangKnow += L3

		var/obj/Misc/Languages/Slithus/L4 = new
		L4.SpeakPercent = 50
		L4.WritePercent = 25
		src.LangKnow += L4

		var/obj/Misc/Languages/Common/C = new
		C.SpeakPercent = 97
		C.WritePercent = 97
		src.CurrentLanguage = C
		src.LangKnow += C
	if(src.Race == "Alther")
		var/obj/Misc/Languages/Altherian/L = new
		L.SpeakPercent = 100
		L.WritePercent = 100
		src.CurrentLanguage = L
		src.LangKnow += L

		var/obj/Misc/Languages/Human/L2 = new
		L2.SpeakPercent = 85
		L2.WritePercent = 85
		src.LangKnow += L2

		var/obj/Misc/Languages/Stahliteian/L3 = new
		L3.SpeakPercent = 85
		L3.WritePercent = 85
		src.LangKnow += L3

		var/obj/Misc/Languages/Slithus/L4 = new
		L4.SpeakPercent = 50
		L4.WritePercent = 50
		src.LangKnow += L4

		var/obj/Misc/Languages/Common/C = new
		C.SpeakPercent = 97
		C.WritePercent = 97
		src.CurrentLanguage = C
		src.LangKnow += C

		var/obj/Misc/Languages/Ancient/A = new
		A.SpeakPercent = 50
		A.WritePercent = 33
		src.CurrentLanguage = A
		src.LangKnow += A
	if(src.Race == "Stahlite")
		var/obj/Misc/Languages/Stahliteian/L = new
		L.SpeakPercent = 100
		L.WritePercent = 100
		src.CurrentLanguage = L
		src.LangKnow += L

		var/obj/Misc/Languages/Human/L2 = new
		L2.SpeakPercent = 85
		L2.WritePercent = 85
		src.LangKnow += L2

		var/obj/Misc/Languages/Altherian/L3 = new
		L3.SpeakPercent = 85
		L3.WritePercent = 50
		src.LangKnow += L3

		var/obj/Misc/Languages/Slithus/L4 = new
		L4.SpeakPercent = 50
		L4.WritePercent = 33
		src.LangKnow += L4

		var/obj/Misc/Languages/Common/C = new
		C.SpeakPercent = 97
		C.WritePercent = 97
		src.CurrentLanguage = C
		src.LangKnow += C

		var/obj/Misc/Languages/Ancient/A = new
		A.SpeakPercent = 50
		A.WritePercent = 33
		src.CurrentLanguage = A
		src.LangKnow += A
	if(src.Race == "Snakeman")
		var/obj/Misc/Languages/Slithus/L = new
		L.SpeakPercent = 100
		L.WritePercent = 100
		src.CurrentLanguage = L
		src.LangKnow += L

		var/obj/Misc/Languages/Stahliteian/L2 = new
		L2.SpeakPercent = 50
		L2.WritePercent = 25
		src.LangKnow += L2

		var/obj/Misc/Languages/Human/L3 = new
		L3.SpeakPercent = 50
		L3.WritePercent = 25
		src.LangKnow += L3

		var/obj/Misc/Languages/Altherian/L4 = new
		L4.SpeakPercent = 50
		L4.WritePercent = 25
		src.LangKnow += L4

		var/obj/Misc/Languages/Common/C = new
		C.SpeakPercent = 97
		C.WritePercent = 97
		src.CurrentLanguage = C
		src.LangKnow += C

		var/obj/Misc/Languages/Ancient/A = new
		A.SpeakPercent = 40
		A.WritePercent = 20
		src.CurrentLanguage = A
		src.LangKnow += A
	if(src.Race == "Ratling")
		var/obj/Misc/Languages/Scutter/L = new
		L.SpeakPercent = 100
		L.WritePercent = 100
		src.CurrentLanguage = L
		src.LangKnow += L
	if(src.Race == "Illithid")
		var/obj/Misc/Languages/Slithus/L = new
		L.SpeakPercent = 50
		L.WritePercent = 50
		src.CurrentLanguage = L
		src.LangKnow += L

		var/obj/Misc/Languages/Ribbitus/L2 = new
		L2.SpeakPercent = 97
		L2.WritePercent = 50
		src.CurrentLanguage = L2
		src.LangKnow += L2

		var/obj/Misc/Languages/Ancient/L3 = new
		L3.SpeakPercent = 100
		L3.WritePercent = 100
		src.LangKnow += L3

		var/obj/Misc/Languages/Common/C = new
		C.SpeakPercent = 75
		C.WritePercent = 50
		src.CurrentLanguage = C
		src.LangKnow += C
	if(src.Race == "Frogman")
		var/obj/Misc/Languages/Ribbitus/L = new
		L.SpeakPercent = 100
		L.WritePercent = 100
		src.CurrentLanguage = L
		src.LangKnow += L

		var/obj/Misc/Languages/Human/L2 = new
		L2.SpeakPercent = 85
		L2.WritePercent = 50
		src.LangKnow += L2

		var/obj/Misc/Languages/Common/C = new
		C.SpeakPercent = 97
		C.WritePercent = 97
		src.CurrentLanguage = C
		src.LangKnow += C
	if(src.Race == "Wolfman")
		var/obj/Misc/Languages/Wolfen/L = new
		L.SpeakPercent = 100
		L.WritePercent = 100
		src.CurrentLanguage = L
		src.LangKnow += L