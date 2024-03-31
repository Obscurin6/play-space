extends Sprite2D

var pos: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos += 5 * delta
	if pos > 500:
		pos = 0
	position = Vector2(pos,50)
