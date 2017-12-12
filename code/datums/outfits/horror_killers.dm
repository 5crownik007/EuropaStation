/decl/hierarchy/outfit/tunnel_clown
	name = "Tunnel clown"
	uniform = /obj/item/clothing/under/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	gloves = /obj/item/clothing/gloves/thick
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_ear = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/thermal/plain/monocle
	r_pocket = /obj/item/bikehorn
	r_hand = /obj/item/material/twohanded/fireaxe

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/centcom/station
	id_pda_assignment = "Tunnel Clown!"

/decl/hierarchy/outfit/masked_killer
	name = "Masked killer"
	uniform = /obj/item/clothing/under/jumpsuit/blue
	shoes = /obj/item/clothing/shoes/white
	gloves = /obj/item/clothing/gloves/latex
	mask = /obj/item/clothing/mask/surgical
	head = /obj/item/clothing/head/welding
	l_ear = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/thermal/plain/monocle
	suit = /obj/item/clothing/suit/overalls
	l_pocket = /obj/item/material/hatchet/tacknife
	r_pocket = /obj/item/scalpel
	r_hand = /obj/item/material/twohanded/fireaxe

/decl/hierarchy/outfit/masked_killer/post_equip(var/mob/living/carbon/human/H)
	var/victim = get_mannequin(H.ckey)
	for(var/obj/item/carried_item in H.get_equipped_items(TRUE))
		carried_item.add_blood(victim) //Oh yes, there will be blood.. just not blood from the killer because that's odd
