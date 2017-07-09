/obj/Misc/SpellEffects
	icon = 'fx.dmi'

/obj/Misc/SpellEffects/AstralShield
	icon_state = "astral shield"
	layer = 7

/obj/Misc/SpellEffects/Dispel
	icon_state = "dispel"

/obj/Misc/SpellEffects/Evil
	icon_state = "evil"

/obj/Misc/SpellText
	layer = 101
	icon = 'books.dmi'

/obj/Misc/Spells
	icon = 'books.dmi'
	layer = 101

/obj/Misc/Spells/SoulEnslavement
	icon_state = "soul enslavement"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"

/obj/Misc/Spells/InflictVampirism
	icon_state = "vampirism"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"

/obj/Misc/Spells/EverDark
	icon_state = "everdark"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"

/obj/Misc/Spells/CreatePlague
	icon_state = "plague"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"

/obj/Misc/Spells/DeadRising
	icon_state = "dead rising"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"

/obj/Misc/Spells/RaiseDead
	icon_state = "undead"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"

/obj/Misc/Spells/LichCraft
	icon_state = "lichcraft"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"

/obj/Misc/Spells/RaiseSkeleton
	icon_state = "skeleton"
	WrittenIn = "DarkTongue"
	MagicUsed = "Necromancy"
	SpellEffect = "Raise Skeleton"
	desc = ".:<u>To Raise a Skeleton</u>:.<p>In order to raise a Skelatal Minion, One set of Bones and One Skull is required. Once you have both of these, a Pentagram is needed. Place the Bones into the middle and speak the words,"

/obj/Misc/Spells/RaiseSkeleton/New()
	var/First = list("Ni'","Rak'","Vark'","Na'","Blek'","Vod'","Gra'","Qul'","Thal'","Tra'","Wes'","Dra'","Fru'","Nar'")
	var/Second = list("tar","thos","palk","ekk","ukk","ektus","tius","urk","dar","pak","tras","rakka","tor","drel")
	var/Third = list("Ni'","Thar'","Lark'","Ra'","Vlek'","Bod'","Pra'","Aul'","Ahal'","Era'","Tes'","Bra'","Uru'","Qar'")
	var/Forth = list("mar","phos","valk","ukk","ekk","ektus","vius","urk","par","wak","pras","takka","mor","brel")
	var/Word = null
	for(var/T in First)
		var/Choose = prob(20)
		if(Choose)
			Word = "[T]"
			break
	for(var/T in Second)
		var/Choose = prob(20)
		if(Choose)
			Word = "[Word][T]"
			break
	for(var/T in Third)
		var/Choose = prob(20)
		if(Choose)
			Word = "[Word] [T]"
			break
	for(var/T in Forth)
		var/Choose = prob(20)
		if(Choose)
			Word = "[Word][T]"
			break
	src.SpellWords = "[Word]"
	src.desc = "[src.desc][src.SpellWords]"

/obj/Misc/Spells/RaiseSkeleton/Click()
	if(usr.Function == "Examine" && usr.CanSee && usr.UsingBook && usr.Fainted == 0 && usr.Stunned == 0 && src in usr.client.screen)
		usr << "<font color = teal>You begin to Examine the [src] spell...<br>"
		spawn(100)
			if(src && usr.CanSee && usr.UsingBook && src in usr.client.screen)
				var/obj/Know = null
				for(var/obj/Misc/Languages/L in usr.LangKnow)
					if(L.name == src.WrittenIn && L.WritePercent >= 0)
						Know = L
				if(Know)
					usr << "<font color = teal>This Spell seems to be written in [src.WrittenIn]. You are able to understand [Know.WritePercent]% Written [src.WrittenIn] currently.<br>"
				else
					usr << "<font color = teal>You have no idea what Language it is written in.<br>"
				var/TextLength = lentext(src.desc)
				var/Text = null
				var/NewText = null
				while(TextLength >= 1)
					Text ="[copytext(src.desc,(lentext(src.desc)-TextLength)+1,(lentext(src.desc)-TextLength)+2)]"
					var/Change = 0
					var/Changes = 0
					if(Know)
						Changes += Know.WritePercent + usr.Intelligence / 10
						if(usr.Intelligence <= usr.IntCap && usr.Intelligence <= WorldIntCap && usr.Intelligence <= usr.IntelligenceMax)
							usr.Intelligence += usr.IntelligenceMulti / 4
					Change = prob(100 - Changes)
					if(Change)
						usr.CheckText(Text)
						NewText+="[usr.TextOutput]"
						usr.TextOutput = null
					if(Change == 0)
						NewText+="[copytext(src.desc,(lentext(src.desc)-TextLength)+1,(lentext(src.desc)-TextLength)+2)]"
					TextLength--
				usr << "<font color = teal>You attempt to read the spell in your head.<p>[NewText]<br>"
				return

/obj/Misc/Spells/AfterLife
	icon_state = "afterlife"
	WrittenIn = "DarkTongue"

/obj/Misc/Spells/SummonWraith
	icon_state = "wraith"
	WrittenIn = "DarkTongue"

/obj/Misc/Spells/SummonGhost
	icon_state = "ghost"
	WrittenIn = "DarkTongue"

/obj/Misc/Spells/CreateCorpseDevourer
	icon_state = "corpse devourer"
	WrittenIn = "DarkTongue"


/obj/Misc/OtherWorldly/AstralStrand
	icon = 'terrain.dmi'
	icon_state = "astral strand"

/obj/Misc/OtherWorldly/AstralStrand/New()
	var/D = rand(1,4)
	if(D == 1)
		src.dir = NORTH
	if(D == 2)
		src.dir = SOUTH
	if(D == 3)
		src.dir = EAST
	if(D == 4)
		src.dir = WEST

/obj/Misc/OtherWorldly/AstralStrands
	icon = 'terrain.dmi'
	icon_state = "astral strands"

/obj/Misc/OtherWorldly/AstralStrands/New()
	var/D = rand(1,8)
	if(D == 1)
		src.dir = NORTH
	if(D == 2)
		src.dir = SOUTH
	if(D == 3)
		src.dir = EAST
	if(D == 4)
		src.dir = WEST
	if(D == 5)
		src.dir = NORTHWEST
	if(D == 6)
		src.dir = NORTHEAST
	if(D == 7)
		src.dir = SOUTHWEST
	if(D == 8)
		src.dir = SOUTHEAST

/obj/Misc/OtherWorldly/ChaosEnergy
	icon = 'fx.dmi'
	icon_state = "chaos energy"
	layer = 5

/obj/Misc/OtherWorldly/ChaosEnergy/New()
	MoveRand()
	spawn(30)
		if(src)
			del(src)
