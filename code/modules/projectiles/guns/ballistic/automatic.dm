/obj/item/gun/ballistic/automatic
	w_class = WEIGHT_CLASS_NORMAL
	can_suppress = TRUE
	burst_size = 3
	fire_delay = 2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	semi_auto = TRUE
	fire_sound = 'sound/weapons/gun/smg/shot.ogg'
	fire_sound_volume = 90
	rack_sound = 'sound/weapons/gun/smg/smgrack.ogg'
	suppressed_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	var/select = 1 ///fire selector position. 1 = semi, 2 = burst. anything past that can vary between guns.
	var/selector_switch_icon = FALSE ///if it has an icon for a selector switch indicating current firemode.
	gun_flags = GUN_SMOKE_PARTICLES

/obj/item/gun/ballistic/automatic/update_overlays()
	. = ..()
	if(!selector_switch_icon)
		return

	switch(select)
		if(0)
			. += "[initial(icon_state)]_semi"
		if(1)
			. += "[initial(icon_state)]_burst"

/obj/item/gun/ballistic/automatic/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_firemode))
		burst_select()
	else
		..()

/obj/item/gun/ballistic/automatic/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		burst_size = 1
		fire_delay = 0
		balloon_alert(user, "switched to semi-automatic")
	else
		burst_size = initial(burst_size)
		fire_delay = initial(fire_delay)
		balloon_alert(user, "switched to [burst_size]-round burst")

	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_appearance()
	update_item_action_buttons()

/obj/item/gun/ballistic/automatic/proto
	name = "\improper Nanotrasen Saber SMG"
	desc = "A prototype full-auto 9mm submachine gun, designated 'SABR'. Has a threaded barrel for suppressors."
	icon_state = "saber"
	burst_size = 1
	actions_types = list()
	mag_display = TRUE
	empty_indicator = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/smgm9mm
	pin = null
	bolt_type = BOLT_TYPE_LOCKING
	show_bolt_icon = FALSE

/obj/item/gun/ballistic/automatic/proto/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/ballistic/automatic/proto/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r
	name = "\improper C-20r SMG"
	desc = "A bullpup three-round burst .45 SMG, designated 'C-20r'. Has a 'Scarborough Arms - Per falcis, per pravitas' buttstamp."
	icon_state = "c20r"
	inhand_icon_state = "c20r"
	selector_switch_icon = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/smgm45
	fire_delay = 2
	burst_size = 3
	pin = /obj/item/firing_pin/implant/pindicate
	can_bayonet = TRUE
	knife_x_offset = 26
	knife_y_offset = 12
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE

/obj/item/gun/ballistic/automatic/c20r/update_overlays()
	. = ..()
	if(!chambered && empty_indicator) //this is duplicated due to a layering issue with the select fire icon.
		. += "[icon_state]_empty"

/obj/item/gun/ballistic/automatic/c20r/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r/Initialize(mapload)
	. = ..()
	update_appearance()

/obj/item/gun/ballistic/automatic/wt550
	name = "\improper WT-550 Autorifle"
	desc = "Recalled by Nanotrasen due to public backlash around heat distribution resulting in unintended discombobulation. \
		This outcry was fabricated through various Syndicate-backed misinformation operations to force Nanotrasen to abandon \
		its ballistics weapon program, cornering them into the energy weapons market. Most often found today in the hands of pirates, \
		underfunded security personnel, cargo technicians, theoritical physicists and gang bangers out on the rim. \
		Light-weight and fully automatic. Uses 4.6x30mm rounds."
	icon_state = "wt550"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = "arg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/wt550m9
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()
	can_bayonet = TRUE
	knife_x_offset = 25
	knife_y_offset = 12
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE

/obj/item/gun/ballistic/automatic/wt550/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.3 SECONDS)

