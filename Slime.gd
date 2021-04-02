extends KinematicBody2D

const GRAVITY = 3
const MAX_SPEED = 80
const ACCELERATION = 10

var motion = Vector2.ZERO
var direction = true

func _physics_process(delta):
	
	if direction:
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	else:
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)

	if is_on_wall():
		if direction :
			motion.x = -10
		else:
			motion.x = 10
		$AnimatedSprite.flip_h = direction
		$AnimatedSprite.play("run")
		direction = !direction
		
	motion = move_and_slide(motion)


func _on_StompDetector_body_entered(body):
	if body.global_position.y < $StompDetector.global_position.y:
		$CollisionShape2D.disabled = true
		queue_free()


func _on_PlayerDetector_body_entered(body):
	if body.name == "Char":
		get_tree().reload_current_scene()
