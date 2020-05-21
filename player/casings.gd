extends Position2D


const bullet = preload("res://effects/bullet_casing.tscn")
const speed = 60
# Called when the node enters the scene tree for the first time.
func spawn_casing(direction):
	var bullet_instance = bullet.instance()
	bullet_instance.global_position = global_position
	bullet_instance.linear_velocity  = Vector2(20 * direction,-50) * 5
	bullet_instance.angular_velocity = 20.0
	bullet_instance.set_as_toplevel(true)
	add_child(bullet_instance)