/obj/item/gun/ballistic/automatic/plastikov
	name = "\improper PP-95 SMG"
	desc = "An ancient 9mm submachine gun pattern updated and simplified to lower costs, though perhaps simplified too much."
	icon_state = "plastikov"
	inhand_icon_state = "plastikov"
	accepted_magazine_type = /obj/item/ammo_box/magazine/plastikov9mm
	burst_size = 5
	spread = 25
	can_suppress = FALSE
	actions_types = list()
	projectile_damage_multiplier = 0.35 //It's like 10.5 damage per bullet, it's close enough to 10 shots
	mag_display = TRUE
	empty_indicator = TRUE
	special_mags = TRUE
	fire_sound = 'sound/weapons/gun/smg/shot_alt.ogg'

/obj/item/gun/ballistic/automatic/plastikov/refurbished //forgive me lord for i have sinned
	name = "\improper PP-96 SMG"
	desc = "An ancient 9mm submachine gun pattern updated and simplified to lower costs. This one has been refurbished for better performance."
	spread = 10
	burst_size = 3
	icon_state = "plastikov_refurbished"
	inhand_icon_state = "plastikov_refurbished"
	accepted_magazine_type = /obj/item/ammo_box/magazine/plastikov9mm
	spawn_magazine_type = /obj/item/ammo_box/magazine/plastikov9mm/red
	projectile_damage_multiplier = 0.5 //15 damage
	can_suppress = TRUE
	suppressor_x_offset = 4
	pin = /obj/item/firing_pin/implant/pindicate

/obj/item/gun/ballistic/automatic/plastikov/refurbished/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/rostokov
	name = "\improper Rostokov carbine"
	desc = "A bullpup fully automatic 9mm carbine. Has a 'Scarborough Arms - Per falcis, per pravitas' buttstamp."
	icon_state = "rostokov"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = "rostokov"
	accepted_magazine_type = /obj/item/ammo_box/magazine/rostokov9mm
	projectile_damage_multiplier = 0.66 //20 damage
	fire_delay = 1
	spread = 5
	can_suppress = FALSE
	burst_size = 1
	slot_flags = null
	worn_icon_state = "rostokov"
	actions_types = list()
	pin = /obj/item/firing_pin/implant/pindicate
	mag_display = TRUE
	empty_indicator = TRUE
	fire_sound = 'monkestation/code/modules/blueshift/sounds/smg_heavy.ogg'

/obj/item/gun/ballistic/automatic/rostokov/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/ballistic/automatic/rostokov/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/mini_uzi
	name = "\improper Type U3 Uzi"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon_state = "miniuzi"
	accepted_magazine_type = /obj/item/ammo_box/magazine/uzim9mm
	burst_size = 2
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	mag_display = TRUE
	rack_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'

/obj/item/gun/ballistic/automatic/m90
	name = "\improper M-90gl Carbine"
	desc = "A three-round burst 5.56 toploading carbine, designated 'M-90gl'. Has an attached underbarrel grenade launcher." //monkestation edit: reverted back from .223 to original 556 as ported from nova
	desc_controls = "Right-click to use grenade launcher."
	icon_state = "m90"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = "m90"
	selector_switch_icon = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/m556 //monkestation edit: reverted back from .223 to original 556 as ported from nova
	can_suppress = FALSE
	var/obj/item/gun/ballistic/revolver/grenadelauncher/underbarrel
	burst_size = 3
	fire_delay = 2
	spread = 5
	pin = /obj/item/firing_pin/implant/pindicate
	mag_display = TRUE
	empty_indicator = TRUE
	fire_sound = 'sound/weapons/gun/smg/shot_alt.ogg'

/obj/item/gun/ballistic/automatic/m90/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/m90/Destroy()
	QDEL_NULL(underbarrel)
	return ..()

