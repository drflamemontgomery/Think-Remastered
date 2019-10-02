extends Area2D

signal next_level

func _on_Finish_area_entered(area):
	if area.is_in_group("Player"):
		print_debug("Next level")
		emit_signal("next_level")
