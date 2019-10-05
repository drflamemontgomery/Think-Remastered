extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.spawn($PlayerSpawn.position)
	#$Player/Camera2D/Level_Display/Label.text = "Level: 5"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_retry():
	var main = get_parent()
	print_debug(main)
	main.next_level(5)
	queue_free()
