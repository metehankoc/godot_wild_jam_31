extends Area2D

export (PackedScene) var Bullet

#onready var BULLET = preload("res://Bullet.tscn")

const time = 0.6
var passed = 0
var left = true

func _ready():
	if left:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("default")

func _process(delta):
	passed = passed + delta
	if ( passed > time ):
		var bullet =  Bullet.instance()
		bullet.set_name(get_parent().name)
		add_child( bullet )
		passed = 0



