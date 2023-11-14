extends Node2D
var cheese = preload("res://cheese.tscn")
var platform = preload("res://platform.tscn")
var platform_size = 32
var spawn_radius = 720 - platform_size
var platform_spawn_y = 900.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	spawn_platform()

func spawn_platform():
	var new_platform = platform.instantiate()
	var new_cheese = cheese.instantiate()
	var random_x = randi_range(64,spawn_radius)
	while absf(random_x - new_platform.position.x < 100):
		random_x = randi_range(64,spawn_radius)
	new_platform.position = Vector2(random_x,platform_spawn_y)
	new_cheese.position = Vector2(new_platform.position.x,platform_spawn_y-80)
	add_child(new_platform)
	add_child(new_cheese)
	platform_spawn_y -= randf_range(100,200)	
