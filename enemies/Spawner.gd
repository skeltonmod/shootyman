extends Position2D

onready var timer = $Timer
const enemy = preload("res://enemies/enemy.tscn")
func _ready():
	print(timer.time_left)

func _on_Timer_timeout():
	var enemy_instance = enemy.instance()
	get_parent().add_child(enemy_instance)
	enemy_instance.global_position = global_position
	pass # Replace with function body.
