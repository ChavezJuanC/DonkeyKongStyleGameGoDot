extends Node2D

@export var animationPlayer :AnimationPlayer
@export var launchTimer :Timer
const BARREL = preload("res://Scenes/barrel.tscn")

#func _ready():
	##connet function to timer's node timoeut() signal to run function after time out/ wait_time.
	#launchTimer.connect("timeout", _on_barrel_timer_timeout) #you can click and connect signals or use the connet method.

func launch_barrels():
	var barrel_instance = BARREL.instantiate()
	barrel_instance.position = Vector2(409.6829, 308.9886) ##hardcoded cause wtf
	add_child(barrel_instance)
	animationPlayer.play("Idle")

func _on_barrel_timer_timeout():
	animationPlayer.play("Launching", -1, 1.0, false) #this will play animation and animation will trigger launch fucntion.
	launchTimer.wait_time = randf_range(2, 5) ##will launch every 2-5 secs
