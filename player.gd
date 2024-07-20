extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var last_direction = Vector3.FORWARD
var last_turret_direction = Vector3.FORWARD

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		last_direction = direction
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	$Body.rotation.y = lerp_angle($Body.rotation.y, atan2(-last_direction.x, -last_direction.z), delta * 2)

	var turret_input_dir = Input.get_vector("turret_left", "turret_right", "turret_up", "turret_down")
	var turret_direction = (transform.basis * Vector3(turret_input_dir.x, 0, turret_input_dir.y)).normalized()
	if turret_direction:
		last_turret_direction = turret_direction
	
	
	$Turret.rotation.y = lerp_angle($Turret.rotation.y, atan2(-last_turret_direction.x, -last_turret_direction.z), delta * 2)
	
	$Body

	move_and_slide()
