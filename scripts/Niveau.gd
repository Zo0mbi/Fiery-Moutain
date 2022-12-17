extends Node2D

onready var plateform1 = preload("res://scenes/plateform/plateformIce.tscn")
onready var plateform2 = preload("res://scenes/plateform/plateforme.tscn")
onready var plateform3 = preload("res://scenes/plateform/plateforme2.tscn")
var plateform = [plateform1,plateform2,plateform3]
onready var rngPlateform = [preload("res://scenes/plateform/plateformIce.tscn"),preload("res://scenes/plateform/plateforme.tscn"),preload("res://scenes/plateform/plateforme2.tscn"),preload("res://scenes/plateform/plateform_checkpoint.tscn")]
onready var player = $Player

#Va etre mis a 5 dans le Main
var niveaux = Global.niveau
var nb_plateforme = Global.plateform
var hauteur_plateforme=-2650
# Called when the node enters the scene tree for the first time.
#instancie et melange le rng pour la valeur X des plateformes

func _ready():
	_instancier_niveau()
	randomize()

#appel le Main pour changer le niveau
func _prochain_niveau():
	Global.niveau= niveaux+1
	Global.plateform=nb_plateforme+2
	get_tree().reload_current_scene()
	

#retourn un vector aleatoire entre -300 et 300 pour index X
func _valXplateform():
	var xpos = rand_range(-300,300)
	return xpos

#va sortir une inedx de plateform random entre les 3d isponible
func _rngPlateform():
	var plateforminstance = rand_range(0,2)
	return plateforminstance

func _instancierPlateforme(check):
	var Xval = _valXplateform()
	hauteur_plateforme = hauteur_plateforme+175
	var position_vector = Vector2(Xval,-hauteur_plateforme)
	var rng = _rngPlateform()
	if check==false:
		var plateforme = rngPlateform[rng].instance()
		plateforme.position = position_vector
		call_deferred("add_child",plateforme)
	else:
		var plateforme = rngPlateform[3].instance()
		plateforme.position = position_vector
		call_deferred("add_child",plateforme)

func _instancier_niveau():
	for _nb in range(nb_plateforme):
		_instancierPlateforme(false)
	_instancierPlateforme(true)
	
	
	

