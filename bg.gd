extends ParallaxBackground

var scrolling_speed = Vector2(0, -100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset -= scrolling_speed * delta
