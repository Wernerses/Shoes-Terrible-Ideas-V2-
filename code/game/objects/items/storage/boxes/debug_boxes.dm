/**
 * Basically the boxes that spawn in debug modsuit
 */

/obj/item/storage/box/material
	name = "box of materials"
	illustration = "implant"

/obj/item/storage/box/material/PopulateContents() //less uranium because radioactive
	// amount should be null if it should spawn with the type's default amount
	var/static/items_inside = list(
		/obj/item/stack/sheet/iron/fifty = null,
		/obj/item/stack/sheet/glass/fifty = null,
		/obj/item/stack/sheet/rglass = 50,
		/obj/item/stack/sheet/plasmaglass = 50,
		/obj/item/stack/sheet/titaniumglass = 50,
		/obj/item/stack/sheet/plastitaniumglass = 50,
		/obj/item/stack/sheet/plasteel = 50,
		/obj/item/stack/sheet/mineral/plastitanium = 50,
		/obj/item/stack/sheet/mineral/titanium = 50,
		/obj/item/stack/sheet/mineral/gold = 50,
		/obj/item/stack/sheet/mineral/silver = 50,
		/obj/item/stack/sheet/mineral/plasma = 50,
		/obj/item/stack/sheet/mineral/uranium = 20,
		/obj/item/stack/sheet/mineral/diamond = 50,
		/obj/item/stack/sheet/bluespace_crystal = 50,
		/obj/item/stack/sheet/mineral/bananium = 50,
		/obj/item/stack/sheet/mineral/wood = 50,
		/obj/item/stack/sheet/plastic/fifty = null,
		/obj/item/stack/sheet/runed_metal/fifty = null,
	)
	for(var/obj/item/stack/stack_type as anything in items_inside)
		var/amt = items_inside[stack_type]
		new stack_type(src, amt, FALSE)

/obj/item/storage/box/debugbox
	illustration = null

/obj/item/storage/box/debugbox/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 100
	atom_storage.max_total_storage = 600
	atom_storage.max_specific_storage = WEIGHT_CLASS_GIGANTIC

/obj/item/storage/box/debugbox/tools
	name = "box of debug tools"
	icon_state = "syndiebox"

/obj/item/storage/box/debugbox/tools/PopulateContents()
	var/static/items_inside = list(
		/obj/item/card/emag=1,
		/obj/item/construction/rcd/combat/admin=1,
		/obj/item/disk/tech_disk/debug=1,
		/obj/item/flashlight/emp/debug=1,
		/obj/item/geiger_counter=1,
		/obj/item/healthanalyzer/advanced=1,
		/obj/item/card/id/advanced/debug=1,
		/obj/item/pipe_dispenser=1,
		/obj/item/stack/spacecash/c1000=50,
		/obj/item/storage/box/beakers/bluespace=1,
		/obj/item/storage/box/beakers/variety=1,
		/obj/item/storage/box/material=1,
		/obj/item/storage/box/debugbox/guns=1,
		/obj/item/uplink/debug=1,
		/obj/item/uplink/nuclear/debug=1,
		/obj/item/clothing/ears/earmuffs/debug = 1,
		)
	generate_items_inside(items_inside,src)

//---- Box of gun boxes
/obj/item/storage/box/debugbox/guns
	name = "box of every gun"
	icon_state = "gunbox"
	desc = "One must peer within in order to obtain what they truly desire."

/obj/item/storage/box/debugbox/guns/PopulateContents()
	for(var/obj/box as anything in subtypesof(/obj/item/storage/box/debugbox/guns))
		new box(src)

//---- Boxes of ballistics
/obj/item/storage/box/debugbox/guns/shotgun
	name = "box of shotguns"
	icon_state = "shotgunbox"
	desc = "Holds a lot of shotguns"

/obj/item/storage/box/debugbox/guns/shotgun/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/ballistic/shotgun))
		new gun(src)

/obj/item/storage/box/debugbox/guns/revolver
	name = "box of revolvers"
	icon_state = "revolverbox"
	desc = "Holds a lot of revolvers"

