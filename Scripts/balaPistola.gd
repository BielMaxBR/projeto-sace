extends KinematicBody2D

export var vel = 1200
export var diagonal = 0
func _ready():
	$AnimationPlayer.play("fire")
	pass

func _process(delta):
	move_and_slide(Vector2(vel,diagonal))


func _on_Area2D_body_entered(body):
	if body.name != "Player":
		if body.is_in_group("inimigo"):
			body.vida -= 1

		queue_free()

