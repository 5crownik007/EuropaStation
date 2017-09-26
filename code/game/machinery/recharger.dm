//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

obj/machinery/recharger
	name = "recharger"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "recharger0"
	anchored = 1
	use_power = 1
	idle_power_usage = 4
	active_power_usage = 10 KILOWATTS
	var/obj/item/charging = null
	var/list/allowed_devices = list(/obj/item/gun/composite, /obj/item/melee/baton, /obj/item/cell)
	var/icon_state_charged = "recharger2"
	var/icon_state_charging = "recharger1"
	var/icon_state_idle = "recharger0" //also when unpowered
	var/portable = 1

obj/machinery/recharger/attackby(var/obj/item/G, var/mob/user)

	var/allowed = 0
	for(var/allowed_type in allowed_devices)
		if(istype(G, allowed_type))
			allowed = 1
			break

	if(allowed)
		if(charging)
			user << "<span class='warning'>\A [charging] is already charging here.</span>"
			return
		// Checks to make sure he's not in space doing it, and that the area got proper power.
		if(!powered())
			user << "<span class='warning'>The [name] blinks red as you try to insert the item!</span>"
			return
		if(istype(G, /obj/item/gun/composite))
			var/obj/item/gun/composite/C = G
			if(!C.body.is_laser())
				return
			var/obj/item/gun_component/chamber/laser/L = C.chamber
			if(istype(L) && L.self_recharge_time)
				user << "<span class='notice'>Your gun's recharge port was removed to make room for an integrated microreactor.</span>"
				return
		user.drop_item()
		G.loc = src
		charging = G
		update_icon()
	else if(portable && G.iswrench())
		if(charging)
			user << "<span class='warning'>Remove [charging] first!</span>"
			return
		anchored = !anchored
		user << "You [anchored ? "attached" : "detached"] the recharger."
		playsound(loc, 'sound/items/Ratchet.ogg', 75, 1)

obj/machinery/recharger/attack_hand(var/mob/user)

	add_fingerprint(user)

	if(charging)
		charging.update_icon()
		user.put_in_hands(charging)
		charging = null
		update_icon()

obj/machinery/recharger/process()
	if(stat & (NOPOWER|BROKEN) || !anchored)
		update_use_power(0)
		icon_state = icon_state_idle
		return

	if(!charging)
		update_use_power(1)
		icon_state = icon_state_idle
	else
		var/obj/item/cell/cell = charging.get_cell()
		if(cell)
			if(!cell.fully_charged())
				icon_state = icon_state_charging
				cell.give(active_power_usage / 100)
				update_use_power(2)
			else
				icon_state = icon_state_charged
				update_use_power(1)
		else
			icon_state = icon_state_idle
			update_use_power(1)

obj/machinery/recharger/emp_act(severity)
	if(stat & (NOPOWER|BROKEN) || !anchored)
		..(severity)
		return

	if(istype(charging, /obj/item/melee/baton))
		var/obj/item/melee/baton/B = charging
		if(B.bcell)
			B.bcell.charge = 0
	..(severity)

obj/machinery/recharger/update_icon()	//we have an update_icon() in addition to the stuff in process to make it feel a tiny bit snappier.
	if(charging)
		icon_state = icon_state_charging
	else
		icon_state = icon_state_idle


obj/machinery/recharger/wallcharger
	name = "wall recharger"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "wrecharger0"
	active_power_usage = 25000	//25 kW , It's more specialized than the standalone recharger (guns and batons only) so make it more powerful
	allowed_devices = list(/obj/item/gun/composite, /obj/item/melee/baton)
	icon_state_charged = "wrecharger2"
	icon_state_charging = "wrecharger1"
	icon_state_idle = "wrecharger0"
	portable = 0