/obj/item/gun/ballistic/automatic/m90/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m90/unrestricted/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/unrestricted(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/m90/afterattack_secondary(atom/target, mob/living/user, flag, params)
	underbarrel.afterattack(target, user, flag, params)
	return SECONDARY_ATTACK_CONTINUE_CHAIN

/obj/item/gun/ballistic/automatic/m90/attackby(obj/item/A, mob/user, params)
	if(isammocasing(A))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self(user)
			underbarrel.attackby(A, user, params)
	else
		..()

/obj/item/gun/ballistic/automatic/m90/update_overlays()
	. = ..()
	switch(select)
		if(0)
			. += "[initial(icon_state)]_semi"
		if(1)
			. += "[initial(icon_state)]_burst"

/obj/item/gun/ballistic/automatic/tommygun
	name = "\improper Thompson SMG"
	desc = "Based on the classic 'Chicago Typewriter'."
	icon_state = "tommygun"
	inhand_icon_state = "shotgun"
	selector_switch_icon = TRUE
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = 0
	accepted_magazine_type = /obj/item/ammo_box/magazine/tommygunm45
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()
	fire_delay = 1
	bolt_type = BOLT_TYPE_OPEN
	empty_indicator = TRUE
	show_bolt_icon = FALSE

/obj/item/gun/ballistic/automatic/tommygun/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)

/obj/item/gun/ballistic/automatic/ar
	name = "\improper NT-ARG 'Boarder'"
	desc = "A robust assault rifle used by Nanotrasen fighting forces."
	icon_state = "arg"
	inhand_icon_state = "arg"
	slot_flags = 0
	accepted_magazine_type = /obj/item/ammo_box/magazine/m556
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1

// L6 SAW //

/obj/item/gun/ballistic/automatic/l6_saw
	name = "\improper L6 SAW"
	desc = "A heavily modified 7.12x82mm light machine gun, designated 'L6 SAW'. Has 'Aussec Armoury - 2531' engraved on the receiver below the designation."
	icon_state = "l6"
	inhand_icon_state = "l6closedmag"
	base_icon_state = "l6"
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = 0
	accepted_magazine_type = /obj/item/ammo_box/magazine/mm712x82
	weapon_weight = WEAPON_HEAVY
	burst_size = 1
	actions_types = list()
	can_suppress = FALSE
	spread = 7
	pin = /obj/item/firing_pin/implant/pindicate
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	mag_display = TRUE
	mag_display_ammo = TRUE
	tac_reloads = FALSE
	fire_sound = 'sound/weapons/gun/l6/shot.ogg'
	rack_sound = 'sound/weapons/gun/l6/l6_rack.ogg'
	suppressed_sound = 'sound/weapons/gun/general/heavy_shot_suppressed.ogg'
	var/cover_open = FALSE

/obj/item/gun/ballistic/automatic/l6_saw/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/l6_saw/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/ballistic/automatic/l6_saw/examine(mob/user)
	. = ..()
	. += "<b>alt + click</b> to [cover_open ? "close" : "open"] the dust cover."
	if(cover_open && magazine)
		. += span_notice("It seems like you could use an <b>empty hand</b> to remove the magazine.")


/obj/item/gun/ballistic/automatic/l6_saw/AltClick(mob/user)
	if(!user.can_perform_action(src))
		return
	cover_open = !cover_open
	balloon_alert(user, "cover [cover_open ? "opened" : "closed"]")
	playsound(src, 'sound/weapons/gun/l6/l6_door.ogg', 60, TRUE)
	update_appearance()

/obj/item/gun/ballistic/automatic/l6_saw/update_icon_state()
	. = ..()
	inhand_icon_state = "[base_icon_state][cover_open ? "open" : "closed"][magazine ? "mag":"nomag"]"

/obj/item/gun/ballistic/automatic/l6_saw/update_overlays()
	. = ..()
	. += "l6_door_[cover_open ? "open" : "closed"]"


/obj/item/gun/ballistic/automatic/l6_saw/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params)
	. |= AFTERATTACK_PROCESSED_ITEM

	if(cover_open)
		balloon_alert(user, "close the cover!")
		return
	else
		. |= ..()
		update_appearance()

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/gun/ballistic/automatic/l6_saw/attack_hand(mob/user, list/modifiers)
	if (loc != user)
		..()
		return
	if (!cover_open)
		balloon_alert(user, "open the cover!")
		return
	..()

