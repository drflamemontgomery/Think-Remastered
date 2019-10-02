extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#signal next_level
# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.spawn($PlayerSpawn.position)
	#print_debug($PlayerSpawn.pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if $RayCast2D.is_colliding():
#		print_debug("colliding")
#		emit_signal("next_level")
		


func _on_Key_Unlock():
	$Key_Block_Green.queue_free()
