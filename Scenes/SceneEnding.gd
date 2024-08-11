extends CanvasLayer

const _1_LEVEL_1 = "res://Scenes/1-level_1.tscn"
@export var titleLabel : Label
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_button_button_down():
	get_tree().change_scene_to_file(_1_LEVEL_1)

func set_title(title :String):
	titleLabel.text = title
	
