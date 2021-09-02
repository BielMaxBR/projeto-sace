extends StaticBody2D


func _ready():
	pass


func _on_entrando_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("abrir")
	pass # Replace with function body.


func _on_saindo_body_entered(body):
	if body.name == "Player":
		yield(get_tree().create_timer(0.2), "timeout")
		$AnimationPlayer.play("fechar")
	pass # Replace with function body.
