extends Node2D


onready var spawner = $Spawner/Timer
onready var spawner2 = $Spawner2/Timer
onready var globals = get_node("/root/GlobalsScore")
onready var score_label = $score
onready var welcome_text = $welcome/AnimationPlayer
onready var leaderboards = preload("res://rooms/leaderboard.tscn")

func _ready():
	score_label.visible = false
	spawner.paused = true
	spawner2.paused = true
	pass # Replace with function body.
func _process(delta):
	if not globals.in_game or spawner.paused == false:
		if  get_tree().get_nodes_in_group("enemy").size() > 7:
			spawner.paused = true
			spawner2.paused = true
	elif globals.in_game or spawner.paused == true:
		if get_tree().get_nodes_in_group("enemy").size() <= 6:
			spawner.paused = false
			spawner2.paused = false
	if globals.in_game == false and get_tree().get_nodes_in_group("player").size() == 0:
		spawner.paused = true
		spawner2.paused = true
		score_label.visible = false
#	Start the GAME!
	if Input.is_action_just_pressed("ui_shoot"):
#		SilentWolf.Scores.wipe_leaderboard()
#		yield(SilentWolf.Scores.get_high_scores(0,"main"), "sw_scores_received")
#		print("Scores from the Leaderboard: " + str(SilentWolf.Scores.leaderboards["main"]))
		if not globals.welcome_has_played :
			welcome_text.play("frameout")
			globals.welcome_has_played = true
			score_label.visible = true
			globals.in_game = true
	pass