/obj/item/gun/ballistic/automatic/l6_saw/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, accepted_magazine_type))
		balloon_alert(user, "open the cover!")
		return
	..()

// Old Semi-Auto Rifle //

/obj/item/gun/ballistic/automatic/surplus
	name = "Surplus Rifle"
	desc = "One of countless obsolete ballistic rifles that still sees use as a cheap deterrent. Uses 10mm ammo and its bulky frame prevents one-hand firing."
	icon_state = "surplus"
	inhand_icon_state = "moistnugget"
	worn_icon_state = null
	weapon_weight = WEAPON_HEAVY
	accepted_magazine_type = /obj/item/ammo_box/magazine/m10mm/rifle
	fire_delay = 30
	burst_size = 1
	can_unsuppress = TRUE
	can_suppress = TRUE
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	mag_display = TRUE

// Laser rifle (rechargeable magazine) //

/obj/item/gun/ballistic/automatic/laser
	name = "laser rifle"
	desc = "Though sometimes mocked for the relatively weak firepower of their energy weapons, the logistic miracle of rechargeable ammunition has given Nanotrasen a decisive edge over many a foe."
	icon_state = "oldrifle"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = "arg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/recharge
	empty_indicator = TRUE
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 0
	actions_types = list()
	fire_sound = 'monkestation/sound/weapons/gun/energy/Laser1.ogg'
	casing_ejector = FALSE

/obj/item/gun/ballistic/automatic/minigun22
	name = "\improper Miniaturized Minigun"
	desc = "A Miniaturized Multibarrel rotary gun that fires .22 LR \"peashooter\" ammunition"
	icon = 'icons/obj/weapons/guns/minigun.dmi'
	icon_state = "minigun_spin"
	inhand_icon_state = "minigun"
	slowdown = 0.4
	fire_sound = 'sound/weapons/gun/minigun10burst.ogg'
	fire_sound_volume = 50
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	accepted_magazine_type = /obj/item/ammo_box/magazine/minigun22
	fire_delay = 0.5
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()
	item_flags = SLOWS_WHILE_IN_HAND
	recoil = 1.2
	spread = 20

/obj/item/gun/ballistic/automatic/minigun22/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)

/**
 * Weak uzi for syndicate chimps. It comes in a 4 TC kit.
 * Roughly 9 damage per bullet every 0.2 seconds, equaling out to downing an opponent in a bit over a second, if they have no armor.
 */
/obj/item/gun/ballistic/automatic/mini_uzi/chimpgun
	name = "\improper MONK-10"
	desc = "Developed by Syndicate monkeys, for syndicate Monkeys. Despite the name, this weapon resembles an Uzi significantly more than a MAC-10. Uses 9mm rounds. There's a label on the other side of the gun that says \"Do what comes natural.\""
	projectile_damage_multiplier = 0.4
	projectile_wound_bonus = -25
	pin = /obj/item/firing_pin/monkey

/**
 * Weak tommygun for syndicate chimps. It comes in a 4 TC kit.
 * Roughly 9 damage per bullet every 0.2 seconds, equaling out to downing an opponent in a bit over a second, if they have no armor.
 */
/obj/item/gun/ballistic/automatic/tommygun/chimpgun
	name = "\improper Typewriter"
	desc = "It was the best of times, it was the BLURST of times!? You stupid monkeys!"
	projectile_damage_multiplier = 0.4
	projectile_wound_bonus = -25
	pin = /obj/item/firing_pin/monkey


//Proto Kinetic SMG, used by miners as part of what ill call "Gun Mining"
//Not actually a PKA, but styled to be like one

