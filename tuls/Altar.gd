extends MeshInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal game_over
const DIST_TO_ALTAR = 2

# warning-ignore:unused_argument
func _process(delta):
	var player = $"../../Player"
	var dist = global_transform.origin.distance_squared_to(player.global_transform.origin)
	if dist < DIST_TO_ALTAR * DIST_TO_ALTAR:
		emit_signal("game_over")
		print("game_over")
