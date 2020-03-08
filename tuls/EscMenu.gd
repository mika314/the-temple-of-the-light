extends Spatial

func _ready():
	pass # Replace with function body.

signal quit

var is_continue_hover = false
var is_quit_hover = false

# warning-ignore:unused_argument
func _process(delta):
	if !visible:
		return
	if Input.is_action_just_pressed("ui_accept") && is_continue_hover:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		visible = false
	if Input.is_action_just_pressed("ui_accept") && is_quit_hover:
		emit_signal("quit")

func _on_Continue_mouse_entered():
	$Continue.scale = Vector3(1.3, 1.3, 1.3)
	is_continue_hover = true

func _on_Continue_mouse_exited():
	$Continue.scale = Vector3(1, 1, 1)
	is_continue_hover = false

func _on_Quit_mouse_entered():
	$Quit.scale = Vector3(1.3, 1.3, 1.3)
	is_quit_hover = true

func _on_Quit_mouse_exited():
	$Quit.scale = Vector3(1, 1, 1)
	is_quit_hover = false
