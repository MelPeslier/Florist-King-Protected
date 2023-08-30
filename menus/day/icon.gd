extends TextureRect


func _get_drag_data(_at_position):
	var data: Dictionary 
	# Seed Slot drag
	if get_parent().get_name().begins_with("seed_slot"):
		var seed_data = get_parent().get_parent().get_parent().seed_data
		var slot = get_parent().get_name()
		if !ScoreManager.can_buy_seed(seed_data["seed_price"]):
			Events.emit_signal("play_the_song", "no")
			return null
		else:
			data = {
						"origin_data" : seed_data,
						"origin_texture" : texture,
						"origin_node" : self,
						"origin_slot" : [slot]
					}
		
	# Placer Slot drag
	elif get_parent().get_name().begins_with("Pot"):
		var pot_slot = get_parent().get_name()
		var room_slot = get_parent().get_parent().get_name()
	
		if PlacerData.placer_data[room_slot][pot_slot] != null:
			# origin key contain all the data 'price, name image nodepath etc...
			data = {
					"origin_data" : PlacerData.placer_data[room_slot][pot_slot],
					"origin_texture" : load(PlacerData.placer_data[room_slot][pot_slot]["image"]),
					"origin_node" : self,
					"origin_slot" : [room_slot, pot_slot]
				}
			
			if data.origin_data.has("seed_price"):
				Events.emit_signal("show_sell_panel", true, data.origin_data["seed_price"])
			else:
				Events.emit_signal("show_sell_flower_panel", true, data.origin_data["flower_price"])
		else:
			# If no condition met
			return null
	else:
		return null
	
	# If a condition has met // Preview
	var preview_texture = TextureRect.new()
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.texture = texture
	preview_texture.size = Vector2(100, 100)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	# Put the texture in the middle of the mouse
	preview_texture.set_position(-0.5 * preview_texture.get_rect().size)
	set_drag_preview(preview)
	
	return data


func _can_drop_data(_at_position, data):
	var target_slot = get_parent().get_name()

	if target_slot == "sell_seed":
		if data.origin_data.has("seed_price"):
			return true
	
	elif target_slot == "sell_flower":
		if !data.origin_data.has("seed_price"):
			return true
	
	elif target_slot.begins_with("Pot"):
		var room_slot = get_parent().get_parent().get_name()

		if data["origin_slot"].size() > 1:
			return true
		elif PlacerData.placer_data[room_slot][target_slot] == null:
			return true

	return false


func _drop_data(_at_position, data):
	var target_slot = get_parent().get_name()
	var origin_slot = data["origin_slot"]
	# IF SEED GO TO SELL SEED SLOT OK
	if target_slot == "sell_seed":
		if data.origin_data.has("seed_price"):

			if origin_slot.size() > 1:
				ScoreManager.sell_seed(data.origin_data["seed_price"])
				Events.emit_signal("play_the_song", "yes")
				
				# Update data of ORIGIN
				PlacerData.placer_data[origin_slot[0]][origin_slot[1]] = null
				
				# Update texture of ORIGIN
				var default_texture = load("res://art/placeholder/pot/cirle.png")
				data["origin_node"].texture = default_texture
				# No need to update texture or TARGET (it's sell price one)
	
	elif target_slot == "sell_flower":
		if !data.origin_data.has("seed_price"):
			ScoreManager.sell_flower(data.origin_data["flower_price"])
			Events.emit_signal("play_the_song", "yes")
			
			# Update data of ORIGIN
			PlacerData.placer_data[origin_slot[0]][origin_slot[1]] = null
			
			# Update texture of ORIGIN
			var default_texture = load("res://art/placeholder/pot/cirle.png")
			data["origin_node"].texture = default_texture
	
	elif target_slot.begins_with("Pot"):
		var room_slot = get_parent().get_parent().get_name()
		
		# IF COME FROM 'POT' SLOT
		if data.origin_slot.size() > 1:
			Events.emit_signal("play_the_song", "yes")
			# Update data of ORIGIN
			var tmp = PlacerData.placer_data[origin_slot[0]][origin_slot[1]]
			PlacerData.placer_data[origin_slot[0]][origin_slot[1]] = PlacerData.placer_data[room_slot][target_slot]
			# Update texture of ORIGIN
			if PlacerData.placer_data[room_slot][target_slot] == null:
				var for_origin_texture = load("res://art/placeholder/pot/cirle.png")
				data["origin_node"].texture = for_origin_texture
			
			else:
				var for_origin_texture = load(PlacerData.placer_data[room_slot][target_slot]["image"])
				data["origin_node"].texture = for_origin_texture
			
			# Update data of TARGET
			PlacerData.placer_data[room_slot][target_slot] = tmp
			
			# Update Texture of target
			texture = load(data["origin_data"]["image"])
			
			# IF COME FROM 'SEED' SLOT
		else :
			if PlacerData.placer_data[room_slot][target_slot] == null:
				# Update TARGET ONLY
				PlacerData.placer_data[room_slot][target_slot] = data.origin_data
				texture = load(data["origin_data"]["image"])
				Events.emit_signal("play_the_song", "yes")
				ScoreManager.buy_seed(data.origin_data.seed_price)
