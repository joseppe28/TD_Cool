extends Area3D

@export var health = 100

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Enemy"):
		health -= area.get_parent().attack_damage
	else:
		return
	if health <= 0:
		get_tree().quit()
	get_tree().current_scene.remove_enemy()
	area.get_parent().queue_free()
