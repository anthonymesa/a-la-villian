extends Node2D

@export var speed : float = 100
@export var joystick_left : VirtualJoystick
@export var joystick_right : VirtualJoystick

var move_vector := Vector2.ZERO

func _ready():
	joystick_left = $"/root/Main/UI/Virtual joystick left"
	joystick_right = $"/root/Main/UI/Virtual joystick right"

func _process(delta: float) -> void:
#	# Movement using the joystick output:
#	if joystick_left and joystick_left.is_pressed:
#		position += joystick_left.output * speed * delta
	
	# Movement using Input functions:
	move_vector = Vector2.ZERO
	move_vector.x = Input.get_axis("ui_left", "ui_right")
	move_vector.y = Input.get_axis("ui_up", "ui_down")
	position += move_vector * speed * delta
	
	if move_vector.length() == 0:
		if $AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.play("walk_down")
			$AnimatedSprite2D.pause()
			return
	
	if abs(move_vector.x) > abs(move_vector.y):
		if move_vector.x > 0:
			$AnimatedSprite2D.play("walk_right")
		else:
			$AnimatedSprite2D.play("walk_left")
	else:
		if move_vector.y > 0:
			$AnimatedSprite2D.play("walk_down")
		else:
			$AnimatedSprite2D.play("walk_up")
	
	# Rotation:
	#if joystick_right and joystick_right.is_pressed:
	#	rotation = joystick_right.output.angle()
