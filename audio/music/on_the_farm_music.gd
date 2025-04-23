extends AudioStreamPlayer2D

func _ready() -> void:
	call_deferred("play")