/obj/item/gun/ballistic/automatic/proto/pksmg
	name = "proto-kinetic 'Rapier' smg"
	desc = "Using partial ballistic technology and kinetic acceleration, the Mining Research department has managed to make the kinetic accelerator full auto. \
	While the technology is promising, it is held back by certain factors, specifically limited ammo and no mod capacity, but that shouldn't be an issue with its performance."
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "pksmg"
	burst_size = 2
	actions_types = list()
	mag_display = TRUE
	empty_indicator = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/pksmgmag
	pin = /obj/item/firing_pin/wastes
	bolt_type = BOLT_TYPE_LOCKING
	show_bolt_icon = FALSE
	fire_sound = 'sound/weapons/kenetic_accel.ogg'

//FLASHLIGHTTTTTT
/obj/item/gun/ballistic/automatic/proto/pksmg/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 15, \
		overlay_y = 16)

//Magazine for SMG and the box the mags come in
/obj/item/ammo_box/magazine/pksmgmag
	name = "proto-kinetic magazine"
	desc = "A single magazine for the 'Rapier' SMG."
	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "pksmgmag"
	base_icon_state = "pksmgmag"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/energy/kinetic/smg
	caliber = ENERGY
	max_ammo = 45

/obj/item/storage/box/kinetic
	name = "box of kinetic SMG magazines"
	desc = "A box full of kinetic projectile magazines, specifically for the 'Rapier' SMG.\
	It is specially designed to only hold proto-kinetic magazines, and also fit inside of explorer webbing."
	icon_state = "rubbershot_box"
	illustration = "rubbershot_box"

/obj/item/storage/box/kinetic/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 7
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 20
	atom_storage.set_holdable(list(
		/obj/item/ammo_box/magazine/pksmgmag,
	))

/obj/item/storage/box/kinetic/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_box/magazine/pksmgmag(src)


/obj/item/storage/box/pksmg //A case that the SMG comes in on purchase, containing three magazines
	name = "'Rapier' SMG Case"
	desc = "A case containing a 'Rapier' SMG and three magazines. Designed for full auto but has limited ammo."
	icon_state = "miner_case"
	icon = 'icons/obj/storage/case.dmi'
	drop_sound = 'sound/items/handling/toolbox_drop.ogg'
	pickup_sound = 'sound/items/handling/toolbox_pickup.ogg'
	illustration = ""

/obj/item/storage/box/pksmg/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 4
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 4

/obj/item/storage/box/pksmg/PopulateContents()
		new /obj/item/gun/ballistic/automatic/proto/pksmg(src)
		new /obj/item/ammo_box/magazine/pksmgmag(src)
		new /obj/item/ammo_box/magazine/pksmgmag(src)
		new /obj/item/ammo_box/magazine/pksmgmag(src)

/obj/item/ammo_casing/energy/kinetic/smg
	projectile_type = /obj/projectile/kinetic/smg
	select_name = "kinetic"
	e_cost = 0
	fire_sound = 'sound/weapons/kenetic_accel.ogg'

/obj/projectile/kinetic/smg
	name = "kinetic projectile"
	damage = 10
	range = 7
	icon_state = "bullet"
	Skillbasedweapon = FALSE

// Proto Kinetic Auto Shotgun... yep

#define KINETIC_20G "20 Gauge kinetic shell"

/obj/item/gun/ballistic/automatic/proto/pksmg/autoshotgun
	name = "20. Gauge Kinetic 'Fenrir' Auto Shotgun"
	desc = "A fully automatic shotgun created using some spare polymer parts, procured from a undisclosed source. \
	With some Proto Kinetic Acceleration tech mixed in, the 'Fenrir' becomes a lethal auto shotgun chambered in \
	20. Gauge shells, for sweeping up any unwanted fauna from a hostile environment."
	icon = 'icons/obj/weapons/guns/wide_guns.dmi'
	inhand_icon_state = "protokshotgunauto"
	worn_icon_state = "protokshotgunauto"
	icon_state = "protokshotgunauto"
	slot_flags = ITEM_SLOT_BACK
	burst_size = 1
	fire_delay = 0
	base_pixel_x = -2
	pixel_x = -2
	actions_types = list()
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_display = TRUE
	empty_indicator = FALSE
	accepted_magazine_type = /obj/item/ammo_box/magazine/autoshotgun
	pin = /obj/item/firing_pin/wastes
	bolt_type = BOLT_TYPE_STANDARD
	show_bolt_icon = FALSE
	fire_sound = 'sound/weapons/gun/sniper/shot.ogg'

