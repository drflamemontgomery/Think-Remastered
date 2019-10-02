extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var direction
export (float) var offset
export (float) var move_time
export (int) var speed


#var move_queued = false
var moving = false
var invincible = false


var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Start_Timer.wait_time = offset
	$Move_Timer.wait_time = move_time
	$Start_Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.collider.has_method("die"):
			collision.collider.die()
		else:
			if moving:
				change_direction(direction)
				if $Move_Timer.get_time_left() == 0:
					moving = false

					$Move_Timer.wait_time = 0
					$Move_Timer.start(move_time)


func _on_Start_Timer_timeout():
	moving = true
	move_enemy()


func change_direction(dir):
	match(dir):
		"right":
			direction = "left"
		"left":
			direction = "right"
		"down":
			direction = "up"
		"up":
			direction = "down"


func move_enemy():
	match(direction):
		"down":
			velocity = Vector2(0, 1)
		"up":
			velocity = Vector2(0, -1)
		"left":
			velocity = Vector2(-1, 0)
		"right":
			velocity = Vector2(1, 0)

func _on_Move_Timer_timeout():
	moving = true
	move_enemy()
