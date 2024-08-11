class_name GameManager
extends Node

@export var allowedTime: float
const scene_ending_file = "res://Scenes/scene_ending.tscn"

var score :int = 0
var lifes :int = 3
# Called when the node enters the scene tree for the first time.
signal player_health_update(new_player_health)
signal timerUpdate(new_time :int)

func game_over():
	call_deferred("change_scene", scene_ending_file)

func change_scene(scene_file):
	get_tree().change_scene_to_file(scene_file)

func game_victory():
	var scene_ending_instance = preload(scene_ending_file).instantiate()
	scene_ending_instance.set_title("You Win!")
	call_deferred("add_child", scene_ending_instance)

	
##signals
func _on_player_player_hit():
	if lifes > 0:
		lifes -= 1
		player_health_update.emit(lifes)
	else:
		game_over()

func _on_area_2d_body_entered(_body):
	game_victory()

func _on_timer_timeout():
	
	if allowedTime > 0:
		allowedTime -= 1
	if allowedTime <= 0:
		game_over()
	
	timerUpdate.emit(allowedTime)

