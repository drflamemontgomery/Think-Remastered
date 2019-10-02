extends Area2D

var pickup_green = false
var pickup_blue = false

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
	print_debug("Blue key signal")
	pickup_blue = true
	$Block.layer_change(4, 1)
	$Block.mask_change(4, 1)
	$Block/AnimatedSprite.hide()

func _on_Green_Key_Unlock():
	print_debug("Green key signal")
	pickup_green = true
	$Block2.layer_change(4, 1)
	$Block2.mask_change(4, 1)
	$Block2/AnimatedSprite.hide()


func update_level():
	if pickup_blue:
		if $Blue_Key:
			$Block.queue_free()
			$Blue_Key.queue_free()	
	if pickup_green:
		if $Green_Key:
			$Block2.queue_free()
			$Green_Key.queue_free()


func _on_CheckPoint_newCheckpoint():
	update_level()
	$CheckPoint2/AnimatedSprite.animation = "Inactive"
	$CheckPoint3/AnimatedSprite.animation = "Inactive"
	$PlayerSpawn.position = $CheckPoint.position
	$Player.checkpoint = true

func _on_CheckPoint3_newCheckpoint():
	update_level()
	$CheckPoint/AnimatedSprite.animation = "Inactive"
	$CheckPoint2/AnimatedSprite.animation = "Inactive"
	$PlayerSpawn.position = $CheckPoint3.position
	$Player.checkpoint = true

func _on_CheckPoint2_newCheckpoint():
	update_level()
	$CheckPoint/AnimatedSprite.animation = "Inactive"
	$CheckPoint3/AnimatedSprite.animation = "Inactive"
	$PlayerSpawn.position = $CheckPoint2.position
	$Player.checkpoint = true

func respawn_update():
	if $Blue_Key:
		$Blue_Key.collision_layer = 1
		$Block.layer_change(1, 4)
		$Blue_Key.collision_mask = 1
		$Block.mask_change(1, 4)
		$Block/AnimatedSprite.show()
		$Blue_Key.show()
		pickup_blue = false
	if $Green_Key:
		#$Block2.layer_change(1, 4)
		#$Block2.mask_change(1, 4)
		$Green_Key.collision_layer = 1
		$Green_Key.collision_mask = 1
		$Block2/AnimatedSprite.show()
		$Green_Key.show()
		pickup_green = false

func _on_Player_respawn():
	respawn_update()
	$Player.spawn($PlayerSpawn.position)
