extends Node2D


func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AudioStreamPlayer.play()
	pass

func _process(delta):
	$ParallaxBackground/ParallaxLayer.position.x += 10
	if $ParallaxBackground/ParallaxLayer.position.x >= 1280:
		$ParallaxBackground/ParallaxLayer.position.x = 0


func _on_Comeco_pressed():
	$"Botão".play()
	yield($"Botão","finished")
	get_tree().change_scene("res://Root.tscn")
	pass # Replace with function body.


func _on_Controles_pressed():
	$"Botão".play()
	yield($"Botão","finished")
	get_tree().change_scene("res://cenas/Controles.tscn")
	pass # Replace with function body.


func _on_Historia_pressed():
	$"Botão".play()
	yield($"Botão","finished")
	get_tree().change_scene("res://cenas/História.tscn")
	pass # Replace with function body.


