extends Spatial


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$AnimationPlayer.play("sun goes down")
	$AudioStreamPlayer.play()

var is_hover = false

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && is_hover:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://GamePlay.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "sun goes down":
		$AudioStreamPlayer2.play()
	else:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://GamePlay.tscn")

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer3.play()
	$AnimationPlayer.play("oldman monologue")


func _on_StaticBody_mouse_entered():
	$Skip.scale = Vector3(1.3, 1.3, 1.3)
	is_hover = true

func _on_StaticBody_mouse_exited():
	$Skip.scale = Vector3(1.0, 1.0, 1.0)
	is_hover = false
