extends MeshInstance

func _ready():
	pass # Replace with function body.

var is_pressed = false

signal pressed

const BUTTON_PRESS_DIST = 1.6

# warning-ignore:unused_argument
func _process(delta):
	var player = $"../../Player"
	var dist = global_transform.origin.distance_squared_to(player.global_transform.origin)
	if dist < BUTTON_PRESS_DIST * BUTTON_PRESS_DIST:
		if !is_pressed:
			emit_signal("pressed")
			$"../AudioLockClick".play()
		is_pressed = true
	else:
		is_pressed = false
