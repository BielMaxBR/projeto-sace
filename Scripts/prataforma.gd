extends KinematicBody2D
var tamanho = 192

var velocity = 100
var posAtual = 1

func _process(delta):
	if get_parent().get_node("Position2D"+str(posAtual)):
		move_and_slide((global_position-get_parent().get_node("Position2D"+str(posAtual)).global_position).normalized()*velocity)
		if get_parent().get_node("Position2D"+str(posAtual)).global_position == global_position:
			posAtual += 1
			posAtual += 1
	else:
		posAtual = 1
