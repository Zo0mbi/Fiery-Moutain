extends Control


func _on_Quit_pressed():
	queue_free()
	get_tree().change_scene("res://scenes/Menu/Menu.tscn")
