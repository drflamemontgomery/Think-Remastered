extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var path
var map
var map_instance

func _ready():
	if $RayCast2D:
		$RayCast2D.add_exception(Area2D)

#	print_debug(map)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _on_path_next_level():



func finish_change(level_num):
	match(level_num):
		1:
			$RayCast2D.cast_to = Vector2(0, 50)
			$RayCast2D.position = Vector2(240, 257)
		2:
			$RayCast2D.cast_to = Vector2(0, 50)
			$RayCast2D.position = Vector2(79, 193)
		3:
			#$RayCast2D.queue_free()
			$RayCast2D.cast_to = Vector2(24, 0)
			$RayCast2D.position = Vector2(290, 144)
		4:
			$RayCast2D.cast_to = Vector2(0, 50)
			$RayCast2D.position = Vector2(144, 328)
		5:
			$RayCast2D.cast_to = Vector2(0, 25)
			$RayCast2D.position = Vector2(592, 130)
		6:
			$RayCast2D.cast_to = Vector2(0, 25)
			$RayCast2D.position = Vector2(976, 930)
		7:
			$RayCast2D.cast_to = Vector2(0, 25)
			$RayCast2D.position = Vector2(720, 706)

func next_level(level_num):
	if map_instance != null:
		remove_child(map_instance)
		map_instance.queue_free()
	
	finish_change(level_num)
	path = 'res://Scenes/Level%s.tscn' % level_num
	map = load(path)
	map_instance = map.instance()
	add_child(map_instance)
