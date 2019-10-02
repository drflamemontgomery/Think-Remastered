extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal hurt

export (float) var offset
export (float) var move_time

var invincible
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "Inactive"
	$Start_Timer.wait_time = offset
	$Move_Timer.wait_time = move_time

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Start_Timer_timeout():
	#print_debug("Timer has done", $AnimatedSprite.animation)
	$Move_Timer.start()

func change_anim():
	if $AnimatedSprite.animation == "Inactive":
		$AnimatedSprite.animation = "Active"
	else:
		$AnimatedSprite.animation = "Inactive"

func _on_Move_Timer_timeout():
	#print_debug("Timer has Gone")
	change_anim()
	#print_debug(velocity)
	$Move_Timer.wait_time = move_time
	#$Move_Timer.stop()

func _on_Fire_Tile_body_entered(body):
	if body.has_method("die") && $AnimatedSprite.animation == "Active":
		print_debug("kill body")
		body.die()
	
