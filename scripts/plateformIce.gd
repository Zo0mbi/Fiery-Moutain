extends Node2D


func _on_Area2D_body_entered(body):
	if(body.name == 'Player'):
		body.reverseMovement=true
		
func _on_Area2D_body_exited(body):
	if(body.name == 'Player'):
		body.reverseMovement=false
