extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentOpenScene:Node
var gameScene = preload("res://MainGame.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	loadScene(gameScene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func resetLevel():
	yield(get_tree().create_timer(2.0), "timeout")
	print("test")
	loadScene(gameScene)
	pass
func loadScene(scene):
	if(currentOpenScene != null):
		currentOpenScene.queue_free()
	
	var instance = scene.instance()
	add_child(instance)
	
	currentOpenScene = instance
		
