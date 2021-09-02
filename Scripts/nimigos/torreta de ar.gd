extends StaticBody2D

onready var balaPrefab = preload("res://cenas/inimigos/bala do mal.tscn")
var player
var atirar = false
var vida = 3
func _ready():
	player = get_tree().current_scene.get_node("Player")
	pass

func _process(delta):
	if vida <= 0:
		$"../morrido".play()
		queue_free()
	if $VisibilityNotifier2D.is_on_screen():
		player = get_tree().current_scene.get_node("Player")
		look_at(player.global_position)
		atirar = true
	else:
		atirar = false

func _on_Timer_timeout():
	if atirar:
		var novaBala = balaPrefab.instance()
		novaBala.global_position = $Position2D.global_position
		novaBala.player = player.global_position
		#get_tree().current_scene.add_child(novaBala)
		get_parent().add_child(novaBala)
		$tiro.play()
		#print(novaBala.player)
		$icon.region_rect = Rect2(64,0,64,64)
		yield(get_tree().create_timer(0.6), "timeout")
		$icon.region_rect = Rect2(0,0,64,64)
	pass # Replace with function body.
