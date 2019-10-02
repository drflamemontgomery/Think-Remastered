extends Area2D

func _ready():
	$PlayerSpawn.position = Vector2(80, 144)
	if $Player:
		$Player.spawn($PlayerSpawn.position)
		
	#$Green_Block.queue_free()
	#$Blue_Block.queue_free()

func _on_Player_retry():
	var main = get_parent()
	print_debug(main)
	main.next_level(6)
	queue_free()
		

func _on_Blue_Key_Unlock():
	$Blue_Block.queue_free()

func _on_Green_Key_Unlock():
	$Green_Block.queue_free()




func _on_CheckPoint_newCheckpoint():
	$CheckPoint2/AnimatedSprite.animation = "Inactive"
	$CheckPoint3/AnimatedSprite.animation = "Inactive"
	$PlayerSpawn.position = $CheckPoint.position
	$Player.checkpoint = true

func _on_CheckPoint3_newCheckpoint():
	$CheckPoint/AnimatedSprite.animation = "Inactive"
	$CheckPoint2/AnimatedSprite.animation = "Inactive"
	$PlayerSpawn.position = $CheckPoint3.position
	$Player.checkpoint = true

func _on_CheckPoint2_newCheckpoint():
	$CheckPoint/AnimatedSprite.animation = "Inactive"
	$CheckPoint3/AnimatedSprite.animation = "Inactive"
	$PlayerSpawn.position = $CheckPoint2.position
	$Player.checkpoint = true
