extends StaticBody2D

var score = 0
var new_position = Vector2.ZERO
var dying = false

func _ready():
	position = new_position
	if score >= 100:
		$ColorRect.color = Color8(240,62,62)
	elif score >= 90:
		$ColorRect.color = Color8(174,62,201)
	elif score >= 80:
		$ColorRect.color = Color8(250,176,5)
	elif score >= 70:
		$ColorRect.color = Color8(55,178,77)
	elif score >= 60:
		$ColorRect.color = Color8(21,170,191)
	elif score >= 50:
		$ColorRect.color = Color8(247,131,172)
	elif score >= 40:
		$ColorRect.color = Color8(218,119,242)
	else:
		$ColorRect.color = Color8(134,124,150)

func _physics_process(_delta):
	if dying and not $Confetti.emitting:
		queue_free()

func hit():
	die()

func die():
	dying = true
	collision_layer = 0
	$ColorRect.hide()
	Global.update_score(score)
	get_parent().check_level()
	$Confetti.emitting = true
