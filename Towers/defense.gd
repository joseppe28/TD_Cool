extends Area3D


@onready var range: Area3D = $Range
@export var damage: int = 10
@export var speed: float = 0.5
@export var cost: int = 5

var active = false

func _ready() -> void:
	$Timer.wait_time = speed
	$Timer.start()

func get_target():
	for e in range.get_overlapping_areas():
		if e.is_in_group("Enemy"):
			return e
	return null


func _on_timer_timeout() -> void:
	if not active:
		$Timer.start()
		return
	var e = get_target()
	if e == null:
		$Timer.start()
		return
	e = e.get_parent()
	e.damage(damage)
	
	$Timer.start()
