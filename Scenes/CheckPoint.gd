extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal newCheckpoint

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "Inactive"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_CheckPoint_body_entered(body):
	if body.is_in_class("Player"):
		$AnimatedSprite.animation = "Active"
		emit_signal("newCheckpoint")
