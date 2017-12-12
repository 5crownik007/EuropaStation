/decl/hierarchy/outfit/spec_op_officer
	name = "Special ops - Officer"
	uniform = /obj/item/clothing/under/jumpsuit/black
	suit = /obj/item/clothing/suit/armour
	glasses = /obj/item/clothing/glasses/thermal/plain/eyepatch
	mask = /obj/item/clothing/mask/smokable/cigarette/cigar/havana
	head = /obj/item/clothing/head/beret
	belt = /obj/item/gun/composite/premade/assault_rifle
	back = /obj/item/storage/backpack/satchel
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/thick/combat

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/centcom/ERT
	id_desc = "Special operations ID."
	id_pda_assignment = "Special Operations Officer"

/decl/hierarchy/outfit/spec_op_officer/space
	name = "Special ops - Officer in space"
	back = /obj/item/tank/jetpack/oxygen
	mask = /obj/item/clothing/mask/gas/swat

	flags = OUTFIT_HAS_JETPACK

/decl/hierarchy/outfit/ert
	name = "Spec ops - Emergency response team"
	uniform = /obj/item/clothing/under/jumpsuit/black
	shoes = /obj/item/clothing/shoes/swat
	gloves = /obj/item/clothing/gloves/thick/swat
	glasses = /obj/item/clothing/glasses/sunglasses
	back = /obj/item/storage/backpack/satchel

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/centcom/ERT

/decl/hierarchy/outfit/syndicate_command
	name = "Spec ops - Syndicate commando"

/decl/hierarchy/outfit/syndicate_command/equip(var/mob/living/carbon/human/H)
	commandos.equip(H)
	return 1
