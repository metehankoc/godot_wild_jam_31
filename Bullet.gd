extends Area2D

const speed = 200
var scene_name
var direction = -1

func _physics_process(delta):
	position += transform.x * speed * delta * direction
	
	
func set_name(name):
	scene_name = "res://" + name + ".tscn"
	

func _on_Bullet_body_entered(body):
	if body.name == "Char":
		$Hit.play()
		get_tree().change_scene(scene_name)
	else:
		queue_free()

