extends ParallaxBackground

const backspeed = 0.1
const frontspeed = 0.2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	$ParallaxLayerBack.motion_offset.x -= backspeed
	$ParallaxLayerFront.motion_offset.x -= frontspeed
