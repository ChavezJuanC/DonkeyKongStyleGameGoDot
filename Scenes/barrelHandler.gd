class_name BarrelHandler
extends RigidBody2D

@export var tooLow = 1000
@export var barrelSprite: Sprite2D
@export var barrel_red: Texture

var dameged_player: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if position.y >= tooLow:
		print("Destroying obj..")
		queue_free();
		
func _on_body_entered(body):
	if body is Player and !dameged_player:
		dameged_player = true
		barrelSprite.texture = barrel_red
		if (body.has_method("take_damage")):
			body.take_damage()

