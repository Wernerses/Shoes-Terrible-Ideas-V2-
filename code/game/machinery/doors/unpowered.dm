/obj/machinery/door/unpowered

/obj/machinery/door/unpowered/Bumped(atom/movable/AM)
	if(src.locked)
		return
	..()
	return


/obj/machinery/door/unpowered/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	if(locked)
		return
	else
		return ..()

/obj/machinery/door/unpowered/emag_act(mob/user, obj/item/card/emag/emag_card)
	return FALSE

/obj/machinery/door/unpowered/shuttle
	icon = 'icons/turf/shuttle.dmi'
	name = "door"
	icon_state = "door1"
	opacity = TRUE
	density = TRUE
	explosion_block = 1
