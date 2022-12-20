extends Node

var points = 0
var niveau = 1
var plateform = 5
var vie = 3
func _Reset():
	Global.niveau = 1
	Global.plateform = 5
	Global.points = 0
	Global.vie = 3
	get_tree().change_scene("res://scenes/Menu/Menu.tscn")
	