//Magazine for SMG and the box the mags come in
/obj/item/ammo_box/magazine/autoshotgun
	name = "20 Gauge Shotgun Magazine"
	desc = "A single magazine capable of holding 12 rounds of 20 gauge kinetic hydra shells."
	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "proto20gmag"
	base_icon_state = "proto20gmag"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/shotgun/hydrakinetic
	caliber = KINETIC_20G
	max_ammo = 12

/obj/item/ammo_casing/shotgun/hydrakinetic
	name = "Kinetic Hydra Shell"
	desc = "A 20 gauge shell loaded with five pellets, dubbed the Kinetic Hydra Shell! <b> Does NOT fit in any standard shotgun! </b>"
	icon_state = "20gshell"
	icon = 'icons/obj/weapons/guns/ammo.dmi'
	caliber = KINETIC_20G
	pellets = 5
	variance = 7 //very tight spread
	projectile_type = /obj/projectile/bullet/hydrakinetic

/obj/projectile/bullet/hydrakinetic
	name = "Kinetic Hydra Sabot"
	icon_state = "bullet"
	damage = 13
	armour_penetration = -15

/obj/projectile/bullet/hydrakinetic/on_hit(atom/target, Firer, blocked = 0, pierce_hit) //its not meant to tear through walls like a plasma cutter, but will still at least bust down a wall if it hits one.
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer, FALSE)
	. = ..()

/obj/item/storage/box/kinetic/autoshotgun/bigcase //box containing the actual gun and a few spare mags for sale
	name = "'Fenrir' Shotgun case"
	desc = "A mining gun case containing a 20. gauge Fenrir automatic shotgun and three spare magazines."
	icon = 'icons/obj/storage/case.dmi'
	drop_sound = 'sound/items/handling/toolbox_drop.ogg'
	pickup_sound = 'sound/items/handling/toolbox_pickup.ogg'
	icon_state = "miner_case"
	illustration = ""
	foldable_result = /obj/item/stack/sheet/iron

/obj/item/storage/box/kinetic/autoshotgun/bigcase/Initialize(mapload) //initialize
	. = ..()
	atom_storage.max_slots = 4
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 4
	atom_storage.set_holdable(list())

/obj/item/storage/box/kinetic/autoshotgun/bigcase/PopulateContents() //populate

		new /obj/item/gun/ballistic/automatic/proto/pksmg/autoshotgun (src)
		new /obj/item/ammo_box/magazine/autoshotgun (src)
		new /obj/item/ammo_box/magazine/autoshotgun (src)
		new /obj/item/ammo_box/magazine/autoshotgun (src)

/obj/item/storage/box/kinetic/autoshotgun //box containing 45 spare shells for the fenrir, used to reload spare mags. cheaper to buy than new spare mags.
	name = "20. Gauge Hydra Shell Box"
	desc = "A surprisingly hefty box containing 45 spare 10. gauge Hydra shells, for reloading spare Fenrir magazines. Despite its heft, it fits in explorer webbing."
	icon_state = "smallshell_box"
	illustration = ""

/obj/item/storage/box/kinetic/autoshotgun/Initialize(mapload) //initialize
	. = ..()
	atom_storage.max_slots = 45
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 45
	atom_storage.set_holdable(list(/obj/item/ammo_casing/shotgun/hydrakinetic))

/obj/item/storage/box/kinetic/autoshotgun/PopulateContents() //populate
	for(var/i in 1 to 45)
		new /obj/item/ammo_casing/shotgun/hydrakinetic (src)

