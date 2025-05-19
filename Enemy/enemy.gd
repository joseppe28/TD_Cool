extends PathFollow3D

@export var speed = 5.0
@export var attack_damage = 10
@export var health = 1

func _ready() -> void:
	$Timer.wait_time = 0.01
	$Timer.start()


func _on_timer_timeout() -> void:
	progress += speed / 100.0
	$Timer.start()

func damage(d):
	health -= d
	if health <= 0:
		queue_free()
