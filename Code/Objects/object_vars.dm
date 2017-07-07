/obj/
	var/BodysKey = null

	var/EquipState = null
	var/CarryState = null
	var/ItemLayer = 0

	var/ObjectType = null
	var/ObjectTag = null

	var/OpenState = null
	var/ClosedState = null

	var/Locked = 0
	var/KeyCode = null

	var/CantRaces = null
	var/Heals = null

	var/tmp/GoesTo = null

	var/Value = 0

	var/CraftPotential = 0

	var/Skinned = 0
	var/Butchered = 0

	var/CookedState = null //Icon state of the meat when cooked
	var/CookingFood = 0 // 1 means it needs to be cook, and 2 means it is cooked.

	var/Delete = 0 //Add this to items that should delete when the person holding them dies.

	var/TwoHander = 0 //Weapons that can used two hands to do damage with.

	var/SpeakPercent = 0 //How well you can speak that Language
	var/WritePercent = 0 //How well you can write that Language

	var/Standing = 0 //The standing that a players Contact object has, in ref to an NPC.

	var/WeaponDamageMax = 0
	var/WeaponDamageMin = 0

	//Spells
	var/WrittenIn = null
	var/Comprehensible = 0
	var/SpellWords = null
	var/MagicUsed = null
	var/SpellEffect = null

	var/BookContents = list()

	var/Red = 0
	var/Green = 0
	var/Blue = 0
	var/tmp/PreviousPages = list()
	var/tmp/FuturePages = list()
	//End of Spells