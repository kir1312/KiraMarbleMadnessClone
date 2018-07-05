extends KinematicBody

var speed = 200
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()
var useCamera = 1

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	add_to_group("players")
	pass

func _physics_process(delta):
	direction = Vector3(0, 0, 0)
	if ($Camera.current):
		if Input. is_action_pressed('ui_left'):
			direction.x -= 1
		if Input. is_action_pressed('ui_right'):
			direction.x += 1
		if Input. is_action_pressed('ui_up'):
			direction.z -= 1
		if Input. is_action_pressed('ui_down'):
			direction.z += 1
	
	if ($Camera2.current):
		if Input. is_action_pressed('ui_left'):
			direction.x -= 1
		if Input. is_action_pressed('ui_right'):
			direction.x += 1
		if Input. is_action_pressed('ui_up'):
			direction.z -= 1
		if Input. is_action_pressed('ui_down'):
			direction.z += 1
	
		
	direction = direction. normalized()
	direction = direction * speed * delta
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	if is_on_floor() and Input. is_key_pressed(KEY_SPACE):
		velocity.y = 10
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
	#print("translaton.y:", translation.y)
	if (translation.y < -300):
		print ("you dead ha ha")
		get_tree().change_scene("res://Main.tscn")
		
	if (translation.x < -40 && translation.x > -50 && translation.z > 15 && translation.z < 27 && translation.y > 10 && translation.y < 20):
			print("switch camera")
			$Camera.clear_current()
			$Camera2.make_current()
	
	
	