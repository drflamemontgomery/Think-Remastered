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
	pickup_blue = true
	$Blue_Block.collision_layer = 4
	$Blue_Block.collision_mask = 4
	$Blue_Block.hide()

func _on_Green_Key_Unlock():
	pickup_green = true
	$Green_Block.collision_layer = 4
	$Green_Block.collision_mask = 4
	$Green_Block.hide()


func update_level():
	if pickup_blue:
		if $Blue_Key:
			$Blue_Block.queue_free()
			$Blue_Key.queue_free()	
	if pickup_green:
		if $Green_Key:
			$Green_Block.queue_free()
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
		$Blue_Block.collision_layer = 1
		$Blue_Key.collision_mask = 1
		$Blue_Block.collision_mask = 1
		$Blue_Block.show()
		$Blue_Key.show()
	if $Green_Key:
		$Green_Key.collision_layer = 1
		$Green_Block.collision_layer = 1
		$Green_Key.collision_mask = 1
		$Green_Block.collision_mask = 1
		$Green_Block.show()
		$Green_Key.show()

func _on_Player_respawn():
	respawn_update()
	$Player.spawn($PlayerSpawn.position)
