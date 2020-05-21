extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func destroy(animation):
	queue_free()

func _on_Timer_timeout():
	$AnimationPlayer.play("fade")
	$AnimationPlayer.connect("animation_finished",self,"destroy")
	
	pass # Replace with function body.
