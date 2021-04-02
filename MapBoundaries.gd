extends Area2D

export(String, FILE, "*.tscn") var level_scene

func _on_MapBoundaries_body_entered(body):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Char":
			get_tree().reload_current_scene()
