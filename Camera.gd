extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	add_to_group("cameras")
	add_to_group("cameraAs")

func _process(delta):
	#make_current()
	#clear_current(-45.6309, 12.299, 21.209499)
	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
