extends Area2D

export var dano = 1

func _ready():
	pass


func _on_Area_de_dano_body_entered(body):
	if body.name == "Player":
		body.dano(dano)
	pass # Replace with function body.
