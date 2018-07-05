extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	#if Camera = (-45.6309, 12.299, 21.209499):
		#set to current
		
	add_to_group("cameras")
	add_to_group("cameraBs")
	pass

func _process(delta):
	#make_current(-45.6309, 12.299, 21.209499)
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
