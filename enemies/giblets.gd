extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn(direction):
	self.linear_velocity = Vector2(5 * direction,rand_range(-20,-40)) * 20 
	self.angular_velocity = 20.0
	pass

func _on_Timer_timeout():
	$CollisionShape2D.call_deferred("set_disabled",true)
	gravity_scale = 0
	queue_free()
	pass # Replace with function body.
