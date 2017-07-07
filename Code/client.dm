/client/
	macro_mode=1

/client/Southeast()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
			..()

/client/Southwest()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
		..()

/client/Northeast()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
			..()

/client/Northwest()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
			..()

/client/North()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
			..()

/client/South()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
			..()

/client/East()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
			..()

/client/West()
	if(mob.Moving)
		mob.Moving = 0
		var/Speed = mob.MoveSpeed
		if(mob.Weight >= mob.WeightMax / 1.1)
			Speed += 1
		if(mob.Weight >= mob.WeightMax / 1.2)
			Speed += 1
		if(mob.Pull)
			Speed += 1
		var/BadLeg = 0
		if(mob.RightLeg <= 50)
			BadLeg = 1
		if(mob.LeftLeg <= 50)
			BadLeg = 1
		if(BadLeg && mob.Race != "Snakeman")
			Speed += 1
		if(mob.InWater && mob.Dead == 0)
			Speed += 1
			if(mob.CanSwimWell)
				Speed -= 2
			var/MoveChance = 0
			MoveChance += mob.Strength / 4 + mob.SwimmingSkill / 4
			var/Moves = 0
			Moves = prob(MoveChance)
			if(Moves == 0)
				Speed += 2
				mob.SwimmingSkill += mob.SwimmingSkillMulti / 2
				mob.GainStats(20)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			else
				mob.SwimmingSkill += mob.SwimmingSkillMulti
				mob.GainStats(10)
				if(mob.SwimmingSkill >= 100)
					mob.SwimmingSkill = 100
			if(mob.InWater == 1)
				var/Sink = 0
				Sink += mob.Weight / 10
				for(var/obj/Items/Armour/A in mob)
					if(A.suffix == "Equip")
						Sink += A.Weight / 6
				Sink -= usr.Strength / 4
				Sink -= usr.SwimmingSkill / 4
				var/Sinks = prob(Sink)
				if(Sinks)
					view() << "<font color = yellow>[mob] sinks underwater due to what they are carrying!<br>"
					mob.loc = locate(mob.x,mob.y,3)
					mob.InWater = 2
					mob.overlays -= /obj/Misc/Swim/
					mob.overlays += /obj/Misc/Bubbles/
					mob.Breathe()
		spawn(Speed)
			if(mob)
				mob.Moving = 1
		if(mob.CanMove == 0)
			return
		else
			mob.LastLoc = mob.loc
			..()