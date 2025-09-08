/obj/item/gun/energy/laser/musket
	name = "laser musket"
	desc = "A hand-crafted laser weapon, it has a hand crank on the side to charge it up."
	icon_state = "musket"
	inhand_icon_state = "musket"
	worn_icon_state = "las_musket"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket)
	slot_flags = ITEM_SLOT_BACK
	obj_flags = UNIQUE_RENAME
	can_bayonet = TRUE
	knife_x_offset = 22
	knife_y_offset = 11
	//monke edit: fully charges per crank because it was really confusing and unintuitive
	//monke edit: increased cooldown time to compensate for increased charge

/obj/item/gun/energy/laser/musket/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = 1000, \
		cooldown_time = 3 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
		)

/obj/item/gun/energy/laser/musket/prime
	name = "heroic laser musket"
	desc = "A well-engineered, hand-charged laser weapon. Its capacitors hum with potential."
	icon_state = "musket_prime"
	inhand_icon_state = "musket_prime"
	worn_icon_state = "las_musket_prime"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket/prime)
	//monke edit: cooldown time reduced to 2 for the prime version
/obj/item/gun/energy/laser/musket/prime/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = 1000, \
		cooldown_time = 2 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
		)


/obj/item/gun/energy/laser/musket/syndicate
	name = "syndicate laser musket"
	desc = "A powerful laser(?) weapon, its 4 tetradimensional capacitors can hold 2 shots each, totaling to 8 shots. \
	Putting your hand on the control panel gives you a strange tingling feeling, this is probably how you charge it."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "musket_syndie"
	inhand_icon_state = "musket_syndie"
	lefthand_file = 'monkestation/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'monkestation/icons/mob/inhands/weapons/guns_righthand.dmi'
	worn_icon_state = "las_musket_syndie"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket/syndicate)
	w_class = WEIGHT_CLASS_NORMAL
/obj/item/gun/energy/laser/musket/syndicate/Initialize(mapload) //it takes two hand slots and costs 12 tc, they deserve fast recharging
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = 250, \
		cooldown_time = 1.5 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.3 SECONDS, \
		)

/obj/item/ammo_casing/energy/laser/musket/syndicate
	projectile_type = /obj/projectile/beam/laser/musket/syndicate
	e_cost = 125
	fire_sound = 'sound/weapons/laser2.ogg'


/obj/item/gun/energy/disabler/smoothbore
	name = "smoothbore disabler"
	desc = "A hand-crafted disabler, using a hard knock on an energy cell to fire the stunner laser. A lack of proper focusing means it has little accuracy."
	icon_state = "smoothbore"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smoothbore)
	shaded_charge = 1
	charge_sections = 1
	spread = 10 //monke edit: changed spread to 10 instead of 22.5

/obj/item/gun/energy/disabler/smoothbore/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = 1000, \
		cooldown_time = 2 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
		)

/obj/item/gun/energy/disabler/smoothbore/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 18, \
		overlay_y = 12) //i swear 1812 being the overlay numbers was accidental

/obj/item/gun/energy/disabler/smoothbore/prime //much stronger than the other prime variants, so dont just put this in as maint loot
	name = "elite smoothbore disabler"
	desc = "An enhancement version of the smoothbore disabler pistol. Improved optics and cell type result in good accuracy and the ability to fire twice. \
	The disabler bolts also don't dissipate upon impact with armor, unlike the previous model."
	icon_state = "smoothbore_prime"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smoothbore/prime)
	charge_sections = 2
	spread = 0 //could be like 5, but having just very tiny spread kinda feels like bullshit


/obj/item/gun/energy/laser/plasmacore //NTrep gun
	name = "PlasmaCore-6e"
	desc = "The PlasmaCore-6e is the newest gun in Nanotrasen's cutting edge line of laser weaponry. Featuring an experimental plasma based cell that can be mechanically recharged. Glory to Nanotrasen."
	icon = 'monkestation/icons/obj/weapons/guns/plasmacoresixe.dmi'
	icon_state = "plasma_core_six"
	charge_sections = 6
	cell_type = /obj/item/stock_parts/cell/plasmacore
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hellfire)
	can_charge = FALSE
	verb_say = "states"
	var/cranking = FALSE

/obj/item/gun/energy/laser/plasmacore/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = 100, \
		cooldown_time = 1.5 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.3 SECONDS, \
		)
	mutable_appearance(icon, "plasma_core_six_cell_backwards")
	RegisterSignal(src, COMSIG_GUN_CRANKING, PROC_REF(on_cranking))
	RegisterSignal(src, COMSIG_GUN_CRANKED, PROC_REF(on_cranked))

/obj/item/gun/energy/laser/plasmacore/proc/on_cranking(datum/source, mob/user)
	cranking = TRUE
	update_icon(UPDATE_OVERLAYS)

/obj/item/gun/energy/laser/plasmacore/proc/on_cranked(datum/source, mob/user)
	SIGNAL_HANDLER
	if(cell.charge == cell.maxcharge)
		say("Glory to Nanotrasen")
	cranking = FALSE
	update_icon(UPDATE_OVERLAYS)

/obj/item/gun/energy/laser/plasmacore/update_overlays()
	. = ..()
	. += "plasma_core_six_cell_[cranking ? "forwards" : "backwards"]"

/obj/item/stock_parts/cell/plasmacore
	name = "PlasmaCore-6e experimental cell"
	maxcharge = 600 //same as the secborg cell but i'm not reusing that here
	icon = 'icons/obj/power.dmi'
	icon_state = "icell"
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.4, /datum/material/plasma=SMALL_MATERIAL_AMOUNT)

