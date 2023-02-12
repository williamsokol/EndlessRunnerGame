extends Camera

export var player:NodePath
var offset:Vector3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	offset = translation- get_node(player).translation
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation = offset + get_node(player).translation
#	pass


