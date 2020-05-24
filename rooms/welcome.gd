extends Control



func _ready():
	$AnimationPlayer.play("intro")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "intro":
		$AnimationPlayer.play("blink")
	pass # Replace with function body.
