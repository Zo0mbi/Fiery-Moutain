extends Area2D

onready var timer = $Timer
var timer_end= false

func _ready():
	timer.start()
	
func _physics_process(_delta):
	if timer_end==true:
		_deplacer_lava()

func _on_Lava_body_entered(body):
	if body.name == "Player":
		body._Death()

func _deplacer_lava():
	self.position.y -=1

func _on_Timer_timeout():
	timer_end=true
