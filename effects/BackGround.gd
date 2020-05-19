extends Node2D

onready var screen_size = get_viewport_rect().size
onready var pos2d = $Position2D
var width = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _process(delta):
	if pos2d.get_global_position() >= global_position:
		queue_free()
	pass
