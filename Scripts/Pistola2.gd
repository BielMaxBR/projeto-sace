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
	tiroo(600)
	tiroo(0)
	tiroo(-600)
	$"../AudioStreamPlayer".play()
func tiroo(direction):
	var tiro = balaPath.instance()
	tiro.diagonal = direction
	if extra > 0:
		tiro.vel += extra
	elif extra < 0:
		tiro.vel += -extra
	if get_parent().scale.x < 0:
		tiro.scale.x = -1
		tiro.vel *= -1
	if direction < 0:
		tiro.rotation_degrees = -45
		if tiro.vel < 0:
			tiro.rotation_degrees = 45
		tiro.vel = tiro.vel/1.2
	elif direction > 0:
		tiro.rotation_degrees = 45
		if tiro.vel < 0:
			tiro.rotation_degrees = -45
		tiro.vel = tiro.vel/1.2
	tiro.global_position = $Mira.global_position
	#get_tree().current_scene.add_child(tiro)
	player.get_parent().add_child(tiro)
	