/obj/item/storage/box/debugbox/guns/revolver/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/ballistic/revolver))
		new gun(src)

/obj/item/storage/box/debugbox/guns/rifle
	name = "box of rifles"
	icon_state = "riflebox"
	desc = "Holds a lot of rifles"

/obj/item/storage/box/debugbox/guns/rifle/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/ballistic/rifle))
		new gun(src)

/obj/item/storage/box/debugbox/guns/bow
	name = "box of bows"
	icon_state = "bowbox"
	desc = "Holds a lot of bows"

/obj/item/storage/box/debugbox/guns/bow/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/ballistic/bow))
		new gun(src)

/obj/item/storage/box/debugbox/guns/automatic
	name = "box of automatic guns"
	icon_state = "automaticbox"
	desc = "Holds a lot of automatic ballistics"

/obj/item/storage/box/debugbox/guns/automatic/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/ballistic/automatic)) // Might still be too big
		new gun(src)

/obj/item/storage/box/debugbox/guns/miscballistics // Misc Ballistic guns
	name = "box of misc ballistics"
	icon_state = "ballisticbox"
	desc = "An assortment of random ballistics"

/obj/item/storage/box/debugbox/guns/miscballistics/PopulateContents() // Misc Ballistic guns
	var/list/remaining_guns = typesof(/obj/item/gun/ballistic) - typesof(/obj/item/gun/ballistic/shotgun) - typesof(/obj/item/gun/ballistic/revolver) - typesof(/obj/item/gun/ballistic/rifle) - typesof(/obj/item/gun/ballistic/bow) - typesof(/obj/item/gun/ballistic/automatic)
	for(var/obj/item/gun as anything in remaining_guns)
		new gun(src)

//---- Boxes of energy
/obj/item/storage/box/debugbox/guns/recharge
	name = "box of recharge guns"
	icon_state = "rechargebox"
	desc = "Holds \"recharge\" type weapons"

/obj/item/storage/box/debugbox/guns/recharge/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/energy/recharge))
		new gun(src)

/obj/item/storage/box/debugbox/guns/laser
	name = "box of lasers"
	icon_state = "laserbox"
	desc = "Holds laser guns"

/obj/item/storage/box/debugbox/guns/laser/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/energy/laser))
		new gun(src)

/obj/item/storage/box/debugbox/guns/e_gun
	name = "box of e-guns"
	icon_state = "egunbox"
	desc = "Holds eguns"

/obj/item/storage/box/debugbox/guns/e_gun/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/energy/e_gun))
		new gun(src)

/obj/item/storage/box/debugbox/guns/miscenergy // Misc energy guns
	name = "box of energy guns"
	icon_state = "energygunbox"
	desc = "An assortment of random energy weapons"

/obj/item/storage/box/debugbox/guns/miscenergy/PopulateContents() // Misc energy guns
	var/list/remaining_guns = typesof(/obj/item/gun/energy) - typesof(/obj/item/gun/energy/recharge) - typesof(/obj/item/gun/energy/laser) - typesof(/obj/item/gun/energy/e_gun)
	for(var/obj/item/gun as anything in remaining_guns)
		new gun(src)

//---- Boxes of magic
/obj/item/storage/box/debugbox/guns/magic
	name = "box of magic guns"
	icon_state = "magicbox"
	desc = "A magical box filled with whimsy and joy"

/obj/item/storage/box/debugbox/guns/magic/PopulateContents()
	for(var/obj/item/gun as anything in typesof(/obj/item/gun/magic))
		new gun(src)

//---- Unsorted guns
/obj/item/storage/box/debugbox/guns/miscguns // Misc uncategorized guns
	name = "box of unsorted guns"
	icon_state = "unsortedbox"
	desc = "Holds every other gun that isnt in any organized subtype"

/obj/item/storage/box/debugbox/guns/miscguns/PopulateContents() // Misc uncategorized guns
	var/list/remaining_guns = typesof(/obj/item/gun) - typesof(/obj/item/gun/ballistic) - typesof(/obj/item/gun/energy) - typesof(/obj/item/gun/magic)
	for(var/obj/item/gun as anything in remaining_guns)
		new gun(src)
