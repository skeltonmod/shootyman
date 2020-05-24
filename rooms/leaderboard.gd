extends Control

const score_item = preload("res://rooms/leaderboardItem.tscn")
onready var globals = get_node("/root/GlobalsScore")
var index = 0


func add_item(name,score):
	index += 1
	var item = score_item.instance()
	item.get_node("Label").text = name
	item.get_node("score").text = str(score)
	item.margin_top =  index * 20
	$VBoxContainer/Control.add_child(item)


func render_board(scores):
	for score in scores:
		add_item(score.player_name,score.score)
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "intro":
		yield(SilentWolf.Scores.get_high_scores(5),"sw_scores_received")
		print("Scores from the Leaderboard: " + str(SilentWolf.Scores.scores))
		render_board(SilentWolf.Scores.scores)
	pass # Replace with function body.


func _on_Button_pressed():
	SilentWolf.Scores.persist_score($Button/TextEdit.text, 50)
	pass # Replace with function body.
