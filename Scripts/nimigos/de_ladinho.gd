extends KinematicBody2D

var speed = 200
var gravity = 500
var velocity = Vector2()
export var vida = 2

func _ready():
	$Anima.play()
	pass

func morreu():
	$"../morrido".play()
	queue_free()

func _process(delta):
	if vida <= 0:
		morreu()
	
	velocity.x = speed
	velocity.y += (gravity) * delta
	move_and_slide(velocity)

func _on_L_up_body_entered(body):
	if body is TileMap:
		speed = 200
		$Anima.flip_h = false
	pass # Replace with function body.


func _on_R_up_body_entered(body):
	if body is TileMap:
		speed = -200
		$Anima.flip_h = true
	pass # Replace with function body.


func _on_L_down_body_exited(body):
	if body is TileMap:
		speed = 200
		$Anima.flip_h = false
	pass # Replace with function body.


func _on_R_down_body_exited(body):
	if body is TileMap:
		speed = -200
		$Anima.flip_h = true
	pass # Replace with function body.
