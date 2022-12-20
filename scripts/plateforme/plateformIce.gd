extends Node2D
var player_entered = false

### La plateform fait renverser les controles du joueur. 

func _on_Area2D_body_entered(body):
	if(body.name == 'Player'):
		if player_entered==false:
			Global.points += 15
		body.reverseMovement=true
		player_entered=true
		
func _on_Area2D_body_exited(body):
	if(body.name == 'Player'):
		body.reverseMovement=false
