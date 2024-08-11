extends Node

@export var timerLabel :Label

@export var live1 :TextureRect
@export var live2 :TextureRect
@export var live3 :TextureRect

var liveSprites: Array[TextureRect]

func _ready():
	liveSprites = [live1, live2, live3]
	timerLabel.text = str(60)
	
func _on_game_manager_player_health_update(new_player_health):
	print("PlayerHit! New Health: " + str(new_player_health))
	liveSprites[new_player_health].visible = false

func _on_game_manager_timer_update(new_time):
	timerLabel.text = str(new_time)
