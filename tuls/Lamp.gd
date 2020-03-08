extends KinematicBody

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

const CAM_SPEED: float = 7.0
const FORCE: float = 0.3

var vertVelocity: float = 0
var health: float = 100

var monsters = {}
const PLAYER_ATTACK_DIST = 7

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
		vertVelocity += 4
	if Input.is_action_just_pressed("attack"):
		$Lamp/Dagger/AnimationPlayer.play("Attack")		
		for monster in monsters:
			var dist = monsters[monster]
			if dist < PLAYER_ATTACK_DIST * PLAYER_ATTACK_DIST:
				monster.attack(2)
		monsters.clear()
	if Input.is_action_just_pressed("mouse_mode"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

var MOUSE_SENSITIVITY = 0.07

var has_umbrella = false

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

func attack(power):
	health -= power
	$AudioHurt.play()
	if health < 0:
		$Anim.play("Death")

func report(monster, dist):
	monsters[monster] = dist

func _on_Terrain_game_over():
	$Anim.play("EndGame")


func _on_Anim_animation_finished(anim_name):
	if anim_name == "Death":
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu.tscn")

