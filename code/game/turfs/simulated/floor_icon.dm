var/list/flooring_cache = list()

/turf/simulated/floor/var/extra_desc
/turf/simulated/floor/update_icon(var/update_neighbors, var/list/previously_added = list())

	if(lava)
		return

	var/list/overlays_to_add = previously_added
	if(flooring)
		// Set initial icon and strings.
		name = flooring.name
		desc = flooring.desc
		if(extra_desc)
			desc += " [extra_desc]"

		icon = flooring.icon

		if(flooring_override)
			icon_state = flooring_override
		else
			icon_state = flooring.icon_base
			if(flooring.has_base_range)
				icon_state = "[icon_state][rand(0,flooring.has_base_range)]"
				flooring_override = icon_state

		// Apply edges, corners, and inner corners.
		var/has_border = 0
		if(flooring.flags & TURF_HAS_EDGES)
			for(var/step_dir in cardinal)
				var/turf/simulated/floor/T = get_step(src, step_dir)
				if(!istype(T) || !T.flooring || T.flooring.name != flooring.name)
					has_border |= step_dir
					overlays_to_add += get_flooring_overlay("[flooring.icon_base]-edge-[step_dir]", "[flooring.icon_base]_edges", step_dir)

			// There has to be a concise numerical way to do this but I am too noob.
			if(has_border & NORTH)
				if(has_border & EAST)
					overlays_to_add += get_flooring_overlay("[flooring.icon_base]-edge-[NORTHEAST]", "[flooring.icon_base]_edges", NORTHEAST)
				if(has_border & WEST)
					overlays_to_add += get_flooring_overlay("[flooring.icon_base]-edge-[NORTHWEST]", "[flooring.icon_base]_edges", NORTHWEST)
			if(has_border & SOUTH)
				if(has_border & EAST)
					overlays_to_add += get_flooring_overlay("[flooring.icon_base]-edge-[SOUTHEAST]", "[flooring.icon_base]_edges", SOUTHEAST)
				if(has_border & WEST)
					overlays_to_add += get_flooring_overlay("[flooring.icon_base]-edge-[SOUTHWEST]", "[flooring.icon_base]_edges", SOUTHWEST)

			if(flooring.flags & TURF_HAS_CORNERS)
				// As above re: concise numerical way to do this.
				if(!(has_border & NORTH))
					if(!(has_border & EAST))
						var/turf/simulated/floor/T = get_step(src, NORTHEAST)
						if(!(istype(T) && T.flooring && T.flooring.name == flooring.name))
							overlays_to_add += get_flooring_overlay("[flooring.icon_base]-corner-[NORTHEAST]", "[flooring.icon_base]_corners", NORTHEAST)
					if(!(has_border & WEST))
						var/turf/simulated/floor/T = get_step(src, NORTHWEST)
						if(!(istype(T) && T.flooring && T.flooring.name == flooring.name))
							overlays_to_add += get_flooring_overlay("[flooring.icon_base]-corner-[NORTHWEST]", "[flooring.icon_base]_corners", NORTHWEST)
				if(!(has_border & SOUTH))
					if(!(has_border & EAST))
						var/turf/simulated/floor/T = get_step(src, SOUTHEAST)
						if(!(istype(T) && T.flooring && T.flooring.name == flooring.name))
							overlays_to_add += get_flooring_overlay("[flooring.icon_base]-corner-[SOUTHEAST]", "[flooring.icon_base]_corners", SOUTHEAST)
					if(!(has_border & WEST))
						var/turf/simulated/floor/T = get_step(src, SOUTHWEST)
						if(!(istype(T) && T.flooring && T.flooring.name == flooring.name))
							overlays_to_add += get_flooring_overlay("[flooring.icon_base]-corner-[SOUTHWEST]", "[flooring.icon_base]_corners", SOUTHWEST)

	if(decals && decals.len)
		overlays_to_add += decals

	if(is_plating() && !(isnull(broken) && isnull(burnt))) //temp, todo
		icon = 'icons/turf/flooring/plating.dmi'
		icon_state = "dmg[rand(1,4)]"
	else if(flooring)
		if(!isnull(broken) && (flooring.flags & TURF_CAN_BREAK))
			overlays_to_add += get_flooring_overlay("[flooring.icon_base]-broken-[broken]","[flooring.icon_base]_broken[broken]")
		if(!isnull(burnt) && (flooring.flags & TURF_CAN_BURN))
			overlays_to_add += get_flooring_overlay("[flooring.icon_base]-burned-[burnt]","[flooring.icon_base]_burned[burnt]")

	var/list/shadow_edges = list()
	for(var/thing in trange(1,src))
		var/turf/neighbor = thing
		if(neighbor && neighbor != src && !neighbor.density)
			shadow_edges += get_dir(src, neighbor)

	for(var/i = 1 to 4)
		var/cdir = cornerdirs[i]
		var/corner = 0
		if(cdir in shadow_edges)
			corner |= 2
		if(turn(cdir,45) in shadow_edges)
			corner |= 1
		if(turn(cdir,-45) in shadow_edges)
			corner |= 4
		var/image/I = image('icons/turf/flooring/shadows.dmi', "[corner]", dir = 1<<(i-1))
		I.alpha = 100
		overlays_to_add += I

	..(update_neighbors, overlays_to_add)

/turf/simulated/floor/proc/get_flooring_overlay(var/cache_key, var/icon_base, var/icon_dir = 0)
	if(!flooring_cache[cache_key])
		var/image/I = image(icon = flooring.icon, icon_state = icon_base, dir = icon_dir)
		I.layer = layer
		flooring_cache[cache_key] = I
	return flooring_cache[cache_key]
