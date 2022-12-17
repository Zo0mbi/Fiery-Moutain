extends KinematicBody2D

export var speed = 130.0
export var jump_speed = 300.0
export var gravity = 240.0
var screen_size;
var velocity = Vector2()
var jump_count = 0
onready var timer = $Combo
var reverseMovement = false

func _physics_process(delta):
	# on ne remet pas le vecteur de vélocité à 0 complètement
	# pour garder le déplacement vertical avec gravité
	velocity.x = 0
	# qu'est-ce que l'utilisateur fait?
	get_input()
	# application de la gravité
	# il faut la multiplier par le temps écoulé depuis le dernier calcul
	# sinon on aura le déplacement pour une seconde complète
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	_triple_jump(delta)

#Verifie la mecanique de triple saut et change les param en consequence.
func _triple_jump(delta):
	if is_on_floor():
		self.rotation_degrees=0
	if is_on_floor() && timer.is_stopped():
		timer.start()
	if jump_count >= 3:
		jump_speed= 400
		self.rotate(deg2rad(360*delta))

#prend les input du joueur et s'occupe des mouvement de celui-ci
func get_input():
	# on utilise un vecteur de la bonne longueur dès le début
	# parce qu'il faut appliquer des vitesses différente en x et en y
	# en plus ça simplifie le calcul pour la gravité
	if reverseMovement==false:
		if Input.is_action_pressed("right"):
			velocity.x += speed
		if Input.is_action_pressed("left"):
			velocity.x += -speed
	else:
		if Input.is_action_pressed("right"):
			velocity.x += -speed
		if Input.is_action_pressed("left"):
			velocity.x += speed
		
	if Input.is_action_pressed("jump") and is_on_floor():
		timer.stop()
		velocity.y += -jump_speed
		jump_count+=1

# Verifie si le joueur perd son combo de saut
func _on_Combo_timeout():
	jump_count = 0
	jump_speed = 300
