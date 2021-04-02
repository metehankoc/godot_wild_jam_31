extends Area2D

"""
	For animation:
	Needs to be placed under a node together with a 'AnimatedSprite' object
"""

var opened = false

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed( "ui_accept"):
		if !opened:
			var bodies = get_overlapping_bodies()
			for body in bodies:
				if (body.get_name() == "Char"):
					print("Chest opened")
					$AnimatedSprite.play("open")
					$Collect.play()
					if get_parent().get_node("AnimatedSprite") != null:
						get_parent().get_node("AnimatedSprite").play("default")

func _on_body_entered(body):
	print( body.get_name() + " entered button area")
