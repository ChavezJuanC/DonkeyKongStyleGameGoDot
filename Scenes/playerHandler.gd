class_name Player
extends CharacterBody2D

@export var gravity :int = 560
@export var jumpSpeed :int = 280
@export var movementSpeed :int = 150
@export var playerSprite: Sprite2D

signal player_hit()

func _physics_process(delta):
	
	#movement
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = movementSpeed * direction
	
	if direction != 0:
		playerSprite.scale.x = direction
 
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	##jump
	var jump_pressed: bool = Input.is_action_just_pressed("jump")
	if jump_pressed and is_on_floor():
		velocity.y -= jumpSpeed

	move_and_slide()

func take_damage():
	print("Ouchhhhhh")
	player_hit.emit()

