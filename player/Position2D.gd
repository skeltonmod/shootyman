extends Position2D

const bullet = preload("res://effects/Bullet.tscn")
const bullet_speed = 500

func shoot(direction):
	var bullet_instance = bullet.instance()
	bullet_instance.global_position = global_position
	bullet_instance.linear_velocity = Vector2(bullet_speed * direction,0)
	bullet_instance.set_as_toplevel(true)
	add_child(bullet_instance)
