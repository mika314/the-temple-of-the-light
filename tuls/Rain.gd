extends Spatial

func _ready():
	pass # Replace with function body.

const DIST_TO_RAIN = 2

func _process(delta):
	var dir = Vector3(0, -1, 0)
	translation += dir * delta
	if translation.y < -2:
		translation.y = 2
	var player = $"../../Player"
	var dist = global_transform.origin.distance_squared_to(player.global_transform.origin)
	if dist < DIST_TO_RAIN * DIST_TO_RAIN && !$"../../Player/AudioNeedUmbrella".playing && !$"../../Player".has_umbrella:
		$"../../Player/AudioNeedUmbrella".play()
