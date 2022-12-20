extends CanvasLayer


onready var niveau = $HFlowContainer/Niveau
onready var pts = $HFlowContainer/Points
onready var vie = $Vie
#change les valeurs du texte
func _process(_delta):
	niveau.text ="Niveau: " + str(Global.niveau)
	pts.text = "Pts: " + str(Global.points)  + "  "
	vie.text = "Vie: " +str(Global.vie)
