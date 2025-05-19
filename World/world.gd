extends Node3D

var tower_placement = null

func _physics_process(delta: float) -> void:
	if not tower_placement == null:
		tower_placement.position.x = get_viewport().get_mouse_position().x
		tower_placement.position.z = get_viewport().get_mouse_position().y
		tower_placement.global_position.z = 0
		
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			tower_placement.active = true
			tower_placement = null
		
		

func buy(t):
	var tower = load("res://Towers/" + t + ".tscn")
	tower = tower.instantiate()
	tower.scale = Vector3(0.02, 0.02, 0.02)
	get_parent().add_child(tower)
	tower_placement = tower
	
