extends Button
@onready var title = $"../Label"
@onready var tap = $"../tap2play"
var done = false
var counter = 0
var play = false

# Called when the node enters the scene tree for the first time.
func _ready():
	data.score = 0
	data.loadGame()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		play = true
	if play:
		title_fades()
		tap_fades()
		counter += 1
		if counter >= 1:
			if done:
				change_scene()
func title_fades():
	if OS.get_name() == "Window":
		title.modulate.a = lerp(title.modulate.a, 0.0, 0.05) 
	else:
		title.modulate.a = lerp(title.modulate.a, 0.0, 0.2) 
	if title.modulate.a <= 0.01:
		done = true
func tap_fades():
	if OS.get_name() == "Window":
		tap.modulate.a = lerp(tap.modulate.a, 0.0, 0.05) 
	else:
		tap.modulate.a = lerp(tap.modulate.a, 0.0, 0.2) 
		
func change_scene():
	play = false
	get_tree().change_scene_to_file("res://playing.tscn")

func _on_pressed():
	play = true
