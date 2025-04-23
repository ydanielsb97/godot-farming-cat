class_name Feed
extends Area2D

signal food_received(area: Area2D)


func _on_area_entered(area: Area2D) -> void:
	food_received.emit(area)
