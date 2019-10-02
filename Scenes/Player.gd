extends KinematicBody2D

export (int) var speed = 100

signal retry
signal respawn

var x_vel
var y_vel
var velocity = Vector2()
var speeding = false
var invincible = false
var checkpoint = false

func spawn(pos):
	position = pos

#func _ready():
	#$AnimatedSprite.animation = "mixed"

#func get_invincibility():
#	var press_2 = Input.is_action_just_released("number_2")
#
#	if press_2:
#		if invincible == false:
#			invincible = true
#			self.collision_layer = 4
#			self.collision_mask = 4
#		else:
#			invincible = false
#			self.collision_layer = 1
#			self.collision_mask = 1

func get_input():
	var right = Input.is_action_just_pressed("ui_right")
	var left = Input.is_action_just_pressed("ui_left")
	var up = Input.is_action_just_pressed("ui_up")
	var down = Input.is_action_just_pressed("ui_down")
	var stop = Input.is_action_pressed("stop")
	
#	var S = Input.is_action_just_released("Speed")
#	var P = Input.is_action_pressed("sPeed")
#	var E = Input.is_action_pressed("spEEd")
#	var D = Input.is_action_pressed("speeD")
#
#	if S:
#		if speeding == false:
#			speeding = true
#			speed = 200
#		else:
#			speeding = false
#			speed = 100
	if right:
		velocity = Vector2(speed, 0)
	if left:
		velocity = Vector2(-speed, 0)
	if up:
		velocity = Vector2(0, -speed)
	if down:
		velocity = Vector2(0, speed)
	if stop:
		velocity = Vector2(0, 0)
	#if velocity.length() > 0:
	#	velocity = velocity.normalized() * speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	#get_invincibility()
	
	for idx in get_slide_count():
		var collision = get_slide_collision(idx)
		if collision:
			#print_debug(collision.collider_id)
			if collision.collider.is_in_group("Enemy"):
				die()
	
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_Speed_Boost_Speed_Boost():
	speed *= 2

func die():
	if !checkpoint:
		emit_signal("retry")
	else:
		emit_signal("respawn")
