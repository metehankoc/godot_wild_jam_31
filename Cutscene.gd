extends Control

export(String, FILE, "*.txt") var dialogue_file
export(String, FILE, "*.tscn") var next_scene

const enemy = "Randroy"

var dia_char = []
var dia_text = []
var dia_idx = 0

var lapsed = 0
var charNum = 0

func _ready():
	get_dialogue()
	$NameLabel.text = dia_char[dia_idx] + ":"
	$TextLabel.text = dia_text[dia_idx]
	enemyTalk()
	
	
	$AnimationPlayer.play_backwards("fade")
	yield($AnimationPlayer, "animation_finished")

func _process(delta):
	lapsed = lapsed + delta
	$TextLabel.set_visible_characters(lapsed / 0.03)
	
	if Input.is_action_just_pressed( "ui_select"):
		if ( dia_idx < dia_text.size()-1):
			dia_idx += 1
			$TextLabel.percent_visible = 0
			$NameLabel.text = dia_char[dia_idx] + ":"
			$TextLabel.text = dia_text[dia_idx]
			enemyTalk()
			lapsed = 0
		else:
			$AnimationPlayer.play("fade")
			yield($AnimationPlayer, "animation_finished")
			print( "Cutscene ended")
			get_tree().change_scene( next_scene)

func get_dialogue():
	var file = File.new()
	file.open( dialogue_file, File.READ)
	while (!file.eof_reached()):
		var line = file.get_line()
		dia_char.append( line)
		line = file.get_line()
		dia_text.append( line)
	file.close()

func enemyTalk():
	if dia_char[dia_idx] == enemy:
		$Enemy.play("talk")
	else:
		$Enemy.play("default")


func _on_Button_pressed():
	Input.action_press( "ui_select")