/obj/item/storage/box/kinetic/autoshotgun/smallcase //box containing 3 spare mags for the fenrir auto shotgun
	name = "Spare Fenrir Shotgun Magazine Case"
	desc = "A small gun case that contains three spare magazines for the Fenrir auto shotgun. It fits in explorer webbing too."
	icon = 'icons/obj/storage/case.dmi'
	drop_sound = 'sound/items/handling/toolbox_drop.ogg'
	pickup_sound = 'sound/items/handling/toolbox_pickup.ogg'
	icon_state = "miner_case_small"
	illustration = ""
	foldable_result = /obj/item/stack/sheet/iron

/obj/item/storage/box/kinetic/autoshotgun/smallcase/Initialize(mapload) //initialize
	. = ..()
	atom_storage.max_slots = 3
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 3
	atom_storage.set_holdable(list())

/obj/item/storage/box/kinetic/autoshotgun/smallcase/PopulateContents() //populate
		new /obj/item/ammo_box/magazine/autoshotgun (src)
		new /obj/item/ammo_box/magazine/autoshotgun (src)
		new /obj/item/ammo_box/magazine/autoshotgun (src)

// KINETIC L6 SAW (LMG dubbed the 'Hellhound')

#define CALIBER_A762_KINETIC "7.65 Kinetic" //the ammo type (so it doesnt fit anywhere else)

/obj/item/gun/ballistic/automatic/proto/pksmg/kineticlmg
	name = "Kinetic 'Hellhound' LMG"
	desc = "Using parts from confiscated weapons, the Mining Research team has thrown together \
	A beast of a weapon. Using Proto Kinetic Acceleration technology as per usual, the 'Hellhound' \
	is a LMG chambered in kinetic 7.62 with a incredibly high fire rate, for when you need a beast \
	to kill a beast. Has a fixed unremovable 150 round magazine with a special loading port on the outside, forcing you to \
	top off and reload using stripper clips."
	icon = 'icons/obj/weapons/guns/wide_guns.dmi'
	icon_state = "kineticlmg"
	inhand_icon_state = "kineticlmg"
	base_icon_state = "kineticlmg"
	worn_icon_state = "kineticlmg"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	burst_size = 3
	mag_display = FALSE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/kineticlmg
	weapon_weight = WEAPON_HEAVY
	internal_magazine = TRUE
	spread = 3
	fire_delay = 1
	pin = /obj/item/firing_pin/wastes
	fire_sound = 'sound/weapons/gun/hmg/hmg.ogg'

/obj/item/ammo_box/magazine/internal/kineticlmg
	name = "Internal LMG magazine"
	desc = "uhm... uhg... erm... the magazine fell off... (REPORT ME)"
	ammo_type = /obj/item/ammo_casing/a762/kinetic
	caliber = CALIBER_A762_KINETIC
	max_ammo = 150
	multiload = TRUE

/obj/item/ammo_casing/a762/kinetic
	name = "Kinetic 7.62 bullet casing"
	desc = "A kinetic 7.62 bullet casing for use in the 'Hellhound' LMG."
	icon_state = "762kinetic-casing"
	caliber = CALIBER_A762_KINETIC
	projectile_type = /obj/projectile/bullet/a762/kinetic

/obj/projectile/bullet/a762/kinetic
	name = "kinetic 7.62 projectile"
	damage = 15 //somehow does less damage than the SMG, uh... dont ask why?
	armour_ignorance = 0
	icon_state = "gaussweak"

/obj/projectile/bullet/a762/kinetic/on_hit(atom/target, Firer, blocked = 0, pierce_hit) //its not meant to tear through walls like a plasma cutter, but will still at least bust down a wall if it hits one.
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer, FALSE)
	. = ..()

