extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var invincible = false
# Called when the node enters the scene tree for the first time.
func get_input():
	var L = Input.is_action_pressed("Logan")
	var W = Input.is_action_pressed("Warner")
	var M = Input.is_action_pressed("Matthew")
	var B = Input.is_action_pressed("Basset")
	
	if L and W and M and B:
		if invincible == false:
			invincible = true
			self.collision_layer = 4
			self.collision_mask = 4
		else:
			invincible = false
			self.collision_layer = 4
			self.collision_mask = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
