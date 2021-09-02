extends Sprite

onready var balaPath = preload("res://cenas/bala.tscn")

var player
var extra

func _ready():
	player = get_parent().get_parent()
	extra = player.velocity.x
	pass

func fire():
	_on_Timer_timeout()
	$Timer.start(0)
	$Timer.autostart = true

func desfire():
	$Timer.stop()
	$Timer.autostart = false

func _process(delta):
	player = get_parent().get_parent()
	extra = player.velocity.x

func _on_Timer_timeout():
	var tiro = balaPath.instance()
	if extra > 0:
		tiro.vel += extra
	elif extra < 0:
		tiro.vel += -extra
	if get_parent().scale.x < 0:
		tiro.scale.x = -1
		tiro.vel *= -1
	
	tiro.global_position = $Mira.global_position
	player.get_parent().add_child(tiro)
	$"../AudioStreamPlayer".play()
