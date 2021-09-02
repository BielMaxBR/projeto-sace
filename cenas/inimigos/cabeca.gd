extends StaticBody2D

export var vida = 50
func _ready():
	vida = get_parent().get_parent().vidaTotal
	pass
