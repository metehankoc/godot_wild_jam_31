extends Control

export(String, FILE, "*.tscn") var next_scene
export(String, FILE, "*.tscn") var next_scene2

var flag = true

func _on_StartButton_pressed():
	get_tree().change_scene(next_scene)
	
func _on_AboutButton_pressed():
	get_tree().change_scene(next_scene2)

func _on_MuteButton_pressed():
	#var master_sound = AudioServer.get_bus_index("Master")
	#AudioServer.set_bus_mute(master_sound, true)
	if flag:
		AudioServer.set_bus_mute(0, flag)
		flag = false
	else:
		AudioServer.set_bus_mute(0, flag)
		flag = true

