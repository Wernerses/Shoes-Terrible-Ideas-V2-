/mob/living/basic/chicken/silkie
	icon_suffix = "silkie"
	worn_slot_flags = null

	breed_name = "Selkie"
	egg_type = /obj/item/food/egg/silkie
	mutation_list = list(/datum/ranching_mutation/chicken/pigeon, /datum/ranching_mutation/chicken/cotton_candy)

	book_desc = "These behave identically to White Chickens."
/obj/item/food/egg/silkie
	name = "Selkie Egg"
	icon_state = "silkie"

	layer_hen_type = /mob/living/basic/chicken/silkie
	turf_requirements = list(/turf/open/floor/grass, /turf/open/floor/sandy_dirt)
