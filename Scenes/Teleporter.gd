extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

export (Vector2) var teleport

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Teleporter_body_entered(body):
	if body.is_in_group("Player"):
		body.position = teleport
		body.velocity = Vector2()
