extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	match direction:
		Vector2.LEFT:
			animated_sprite_2d.play("walk_left")
		Vector2.RIGHT:
			animated_sprite_2d.play("walk_right")
		Vector2.DOWN:
			animated_sprite_2d.play("walk_front")
		Vector2.UP:
			animated_sprite_2d.play("walk_back")
	
	if direction != Vector2.ZERO:
		player.player_direction = direction
	
	player.velocity = direction * speed
	player.move_and_slide()


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
