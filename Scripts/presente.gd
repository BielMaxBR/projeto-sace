extends Area2D


func _ready():
	$AnimatedSprite.play("default")
	pass


func _on_Presente_body_entered(body):
	if body.arma:
		body.arma = 2
		body.upgrade()
		$Timer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
