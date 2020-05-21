extends AnimatedSprite


func _ready():
	pass
func flash(type = 1):
	match type:
		1:
			$AnimationPlayer.play("white")
		2:
			$AnimationPlayer.play("red")
