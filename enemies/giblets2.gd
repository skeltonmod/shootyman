extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn(direction):
	self.linear_velocity = Vector2(5 * direction,rand_range(-20,-40)) * 20 
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	$AnimationPlayer.play("fade")
	pass # Replace with function body.


func _on_giblets2_body_entered(body):
	if "tilemap" in body.name:
		queue_free()
	pass # Replace with function body.
