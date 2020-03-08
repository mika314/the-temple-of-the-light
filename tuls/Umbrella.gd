extends Spatial

func _ready():
	pass # Replace with function body.

const DIST_TO_UMBRELLA = 2

# warning-ignore:unused_argument
func _process(delta):
	if !visible:
		return
	var player = $"../Player"
	var dist = global_transform.origin.distance_squared_to(player.global_transform.origin)
	if dist < DIST_TO_UMBRELLA * DIST_TO_UMBRELLA:
		$"../Player".has_umbrella = true
		$"../Rain/StaticBody".queue_free()
		queue_free()
