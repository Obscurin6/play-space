extends Node2D

var test_scale: float = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	#test_scale += 1
	#scale = Vector2(test_scale,test_scale)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	test_scale += 0.01 * delta
	scale = Vector2(test_scale,test_scale)
	pass
