extends KinematicBody2D


const run_speed = 500
const jump_speed = -1000
const gravity = 1600
var tocado = false
export var vida = 5 
export var arma = 1
var nao = true
var velocity = Vector2()
var direction = 1
func _ready():
	pass

func animador(left,right,jump):
	if is_on_floor():
		if right:
			$SpritePlayer.play("run")

		elif left:
			$SpritePlayer.play("run")

		else:
			$SpritePlayer.play("stop")
	pass

func input():
	velocity.x = 0
	var stopJump = Input.is_action_just_released('jump')
	var desfire = Input.is_action_just_released('fire')
	var jump = Input.is_action_just_pressed('jump')
	var fire = Input.is_action_just_pressed('fire')
	var right = Input.is_action_pressed('right')
	var left = Input.is_action_pressed('left')
	var down = Input.is_action_pressed('down')
	
	animador(left,right,jump)
	
	if left:
		velocity.x -= run_speed
		direction = -1
	elif right:
		velocity.x += run_speed
		direction = 1
	
	if down:
		velocity.y += 15

	if jump and is_on_floor():
		velocity.y = jump_speed
	
	if stopJump and not is_on_floor() and velocity.y < 0:
		velocity.y = jump_speed/6
	
	if fire and arma == 1:
		$Armas/Pistola.fire()
		$Armas/Pistola2.desfire()
	elif fire and arma == 2:
		$Armas/Pistola2.fire()
		$Armas/Pistola.desfire()
	if desfire and arma == 1:
		$Armas/Pistola.desfire()
	elif desfire and arma == 2:
		$Armas/Pistola2.desfire()
	
func dano(dano):
	if nao:
		vida -= dano
		nao = false
		if vida > 0:
			$dano.play()
			$anim.play("dano")
		$VIdaTimer.start()

func upgrade():
	$powerUp.play()

func _process(delta):
	if vida > 0:
		input()
		velocity.y += (gravity) * delta
	else:
		if not tocado:
			if not get_parent().get_node("musica").stream_paused:
				get_parent().get_node("musica").stream_paused = true
			if not $morreu.playing:
				$morreu.play()
			tocado = true
		hide()
		$"../GUI/Morreu".show()
		velocity = Vector2(0,0)
		$Armas/Pistola2.desfire()
		$Armas/Pistola.desfire()

	if arma == 1:
		$Armas/Pistola2.hide()
		$Armas/Pistola.show()
		$Armas/Pistola2.desfire()
	elif arma == 2:
		$Armas/Pistola.desfire()
		$Armas/Pistola.hide()
		$Armas/Pistola2.show()
	if direction < 0:
		$SpritePlayer.flip_h = true
	elif direction > 0:
		$SpritePlayer.flip_h = false
		

	velocity = move_and_slide(velocity, Vector2(0, -1))
	#$Label.text = str(round(velocity.y))
	$Armas.scale.x = direction
	get_parent().get_node("GUI/Vida").value = vida


func _on_VIdaTimer_timeout():
	nao = true
	pass # Replace with function body.


func _on_detector_de_espinho_body_entered(body):
	if body.name == "Malégno":
		vida -= 1000000000
	pass # Replace with function body.


func _on_botao_pressed():
	get_tree().change_scene("res://Root.tscn")
	pass # Replace with function body.
