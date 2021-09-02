extends Camera2D

var player
const vel = 10
var espasso = 150
var espassoAtual = 0
func _ready():
	player = get_parent().get_node("Player")
	pass
func tamanho():
	#zoom = Vector2(600 / OS.window_size.y,600 / OS.window_size.y) 
	pass
func _process(delta):
	tamanho()
	player = get_parent().get_node("Player")
	if player.direction == 1:
		if espassoAtual < espasso:
			espassoAtual += 20
	elif player.direction == -1:
		if espassoAtual > -espasso:
				espassoAtual -= 20
	global_position = player.global_position + Vector2(espassoAtual,0)
