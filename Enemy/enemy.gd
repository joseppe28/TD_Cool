extends PathFollow3D

var speed = 5
@export var damage = 10
func _ready() -> void:
	$Timer.wait_time = 0.01
	$Timer.start()


func _on_timer_timeout() -> void:
	progress += 0.01
	$Timer.start()
