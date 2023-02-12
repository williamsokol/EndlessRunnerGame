extends RigidBody


# Declare member variables here. Examples:
export var forwardF = 10
export var sideF = 10
var gameOver = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self,"onBodyEntered")
	self.connect("body_exited", self, "onBodyExited")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	linear_velocity.z += -forwardF*delta
	
	if Input.is_action_pressed("a"):
		linear_velocity.x -= sideF*delta
	if Input.is_action_pressed("d"):
		linear_velocity.x += sideF*delta
	if translation.y < 0:
		lose()
	
	pass
func _process(delta):
	#print(Engine.get_frames_per_second())
	pass
func onBodyEntered(body):
	if(body.is_in_group("Obstacle")):
		lose()
		print(body.name)


func lose():
	if(gameOver == true):
		return
	gameOver = true
	linear_velocity.z =linear_velocity.z/2
	sideF = 0
	forwardF = 0
	get_tree().root.get_child(0).resetLevel()
