extends KinematicBody


func _ready():
	pass # Replace with function body.

var is_attacking = false
const MONSTER_SPEED = 2
const ROT_SPEED = 30
const ATTACK_MODE_DISTANCE = 10
const ATTACK_DISTANCE = 4

var rot: float = 0
export var ATTACK_POWER: float = 1

export var health: float = 100

# warning-ignore:unused_argument
func _process(delta):
	if health < 0:
		rotation.z = PI * 4 / 7
		return
	var player = $"../Player"
	var dist = translation.distance_squared_to(player.translation)
	player.report(self, dist)
	if dist < ATTACK_MODE_DISTANCE * ATTACK_MODE_DISTANCE:
		if dist < ATTACK_DISTANCE * ATTACK_DISTANCE:
			if randi() % 100 == 0:
				$Anim.play("attack")
				player.attack(ATTACK_POWER)
		else:
			var dir = Vector3(0, -1, -1)
			dir = dir.rotated(Vector3(0, 1, 0), rotation.y)
			dir = dir * MONSTER_SPEED
# warning-ignore:return_value_discarded
			move_and_slide(dir)
		var vec = translation - player.translation
		var angle = atan2(vec.x, vec.z)
		var tmpRotation = rotation
		if tmpRotation.y - angle > PI:
			angle += 2 * PI
		if tmpRotation.y - angle < -PI:
			angle -= 2 * PI
		if tmpRotation.y > angle:
			tmpRotation.y -= deg2rad(2 * ROT_SPEED * delta)
		else:
			tmpRotation.y += deg2rad(2 * ROT_SPEED * delta)
		rotation = tmpRotation
	else:
		var dir = Vector3(0, -1, -1)
		dir = dir.rotated(Vector3(0, 1, 0), rotation.y)
		dir = dir * MONSTER_SPEED
# warning-ignore:return_value_discarded
		move_and_slide(dir)
		var tmpRotation = rotation
		if randi() % 100 == 0 && abs(rot) < 1:
			rot += 90
		if randi() % 100 == 1 && abs(rot) < 1:
			rot -= 90
		if rot > 0:
			tmpRotation.y -= deg2rad(ROT_SPEED * delta)
			rot -= ROT_SPEED * delta
		else:
			tmpRotation.y += deg2rad(ROT_SPEED * delta)
			rot += ROT_SPEED * delta
		while tmpRotation.y > 2 * PI:
			tmpRotation.y -= 2 * PI
		while tmpRotation.y < -2 * PI:
			tmpRotation.y += 2 * PI
		rotation = tmpRotation
	
func attack(power):
	health -= power
	$Anim.play("hurt")
	print(self, health)
