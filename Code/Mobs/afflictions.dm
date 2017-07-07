/mob/proc/Corruption()
	spawn(7000)
		if(src)
			if(src.WRightHand)
				var/obj/I = src.WRightHand
				src.Heal()
				if(I.icon_state == "Corruption6")
					src << "<font color = red>Your mind begins to spiral into oblivion, images of death, detruction, and doom plague your very sight. All of your senses feel numb, robbed from you by the [I], no emotion, no memory, only the overwhelming desire to obliterate all in your path. You begin to twitch violently, your entire body burns with pain. You slowly begin to float just off the ground as your entire being flares with the most immense pain that could ever be felt by a mortal. After what seems hours,but merely seconds, you fall to the ground. The [I] begins to spread all over your head, covering your body compleatly in a near impossible to break barrier of strange metal. You slowly rise from the ground with a new sense of purpose, one purpose, to kill all living beings. You feel no pain anymore, only numbness, and the cold whisper of doom in your ear, forever urging you to kill.<br>"
					src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					I.icon_state = "Corruption7"
					I.EquipState = I.icon_state
					src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
					I.Defence += 5
					I.Dura += 50
					if(src.WHead)
						var/obj/Q = src.WHead
						src.Weight -= Q.Weight
						del(Q)
					src.WHead = I
					src.Pain += 50
					src.icon = 'corrupted.dmi'
					I.Weight += 2
					src.Weight += 2
					return
				if(I.icon_state == "Corruption5")
					src << "<font color = red>Your mind explodes with images of death, slaughter, blood shed and decay. You hear whispers in your head, telling you to kill every being you see. Your entire body begins to pulse with energy as the [I] begins to spread, it wont be long now before it compleatly consumes your body and soul. You fall to the floor once more as the [I] fuses to your neck!<br>"
					src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					I.icon_state = "Corruption6"
					I.EquipState = I.icon_state
					src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
					I.Defence += 5
					I.Dura += 50
					src.Pain += 50
					I.Weight += 2
					src.Weight += 2
				if(I.icon_state == "Corruption4")
					src << "<font color = red>Your legs go compleatly dead as a numb feeling creeps down them, suddenly a massive bolt of pain expands all across your body as the [I] begins to spread down onto your legs. You fall flat on your face un-able to move as images of doom fill your mind and whisper for you to.....Kill...<br>"
					src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					I.icon_state = "Corruption5"
					I.EquipState = I.icon_state
					src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
					I.Defence += 5
					I.Dura += 50
					src.Pain += 50
					if(src.WLegs)
						var/obj/Q = src.WLegs
						src.Weight -= Q.Weight
						del(Q)
					if(src.WLeftFoot)
						var/obj/Q = src.WLeftFoot
						src.Weight -= Q.Weight
						del(Q)
					if(src.WRightFoot)
						var/obj/Q = src.WRightFoot
						src.Weight -= Q.Weight
						del(Q)
					src.WLegs = I
					src.WLeftFoot = I
					src.WRightFoot = I
					I.Weight += 10
					src.Weight += 10
				if(I.icon_state == "Corruption3")
					src << "<font color = red>Images of death, rage and destruction fill your mind as the [I] begins to expand even further over your chest. You roll on the ground in pain as it begins to fuse to your body!<br>"
					src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					I.icon_state = "Corruption4"
					I.EquipState = I.icon_state
					src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
					I.Defence += 5
					I.Dura += 25
					src.Pain += 50
					if(src.WLeftHand)
						var/obj/Q = src.WLeftHand
						src.Weight -= Q.Weight
						del(Q)
					src.WLeftHand = I
					I.Weight += 5
					src.Weight += 5
				if(I.icon_state == "Corruption2")
					src << "<font color = red>You fall to the ground with a loud thud as your body fills with agony, the [I] begins to spread onto your torso, you scream with rage as it begins to bind its self to your chest!<br>"
					src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					I.icon_state = "Corruption3"
					I.EquipState = I.icon_state
					src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
					I.Defence += 5
					I.Dura += 25
					src.Pain += 50
					if(src.WShoulders)
						var/obj/Q = src.WShoulders
						src.Weight -= Q.Weight
						del(Q)
					if(src.WChest)
						var/obj/Q = src.WChest
						src.Weight -= Q.Weight
						del(Q)
					if(src.WUpperBody)
						var/obj/Q = src.WUpperBody
						src.Weight -= Q.Weight
						del(Q)
					src.WShoulders = I
					src.WChest = I
					src.WUpperBody = I
					I.Weight += 10
					src.Weight += 10
				if(I.icon_state == "Corruption1")
					src << "<font color = red>You feel a very sharp pain shoot up your arm as the [I] begins to spread further, you fall to the floor in agony as it begins to fuse to your body even more!<br>"
					src.overlays-=image(I.icon,I.icon_state,I.ItemLayer)
					I.icon_state = "Corruption2"
					I.EquipState = I.icon_state
					I.Defence += 5
					I.Dura += 25
					I.name = "Armour of Corruption"
					I.Weight += 5
					src.Weight += 5
					src.overlays+=image(I.icon,I.icon_state,I.ItemLayer)
					src.Pain += 50
			else
				return
		src.Corruption()

/mob/proc/CheckAfflictions()
	for(var/A in src.Afflictions)
		if(A == "Undead Bite")
			src.UndeadBite()
		if(A == "Ill")
			var/Illness = 0
			if(src.CanEatRawMeats == 0)
				Illness = 35
			if(src.CanEatRawMeats == 1)
				Illness = 20
			if(src.CanEatRawMeats == 2)
				Illness = 0
			src.Illness(Illness)

