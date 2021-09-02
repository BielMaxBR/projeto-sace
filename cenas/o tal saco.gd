extends KinematicBody2D

var grav = 1500
var velocity = Vector2(0,-200)
func _ready():
	pass

func _process(delta):
	velocity.y += (grav) * delta
	move_and_slide(velocity)
