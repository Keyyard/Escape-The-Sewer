extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.offset.y -= 0.3
	if OS.get_name() != "Windows":
		self.offset.y -= 0.8
