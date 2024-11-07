extends CharacterBody3D

@export var authority: int = 1
var MOVE_SPEED = 10

func _enter_tree() -> void:
	set_multiplayer_authority(authority)

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		var input_vector = Input.get_vector("left", "right", "up", "down")

		velocity.x = input_vector.x * MOVE_SPEED
		velocity.z = input_vector.y * MOVE_SPEED
		move_and_slide()

		#position.x += input_vector.x * MOVE_SPEED * delta
		#position.z += input_vector.y * MOVE_SPEED * delta
