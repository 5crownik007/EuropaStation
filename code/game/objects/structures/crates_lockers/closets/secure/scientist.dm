/obj/structure/closet/secure_closet/scientist
	name = "scientist's locker"
	req_one_access = list(access_tox,access_tox_storage)
	icon_state = "secureres1"
	icon_closed = "secureres"
	icon_locked = "secureres1"
	icon_opened = "secureresopen"
	icon_broken = "secureresbroken"
	icon_off = "secureresoff"

	New()
		..()
		if(prob(50))
			new /obj/item/storage/backpack/toxins(src)
		else
			new /obj/item/storage/backpack/satchel_tox(src)
		new /obj/item/clothing/under/jumpsuit/white(src)
		//new /obj/item/clothing/suit/labcoat/science(src)
		new /obj/item/clothing/suit/storage/toggle/labcoat(src)
		new /obj/item/clothing/shoes/white(src)
		//new /obj/item/cartridge/signal/science(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/clipboard(src)
		return

/obj/structure/closet/secure_closet/xenobio
	name = "xenobiologist's locker"
	req_access = list(access_xenobiology)
	icon_state = "secureres1"
	icon_closed = "secureres"
	icon_locked = "secureres1"
	icon_opened = "secureresopen"
	icon_broken = "secureresbroken"
	icon_off = "secureresoff"

	New()
		..()
		if(prob(50))
			new /obj/item/storage/backpack/toxins(src)
		else
			new /obj/item/storage/backpack/satchel_tox(src)
		new /obj/item/clothing/under/jumpsuit/white(src)
		new /obj/item/clothing/suit/storage/toggle/labcoat(src)
		new /obj/item/clothing/shoes/white(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clipboard(src)
		return


/obj/structure/closet/secure_closet/RD
	name = "scientist's locker"
	req_access = list(access_rd)
	icon_state = "rdsecure1"
	icon_closed = "rdsecure"
	icon_locked = "rdsecure1"
	icon_opened = "rdsecureopen"
	icon_broken = "rdsecurebroken"
	icon_off = "rdsecureoff"

	New()
		..()
		new /obj/item/clothing/suit/bio_suit(src)
		new /obj/item/clothing/head/bio_hood(src)
		new /obj/item/clothing/under/jumpsuit/white(src)
		new /obj/item/clothing/under/jumpsuit/white(src)
		new /obj/item/clothing/under/jumpsuit/white(src)
		new /obj/item/clothing/suit/storage/toggle/labcoat(src)
		new /obj/item/cartridge/rd(src)
		new /obj/item/clothing/shoes/white(src)
		new /obj/item/clothing/shoes/leather(src)
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/flash(src)
		new /obj/item/clipboard(src)
		return
