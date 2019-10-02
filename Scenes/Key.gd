extends Area2D

signal Unlock

export (String) var sprite = "Green"

var velocity = Vector2()
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2(0, 0)
	
	$AnimatedSprite.animation = sprite




func _on_Key_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("Unlock")
		self.collision_layer = 4
		self.collision_mask = 4
		self.hide()
