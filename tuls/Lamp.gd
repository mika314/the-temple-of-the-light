extends KinematicBody

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

const CAM_SPEED = 7
const FORCE = 0.3

var vertVelocity = 0

# warning-ignore:unused_argument
func _process(delta):
	var dir = Vector3()
	if Input.is_action_pressed("ui_page_up"):
		dir.y += 1
	if Input.is_action_pressed("ui_page_down"):
		dir.y -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		dir.z += 1
	if Input.is_action_pressed("ui_up"):
		dir.z -= 1
	dir = dir.rotated(Vector3(0, 1, 0), rotation.y)
	dir = dir * CAM_SPEED
	vertVelocity -= 9.81 * delta
	dir.y = vertVelocity
	var tmp = move_and_slide(dir)
	vertVelocity = tmp.y
	if Input.is_action_just_pressed("jump") && vertVelocity <= 0.2 && vertVelocity >= -0.2:
		vertVelocity += 10
	if Input.is_action_just_pressed("attack"):
		$Lamp/Dagger/AnimationPlayer.play("Attack")


var MOUSE_SENSITIVITY = 0.07

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		var tmpRotation = $Lamp/Camera.rotation;
		tmpRotation.x -= deg2rad(event.relative.y * MOUSE_SENSITIVITY)
		tmpRotation.x = clamp(tmpRotation.x, -PI / 2, +PI / 2)
		$Lamp/Camera.rotation = tmpRotation

		tmpRotation = rotation;
		tmpRotation.y -= deg2rad(event.relative.x * MOUSE_SENSITIVITY)
		while tmpRotation.y > 2 * PI:
			tmpRotation.y -= 2 * PI
		while tmpRotation.y < -2 * PI:
			tmpRotation.y += 2 * PI
		rotation = tmpRotation

