extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 3
const MAX_SPEED = 120
const ACCELERATION = 20
const JUMP = -110
const FLOOR_FRICTION = 0.2
const AIR_FRICTION = 0.05

var motion = Vector2()

func _physics_process(delta):
	var friction= false
	motion.y += GRAVITY
	
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		$AnimatedSprite.play("idle")
		friction = true

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
			$Jump.play()
		if friction == true:
			motion.x = lerp(motion.x, 0, FLOOR_FRICTION)
	else:
		if motion.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, AIR_FRICTION)
	motion = move_and_slide(motion, UP)
