/datum/design/organic_bloodbag_aplus
	name = "A+ Blood Pack"
	id = "organic_bloodbag_aplus"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/a_plus
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_aminus
	name = "A- Blood Pack"
	id = "organic_bloodbag_aminus"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/a_minus
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_bplus
	name = "B+ Blood Pack"
	id = "organic_bloodbag_bplus"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/b_plus
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_bminus
	name = "B- Blood Pack"
	id = "organic_bloodbag_bminus"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/b_minus
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_oplus
	name = "O+ Blood Pack"
	id = "organic_bloodbag_oplus"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/o_plus
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_ominus
	name = "O- Blood Pack"
	id = "organic_bloodbag_ominus"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 150)
	build_path = /obj/item/reagent_containers/blood/o_minus
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_lizard
	name = "L Blood Pack"
	id = "organic_bloodbag_lizard"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/lizard
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_ethereal
	name = "LE Blood Pack"
	id = "organic_bloodbag_ethereal"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/ethereal
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_plant
	name = "H2O Blood Pack"
	id = "organic_bloodbag_plant"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 50)
	build_path = /obj/item/reagent_containers/blood/podperson
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_bloodbag_slimeperson
	name = "TOX Blood Pack"
	id = "organic_bloodbag_slimeperson"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/blood/toxin
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_BLOOD,
	)

/datum/design/organic_printer_gauze
	name = "medical gauze"
	id = "medical_gauze"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 50)
	build_path = /obj/item/stack/medical/gauze
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/datum/design/organic_sterilized_gauze
	name = "sealed aseptic gauze"
	id = "sterilized_gauze"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 50)
	build_path = /obj/item/stack/medical/gauze/sterilized
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/datum/design/organic_bruise_pack
	name = "Bruise Pack"
	id = "organic_bruise_pack"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 25)
	build_path = /obj/item/stack/heal_pack/brute_pack
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/datum/design/organic_burn_pack
	name = "Burn Pack"
	id = "organic_burn_pack"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 25)
	build_path = /obj/item/stack/heal_pack/burn_pack
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/datum/design/organic_printer_amollin_pill
	name = "Amollin Painkiller"
	id = "organic_printer_amollin_pill"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 25)
	build_path = /obj/item/reagent_containers/pill/amollin
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/*
/datum/design/organic_printer_tramadol_pill
	name = "Tramadol Painkiller"
	id = "organic_printer_tramadol_pill"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 25)
	build_path = /obj/item/reagent_containers/pill // /tramadol
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)
*/ // XANTODO: gonna add tram later

/datum/design/organic_printer_synth_patch
	name = "Robotic Repair Patch"
	id = "organic_repair_patch"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/pill/robotic_patch/synth_repair
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/datum/design/organic_printer_bone_gel
	name = "Bone Gel"
	id = "organic_bone_gel"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/stack/medical/bone_gel
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/datum/design/organic_printer_surgical_tape
	name = "Surgical Tape"
	id = "organic_surgical_tape"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/stack/sticky_tape/surgical
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)
