extends Camera2D

@export var obj_to_follow: Node2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if obj_to_follow != null:
		position = obj_to_follow.position

