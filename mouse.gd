extends CharacterBody2D
var AIR_SPEED = 100.0
var SPEED = 100.0
const JUMP_MIN_VELOCITY = -400.0
const JUMP_MAX_VELOCITY = -900.0
var JUMP_VELOCITY = JUMP_MIN_VELOCITY
var JUMP_PREPARE = false
var moving_time = 0.0
var jump_direction = 1
var holds = false
var direction = 0
@onready var anim = get_node("AnimationPlayer")
@onready var data = preload("res://Global/data.gd")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	self.position.y = 1100

func _input(event):
	if event is InputEventMouseMotion:
		if (get_global_mouse_position().x < 720/2):
			direction = -1
		else:
			direction = 1
func _physics_process(delta):
	print (self.position.y)
	print ($"../bg/Camera2D".offset.y+1264)
	if self.position.y > ($"../bg/Camera2D".offset.y + 1264):
		queue_free()
		get_tree().change_scene_to_file("res://gameover.tscn")
	if Input.get_axis("ui_left", "ui_right"):
		direction = Input.get_axis("ui_left", "ui_right")
	if is_on_wall():
		direction *= -1
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.x = jump_direction * AIR_SPEED  

	if is_on_floor():
		anim.play("Idle")
		if direction != 0:
			jump_direction = direction 
		velocity.x = 0
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		elif direction > 0:
			$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		anim.play("Jump_Prepare")
		JUMP_PREPARE = true
		if JUMP_VELOCITY >= JUMP_MAX_VELOCITY:
			JUMP_VELOCITY = JUMP_VELOCITY - 10
		if AIR_SPEED < 300:
			AIR_SPEED += 15
	elif not Input.is_action_pressed("ui_accept") and JUMP_PREPARE:
		JUMP_PREPARE = false
		velocity.y = JUMP_VELOCITY
		JUMP_VELOCITY = JUMP_MIN_VELOCITY
		if JUMP_VELOCITY > 0:
			anim.play("Jump")
		else:
			anim.play("Fall")
	move_and_slide()

func _on_area_2d_2_body_entered(body):
	if body.name == "mouse":
		jump_direction *= -1



func _on_area_2d_body_entered(body):
	if body.name == "mouse":
		jump_direction *= -1
