extends Area2D


func _ready():
	pass


func _on_Spinho_body_entered(body):
	if body.name == "Player":
		body.vida -= 10
	pass # Replace with function body.
