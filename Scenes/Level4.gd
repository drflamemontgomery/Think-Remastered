extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Player/Camera2D/Level_Display/Label.text = "Level: 4"
	$Player.spawn($PlayerSpawn.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Key_Unlock():
	$Purple_Key_Block.queue_free()


func _on_Player_retry():
	var main = get_parent()
	print_debug(main)
	main.next_level(4)
	queue_free()
