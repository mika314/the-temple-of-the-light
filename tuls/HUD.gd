extends Spatial

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	$HP.scale.x = get_node("../../../../Player").health / 100.0
	
	
