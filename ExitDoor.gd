extends Area2D

export(String, FILE, "*.tscn") var cutscene_file
export(String, FILE, "*.txt") var dialogue_file
export(String, FILE, "*.tscn") var next_scene

func _process(delta):
	$AnimatedSprite.play("default")
	if Input.is_action_just_pressed( "ui_accept"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if (body.get_name() == "Char"):
				print("Exiting level")
				$Sound.play()
				if (cutscene_file == "" || dialogue_file == ""):
					print( "via normal transition")
					get_tree().change_scene( next_scene)
				else:
					print( "via cutscene")
					var current_scene = get_tree().get_root().get_child(0)
					var ctscn = load( cutscene_file).instance()
					ctscn.dialogue_file = self.dialogue_file
					ctscn.next_scene = self.next_scene
					get_tree().get_root().add_child(ctscn)
					get_tree().set_current_scene(ctscn)
					
					get_tree().get_root().remove_child(current_scene)

