extends Control

export(String, FILE, "*.tscn") var next_scene

var lapsed = 0

func _process(delta):
	lapsed = lapsed + delta
	
	if Input.is_action_just_pressed( "ui_select"):
		get_tree().change_scene( next_scene)


func _on_Button_pressed():
	Input.action_press("ui_select")
