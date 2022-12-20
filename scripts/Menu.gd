extends Control

###
###Menu principal.
###

func _on_Start_pressed():
	queue_free()
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Help_pressed():
	queue_free()
	get_tree().change_scene("res://scenes/Menu/Help.tscn")
