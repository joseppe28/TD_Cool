extends Area3D

@export var health = 100

func _on_area_entered(area: Area3D) -> void:
	print("test")
	if area.is_in_group("Enemy"):
		health -= area.get_parent().attack_damage
	if health <= 0:
		get_tree().quit()
