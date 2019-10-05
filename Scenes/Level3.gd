extends Area2D

func _ready():
	#$Player/Camera2D/Level_Display/Label.text = "Level: 3"
	if $Player:
		$Player.spawn($PlayerSpawn.position)
	#print_debug($PlayerSpawn.pos)
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if $RayCast2D.is_colliding():
#		print_debug("colliding")
#		emit_signal("next_level")
		


func _on_Purple_Key_Unlock():
	$Purple_Block.queue_free()


func _on_White_Key_Unlock():
	$White_Block.queue_free()


func _on_Green_Key_Unlock():
	$Green_Block.queue_free()


func _on_Red_Key_Unlock():
	$Red_Block.queue_free()


func _on_Blue_Key_Unlock():
	$Blue_Block.queue_free()
