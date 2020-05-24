extends Control

var score = 0
var high_score = 0

var in_game: bool = false
var welcome_has_played: bool = false
var game_over: bool = false
func _ready():
	SilentWolf.configure({
		"api_key": "HdCHXbKfkmahEBDvzo1Yy1XbWWfOXlRa4WKcbOS6",
		"game_id": "shootyman",
		"game_version": "1.0.0",
		"log_level": 1
	})
	print("This should be called!")
	pass
