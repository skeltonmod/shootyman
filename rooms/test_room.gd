extends Node2D


onready var spawner = $Spawner/Timer
onready var spawner2 = $Spawner2/Timer

func _ready():
	pass # Replace with function body.

func _process(delta):
	if  get_tree().get_nodes_in_group("enemy").size() == 6:
		spawner.set_paused(true)
		spawner2.set_paused(true)
		
	elif get_tree().get_nodes_in_group("enemy").size() < 6:
		spawner.set_paused(false)
		spawner2.set_paused(false)
	pass
