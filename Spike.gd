extends Area2D

const activation_time = 2

var active = true

func _ready():
	$Timer.set_wait_time( activation_time)
	$Timer.start()

func _on_Spike_body_entered(body):
	if body.get_name() == "Char":
		get_tree().reload_current_scene()


func _on_Timer_timeout():
	if active:
		$AnimatedSprite.play("off")
		$CollisionPolygon2D.set_disabled( true)
		active = false
	else:
		$AnimatedSprite.play("on")
		$CollisionPolygon2D.set_disabled( false)
		active = true
