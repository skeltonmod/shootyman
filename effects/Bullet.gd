extends RigidBody2D

onready var animplayer = $AnimationPlayer
const enemy = preload("res://enemies/enemy.tscn")
const bullet_hit = preload("res://effects/bullet_impact.tscn")
func _ready():
	animplayer.play("default")
	animplayer.connect("animation_finished",self,"switch_anim")
	pass 


func switch_anim(animation):
	animplayer.play("bullet")
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.




func _on_Bullet_body_entered(body):
	if !body.is_in_group("player"):
		var bullet_hit_instance = bullet_hit.instance()
		
		bullet_hit_instance.global_position = global_position
		bullet_hit_instance.set_as_toplevel(true)
		get_tree().get_root().add_child(bullet_hit_instance)
		queue_free()
	if "enemy" in body.name:
		body.hit()
	pass # Replace with function body.
