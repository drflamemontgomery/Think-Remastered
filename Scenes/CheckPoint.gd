extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var green_key = false
var blue_key = false

signal newCheckpoint

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "Inactive"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_CheckPoint_body_entered(body):
	if body.has_method("die"):
		$AnimatedSprite.animation = "Active"
		emit_signal("newCheckpoint")
