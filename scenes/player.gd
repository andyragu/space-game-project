extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 150.0

func get_input():
	var dir_x = Input.get_axis("ui_left", "ui_right")
	var dir_y = Input.get_axis("ui_up", "ui_down")
	
	var dir = Vector2(dir_x, dir_y).normalized()
	
	velocity = dir * SPEED
	handle_movement_animation(dir)
	
func _physics_process(_delta):
	get_input()
	move_and_slide()

func handle_movement_animation(dir):
	##TODO: Change movement from keys to point and click
	if dir > Vector2(0, 0):
		animated_sprite.play("move-r")
	elif  dir == Vector2(0, 0):
		animated_sprite.play("idle")
	elif dir < Vector2(0, 0):
		animated_sprite.play("move-d")
