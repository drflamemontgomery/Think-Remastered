extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var path
var map
var map_instance

var level = 1
export (int) var num_levels = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	$Main.next_level(level)

func get_input():
	var reset = Input.is_action_just_pressed("reset")
	
	if reset:
		$Main.next_level(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	if $Main:
		if $Main/RayCast2D:
			var colliding = $Main/RayCast2D.is_colliding()
			if colliding:
				if level < num_levels:
					level += 1
					$Main.next_level(level)
				else:
					$Main.queue_free()
					display_End()
		

func display_End():
	$"End Sequence/Graphic Design".show()
	$"End Sequence/Level Design".show()
	$"End Sequence/Original Game".show()
	$"End Sequence/Programming".show()
	$"End Sequence/Title".show()
	$Timer.start()



func _on_Timer_timeout():
	remove_child(map_instance)
	get_tree().reload_current_scene()
