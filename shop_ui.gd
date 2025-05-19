extends Control




func _on_button_pressed() -> void:
	var t = $ItemList.get_selected_items()[0]
	if t == null:
		$ItemList.visible = false
		$Button.visible = false
		$Button2.visible = true
		return
	t = $ItemList.get_item_text(t)
	get_parent().buy(t)
	$ItemList.visible = false
	$Button.visible = false
	$Button2.visible = true


func _on_button_2_pressed() -> void:
	$ItemList.visible = true 
	$Button.visible = true
	$Button2.visible = false
	
