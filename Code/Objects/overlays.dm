/obj/Misc/CombatOverlays
	icon = 'fx.dmi'
	pixel_y = 32

/obj/Misc/CombatOverlays/Hit
	icon_state = "Hit"
	layer = 8

/obj/Misc/CombatOverlays/Block
	icon_state = "Block"
	layer = 8

/obj/Misc/CombatOverlays/Dodge
	icon_state = "Dodge"
	layer = 8

/obj/Misc/CombatOverlays/Head
	icon_state = "Head"
	layer = 8

/obj/Misc/CombatOverlays/Torso
	icon_state = "Torso"
	layer = 8

/obj/Misc/CombatOverlays/LeftLeg
	icon_state = "L Leg"
	layer = 8

/obj/Misc/CombatOverlays/RightLeg
	icon_state = "R Leg"
	layer = 8

/obj/Misc/CombatOverlays/RightArm
	icon_state = "R Arm"
	layer = 8

/obj/Misc/CombatOverlays/LeftArm
	icon_state = "L Arm"
	layer = 8

/obj/Misc/Target
	icon = 'Target.dmi'
	pixel_y = 32
	layer = 10

/obj/Misc/Target
	icon = 'target.dmi'
	layer = 10

/obj/Misc/Swim
	icon = 'terrain.dmi'
	icon_state = "swim"
	layer = 10

/obj/Misc/Bubbles
	icon = 'terrain.dmi'
	icon_state = "bubbles"
	layer = 10
	pixel_y = 32

/obj/Misc/Fire
	icon = 'fx.dmi'
	icon_state = "burning"
	layer = 5

/obj/Misc/FireLarge
	icon = 'fx.dmi'
	icon_state = "fire"
	layer = 4

/obj/Misc/LiquidSplatter
	icon = 'ingredients.dmi'
	icon_state = "liquid splatter"
	layer = 4

/obj/Misc/LiquidSplatter/New()
	spawn(3000)
		if(src)
			del(src)

/obj/Misc/Sleeping
	icon = 'misc.dmi'
	icon_state = "sleep"
	layer = 5

/obj/Misc/Smoke
	icon = 'fx.dmi'
	icon_state = "smoke"
	layer = 7

/obj/Misc/Smoke/New()
	src.dir = NORTH
	MoveRand()
	spawn(30)
		if(src)
			del(src)