/obj/item/ammo_box/a762/kinetic
	name = "stripper clip (Kinetic 7.62mm)"
	desc = "A stripper clip with Kinetic 7.62mm rounds."
	icon_state = "762kinetic"
	ammo_type = /obj/item/ammo_casing/a762/kinetic
	caliber = CALIBER_A762_KINETIC

/obj/item/storage/box/kinetic/kineticlmg //box of stripper clips (20, totalling 100 rounds)
	name = "box of kinetic 7.62mm stripper clips"
	desc = "A box that contains up to 20 stripper clips of Kinetic 7.62mm, for refilling the 'Hellhound' LMG. Surprisingly fits inside of explorer webbings."
	icon_state = "kinetic762_box"
	illustration = ""

/obj/item/storage/box/kinetic/kineticlmg/Initialize(mapload) //initialize
	. = ..()
	atom_storage.max_slots = 20
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 100
	atom_storage.set_holdable(list(
		/obj/item/ammo_box/a762/kinetic,
	))

/obj/item/storage/box/kinetic/kineticlmg/PopulateContents() //populate
	for(var/i in 1 to 20)
		new /obj/item/ammo_box/a762/kinetic(src)

/obj/item/ammo_box/a762/kinetic/big
	name = "rapid reloader (Kinetic 7.62mm)"
	desc = "A hefty reloader for 'Hellhound' LMG that can load up to fifty rounds at once, and even be refilled. Might be better to hang onto this once its empty.."
	icon_state = "a762"
	max_ammo = 50
	ammo_type = /obj/item/ammo_casing/a762/kinetic
	multiple_sprites = AMMO_BOX_ONE_SPRITE

/obj/item/storage/box/kinetic/kineticlmg/smallcase //hilarious its called small case when it holds the larger option
	name = "Case of 'Hellhound' Rapid Reloaders"
	desc = "A case containing three rapid reloaders for the 'Hellhound' LMG. For when you really just dont have time."
	w_class = WEIGHT_CLASS_NORMAL
	icon = 'icons/obj/storage/case.dmi'
	drop_sound = 'sound/items/handling/toolbox_drop.ogg'
	pickup_sound = 'sound/items/handling/toolbox_pickup.ogg'
	icon_state = "miner_case_small"
	illustration = ""
	foldable_result = /obj/item/stack/sheet/iron

/obj/item/storage/box/kinetic/kineticlmg/smallcase/Initialize(mapload) //initialize
	. = ..()
	atom_storage.max_slots = 3
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 3
	atom_storage.set_holdable(list(/obj/item/ammo_box/a762/kinetic/big))

/obj/item/storage/box/kinetic/kineticlmg/smallcase/PopulateContents() //populate

		new /obj/item/ammo_box/a762/kinetic/big (src)
		new /obj/item/ammo_box/a762/kinetic/big (src)
		new /obj/item/ammo_box/a762/kinetic/big (src)

/obj/item/storage/box/kinetic/kineticlmg/bigcase //box containing the LMG and a box of extra bullets to get one reload
	name = "Kinetic 'Hellhound' LMG case"
	desc = "A special and totally original gun case that contains a Kinetic 'Hellhound' LMG, and a box of spare rounds to refill it."
	icon = 'icons/obj/storage/case.dmi'
	drop_sound = 'sound/items/handling/toolbox_drop.ogg'
	pickup_sound = 'sound/items/handling/toolbox_pickup.ogg'
	w_class = WEIGHT_CLASS_BULKY
	icon_state = "miner_case"
	illustration = ""
	foldable_result = /obj/item/stack/sheet/iron

/obj/item/storage/box/kinetic/kineticlmg/bigcase/Initialize(mapload) //initialize
	. = ..()
	atom_storage.max_slots = 2
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 2
	atom_storage.set_holdable(list())

/obj/item/storage/box/kinetic/kineticlmg/bigcase/PopulateContents() //populate

		new /obj/item/gun/ballistic/automatic/proto/pksmg/kineticlmg (src)
		new /obj/item/storage/box/kinetic/kineticlmg (src)
