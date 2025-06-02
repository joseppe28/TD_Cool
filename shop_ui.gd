extends Control


func _physics_process(delta: float) -> void:
	$Label.text = "Money: " + str(get_tree().current_scene.money)


func _on_button_pressed() -> void:
	if $ItemList.get_selected_items() == null:
		$ItemList.visible = false
		$Button.visible = false
		$Button2.visible = true
		return
	
	var t = $ItemList.get_selected_items()[0]
	t = $ItemList.get_item_text(t)
	get_parent().buy(t)
	$ItemList.visible = false
	$Button.visible = false
	$Button2.visible = true


func _on_button_2_pressed() -> void:
	$ItemList.visible = true 
	$Button.visible = true
	$Button2.visible = false
	


func _on_next_wave_pressed() -> void:
	if get_tree().current_scene.enemy_count <= 0:
		get_tree().current_scene.next_wave()


func _on_auto_load_pressed() -> void:
	get_tree().current_scene.auto_load = !get_tree().current_scene.auto_load
