extends Node2D

func _on_Checkpoint_body_entered(body):
	if body.name=='Player':
		get_parent()._prochain_niveau()
