extends Node2D


onready var spawner = $Spawner/Timer

func _ready():
	pass # Replace with function body.

func _process(delta):
	if  get_tree().get_nodes_in_group("enemy").size() == 5:
		spawner.set_paused(true)
	else:
		spawner.set_paused(false)
	pass
