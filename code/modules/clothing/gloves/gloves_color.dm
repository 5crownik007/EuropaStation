/obj/item/clothing/gloves/color
	desc = "A pair of gloves, they don't look special in any way."
	item_state = "lgloves"
	icon_state = "white"

POPULATE_COLOURED_VARIANTS_OF(/obj/item/clothing/gloves/color, "gloves")

/obj/item/clothing/gloves/color/evening
	desc = "A pair of gloves that reach past the elbow. Fancy!"
	name = "evening gloves"
	icon_state = "evening_gloves"
	item_state = "evening_gloves"
	color = COLOR_WHITE //original colour was "#7f7f7f", but white is fancier of course
	body_parts_covered = ARMS|HANDS //evening gloves don't quite cover the entire arm, but might as well differentiate the item a bit

/obj/item/clothing/gloves/rainbow
	name = "rainbow gloves"
	desc = "A pair of gloves, they don't look special in any way."
	icon_state = "rainbow"
	item_state = "rainbowgloves"