extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Panel.hide()

func _process(delta):
	pass



func _on_Area_body_entered( body ):
	if body is KinematicBody:
		print("win")
		$Panel.show()