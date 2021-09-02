extends KinematicBody2D
var pos = Vector2()
export var vel = 500
export var player = Vector2(1,1)
func _ready():
	#$AnimationPlayer.play("fire")
	pos = global_position
	pass

func _process(delta):
	#player = get_global_mouse_position()
	move_and_slide((player-pos).normalized()*vel)
	#translate((player-global_position).normalized() * vel * delta)

func _on_Area_de_dano_body_entered(body):
	if body != self:
		yield(get_tree().create_timer(0.01), "timeout")
		queue_free()
	pass # Replace with function body.
