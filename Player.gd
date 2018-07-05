extends KinematicBody

var speed = 200
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	direction = Vector3(0, 0, 0)
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
	
	#collisions
	var platformBs = get_tree().get_nodes_in_group("platformBs")
	var landedOnPlatformB = false
	
	var slideCount = get_slide_count()
	if (slideCount > 0):
		var kc = get_slide_collision(slideCount - 1)
		var c = kc.collider
		
		for platformB in platformBs:
			if (c.is_in_group("platformBs")):
				print("you landed on platformB") 
		
	if is_on_floor() and Input. is_key_pressed(KEY_SPACE):
		velocity.y = 10
	
	#check active camera
			
	var cameras = get_tree().get_nodes_in_group("cameras")	
	
	for camera in cameras:
		if (camera.current == true):
			if (camera.is_in_group("cameraAs")):
				pass
				#print("Camera is active")
			if (camera.is_in_group("cameraBs")):
				pass
				#print("Camera2 is active")
						
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
		
	