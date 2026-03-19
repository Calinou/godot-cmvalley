extends CharacterBody3D

const SPEED = 110.0
const JUMP_VELOCITY = 8.0
const FRICTION = 12.5

var old_visual_position := get_visual_position()
var new_visual_position := get_visual_position()


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("increase_ticks_per_second"):
		Engine.physics_ticks_per_second = wrapi(Engine.physics_ticks_per_second + 5, 10, 130)
	elif event.is_action_pressed("decrease_ticks_per_second"):
		Engine.physics_ticks_per_second = wrapi(Engine.physics_ticks_per_second - 5, 10, 130)

	if event is InputEventMouseMotion:
		$Camera3D.rotation.x -= event.screen_relative.y * 0.001
		$Camera3D.rotation.y -= event.screen_relative.x * 0.001


func _process(_delta: float) -> void:
	# Apply step smoothing with manual physics interpolation (the camera is marked as top-level and has physics interpolation off).
	$Camera3D.global_position = old_visual_position.lerp(new_visual_position, Engine.get_physics_interpolation_fraction())


func _physics_process(delta: float) -> void:
	old_visual_position = get_visual_position()

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = ($Camera3D.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x += direction.x * SPEED * delta
	velocity.z += direction.z * SPEED * delta

	var friction_delta := exp(-FRICTION * delta)
	velocity = Vector3(velocity.x * friction_delta, velocity.y, velocity.z * friction_delta)

	move_and_slide()

	new_visual_position = get_visual_position()
