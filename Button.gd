extends Area2D

"""
	Needs to be placed under a node together with a 'Door' object
"""

var opened = false;

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed( "ui_accept"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if (body.get_name() == "Char"):
				print("Button pressed")
				$AnimatedSprite.play("pressed")
				#if get_parent().get_node("Door") != null:
				if !opened :
					get_parent().get_node("Door").get_node("AnimatedSprite").play("open")
					get_parent().get_node("Door").get_node("CollisionShape2D").set_disabled( true)
					#get_parent().get_child(1).get_child(1).play("open")
					#get_parent().get_child(1).get_child(0).set_disabled( true)
					opened = true
				else:
					get_parent().get_node("Door").get_node("AnimatedSprite").play("close")
					get_parent().get_node("Door").get_node("CollisionShape2D").set_disabled( false)
					opened = false

func _on_body_entered(body):
	print( body.get_name() + " entered button area")
