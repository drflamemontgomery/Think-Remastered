extends Area2D

signal Score


var velocity = Vector2()
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):






func _on_Key_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("Score")
		queue_free()
