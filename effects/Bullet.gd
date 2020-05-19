extends RigidBody2D

onready var animplayer = $AnimationPlayer
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
		queue_free()
	pass # Replace with function body.
