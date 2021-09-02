extends Node2D

onready var saco = preload("res://cenas/o tal saco.tscn")
const vidaTotal = 70
export var vida = 0
var MEIO = false
var LADOL = false
var LADOR = false
var EMCIMAL = false
var EMCIMAR = false
var morto = false
func _ready():
	pass

func _process(delta):
	vida = $cabeca/cabeca.vida
	$vida.value = vida
	if vida < 0:
		$"cadávereste".play()
		$AnimationPlayer.play("morto")
		#toca o hoooo
		#cai o saco e parabéns


func encher_vida():
	$vida.show()
	while vida != vidaTotal:
		yield(get_tree().create_timer(0.1), "timeout")
		vida += 1

func _on_iniciar_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("inicio")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "inicio":
		yield(get_tree().create_timer(0.3), "timeout")
		encher_vida()
		yield(get_tree().create_timer(0.5), "timeout")
		$ultraTimer.start()
	elif anim_name == "morto":
		var ssaco = saco.instance()
		ssaco.position = global_position
		get_parent().add_child(ssaco)
		queue_free()
		pass
	elif anim_name == "parado":
		pass
	else:
		$ultraTimer.start()
	pass # Replace with function body.


func _on_ultraTimer_timeout():
	if morto:
		$ultraTimer.stop()
		queue_free()
	if vida > 0:
		if LADOL:
			print("ladol")
			$PreL.frame = 0
			$PreL.play()
			yield($PreL,"animation_finished")
			$PreL.stop()
			$PreL.frame = 3
			$AnimationPlayer.play("de lado com L")
		elif LADOR:
			print("lador")
			$PreR.frame = 0
			$PreR.play()
			yield($PreR,"animation_finished")
			$PreR.stop()
			$PreR.frame = 3
			$AnimationPlayer.play("de lado com R")
		elif EMCIMAL:
			print("emcimal")
			$PreRD.frame = 0
			$PreRD.play()
			yield($PreRD,"animation_finished")
			$PreRD.stop()
			$PreRD.frame = 3
			$AnimationPlayer.play("defender com R")
		elif EMCIMAR:
			print("emcimar")
			$PreLD.frame = 0
			$PreLD.play()
			yield($PreLD,"animation_finished")
			$PreLD.stop()
			$PreLD.frame = 3
			$AnimationPlayer.play("defender com L")
		elif MEIO:
			print("meio")
			$PreL.frame = 0
			$PreR.frame = 0
			$PreL.play()
			$PreR.play()
			yield($PreL,"animation_finished")
			$PreL.stop()
			$PreL.frame = 3
			$PreR.stop()
			$PreR.frame = 3
			$AnimationPlayer.play("de lado com os dois")
	pass # Replace with function body.

func _on_meio_body_entered(body):
	MEIO = true
	pass # Replace with function body.

func _on_meio_body_exited(body):
	MEIO = false
	pass # Replace with function body.

func _on_LD_body_entered(body):
	LADOL = true
	pass # Replace with function body.

func _on_LD_body_exited(body):
	LADOL = false
	pass # Replace with function body.

func _on_LU_body_entered(body):
	EMCIMAL = true
	pass # Replace with function body.

func _on_LU_body_exited(body):
	EMCIMAL = false
	pass # Replace with function body.

func _on_RD_body_entered(body):
	LADOR = true
	pass # Replace with function body.

func _on_RD_body_exited(body):
	LADOR = false
	pass # Replace with function body.

func _on_RU_body_entered(body):
	EMCIMAR = true
	pass # Replace with function body.

func _on_RU_body_exited(body):
	EMCIMAR = false
	pass # Replace with function body.
