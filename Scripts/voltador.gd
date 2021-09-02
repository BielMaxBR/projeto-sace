extends TextureButton


func _ready():
	connect("pressed", self, "aperto")
	pass

func aperto():
	$"Botão".play()
	yield($"Botão","finished")
	get_tree().change_scene("res://cenas/menu inicial.tscn")
