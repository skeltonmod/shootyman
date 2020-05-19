extends ParallaxBackground

var offsetlocation = 0
func _ready():
	pass 

func _process(delta):
	offsetlocation -= 100 * delta
	set_scroll_offset(Vector2(offsetlocation,0))
