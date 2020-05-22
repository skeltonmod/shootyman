extends Control

onready var score_vars = get_node("/root/GlobalsScore")


func _ready():
	$AnimationPlayer.play("spin")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	$Label.text = str(score_vars.score)
