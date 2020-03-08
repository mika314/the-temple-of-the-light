extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal game_over

func _on_Altar_game_over():
	emit_signal("game_over")
