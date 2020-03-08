extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

var is_hover = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && is_hover:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://GamePlay.tscn")


func _on_StaticBody_mouse_entered():
	$Start.scale = Vector3(1.3, 1.3, 1.3)
	is_hover = true

func _on_StaticBody_mouse_exited():
	is_hover = false
	$Start.scale = Vector3(1, 1, 1)
