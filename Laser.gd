extends Area2D

const activation_time = 5

var active = true

func _ready():
	$Timer.set_wait_time( activation_time)
	$Timer.start()

func _on_Timer_timeout():
	if active:
		$AnimatedSprite.play("turnoff")
		$CollisionShape2D.set_disabled( true)
		active = false
	else:
		$AnimatedSprite.play("turnon")
		
		$CollisionShape2D.set_disabled( false)
		active = true


func _on_Laser_body_entered(body):
	if body.get_name() == "Char":
		get_tree().reload_current_scene()


func _on_AnimatedSprite_animation_finished():
	if( $AnimatedSprite.get_animation() == "turnon"):
		$AnimatedSprite.play("default")
