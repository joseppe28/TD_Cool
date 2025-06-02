extends Node3D

var tower_placement = null
var wave = 1
var spawn_enemies = 0
var enemy_count = 0
var money = 100

func _ready() -> void:
	wave_generation()

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
		
		if Input.is_action_just_pressed("mouse_left"):
			tower_placement.active = true
			tower_placement = null
	if enemy_count <= 0 and spawn_enemies <= 0 and $Wave_wait.is_stopped():
		print("Test")
		wave += 1
		$Wave_wait.start()

func wave_generation():
	spawn_enemies = int(10 + (wave * 5 * wave/2))
	$Enemy_Spawner.start()

func buy(t):
	var tower = load("res://Towers/" + t + ".tscn")
	tower = tower.instantiate()
	if tower.cost > money: 
		return 
	else:
		money -= tower.cost
	get_parent().add_child(tower)
	tower.global_position = Vector3(0, 0, 0)
	tower_placement = tower
	


func _on_enemy_spawner_timeout() -> void:
	var e = preload("res://Enemy/enemy.tscn")
	e = e.instantiate()
	e.scale = Vector3(0.2, 0.2, 0.2)
	$Path3D.add_child(e)
	e.global_position = $Path3D.global_position
	enemy_count += 1
	spawn_enemies -= 1
	if(not spawn_enemies <= 0): 
		$Enemy_Spawner.start()

func remove_enemy():
	money += 10
	enemy_count -= 1

func _on_wave_wait_timeout() -> void:
	wave_generation()
