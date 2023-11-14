extends Area2D

var hit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hit:
		self.modulate.a -= 0.05
		self.position.y -= 3
		if self.modulate.a < 0.1:
			data.cheese += 1
			data.score += 1
			data.saveGame()
			queue_free()

func _on_body_entered(body):
	if body.name == "mouse":
		hit = true


