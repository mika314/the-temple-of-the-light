extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var Gear = [0, 0, 0, 0]
var is_rot = false

func _on_Button001_pressed():
	if is_rot:
		return
	is_rot = true
	match Gear[0]:
		0:
			$"Gear001/RotAnim".play("Rot12")
			Gear[0] = 1
		1: 
			$"Gear001/RotAnim".play("Rot23")
			Gear[0] = 2
		2: 
			$"Gear001/RotAnim".play("Rot34")
			Gear[0] = 3
		3: 
			$"Gear001/RotAnim".play("Rot41")
			Gear[0] = 0

func _on_Button002_pressed():
	if is_rot:
		return
	is_rot = true
	match Gear[1]:
		0:
			$"Gear002/RotAnim".play("Rot12")
			Gear[1] = 1
		1: 
			$"Gear002/RotAnim".play("Rot23")
			Gear[1] = 2
		2: 
			$"Gear002/RotAnim".play("Rot34")
			Gear[1] = 3
		3: 
			$"Gear002/RotAnim".play("Rot41")
			Gear[1] = 0

func _on_Button003_pressed():
	if is_rot:
		return
	is_rot = true
	match Gear[2]:
		0:
			$"Gear003/RotAnim".play("Rot12")
			Gear[2] = 1
		1: 
			$"Gear003/RotAnim".play("Rot23")
			Gear[2] = 2
		2: 
			$"Gear003/RotAnim".play("Rot34")
			Gear[2] = 3
		3: 
			$"Gear003/RotAnim".play("Rot41")
			Gear[2] = 0

func _on_Button004_pressed():
	if is_rot:
		return
	is_rot = true
	match Gear[3]:
		0:
			$"Gear004/RotAnim".play("Rot12")
			Gear[3] = 1
		1: 
			$"Gear004/RotAnim".play("Rot23")
			Gear[3] = 2
		2: 
			$"Gear004/RotAnim".play("Rot34")
			Gear[3] = 3
		3: 
			$"Gear004/RotAnim".play("Rot41")
			Gear[3] = 0

# warning-ignore:unused_argument
func _on_RotAnim_animation_finished(anim_name):
	is_rot = false
	print(Gear[0], Gear[1], Gear[2], Gear[3])
	if Gear[0] == 1 && Gear[1] == 0 && Gear[2] == 3  && Gear[3] == 2:
		$"Door/AnimDoor".play("Open")
