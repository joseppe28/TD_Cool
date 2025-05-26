extends Node3D

var tower_placement = null

func _physics_process(delta: float) -> void:
	if not tower_placement == null:
		var x = get_viewport().size.x
		var y = get_viewport().size.y
		
		var sx = $Size_Control.global_position.x
		var sy = $Size_Control.global_position.z
		
		var vx = get_viewport().size.x
		var vy = get_viewport().size.y
		
		var procent_x = get_viewport().get_mouse_position().x/vx
		var procent_y = get_viewport().get_mouse_position().y/vy
		
		tower_placement.position.x = procent_x * sx
		tower_placement.position.z = procent_y * sy
		tower_placement.position.y = 0
		
		
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			tower_placement.active = true
			tower_placement = null
		
		

func buy(t):
	var tower = load("res://Towers/" + t + ".tscn")
	tower = tower.instantiate()
	tower.scale = Vector3(0.02, 0.02, 0.02)
	get_parent().add_child(tower)
	tower.global_position = Vector3(0, 0, 0)
	tower_placement = tower
	
