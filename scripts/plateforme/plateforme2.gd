extends Node2D

var player_entered = false

func _on_Points_body_entered(body):
	if body.name == "Player":
		if player_entered==false:
			Global.points+=10
		player_entered=true
