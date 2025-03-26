extends CharacterBody2D

@export var Spawn: Marker2D

const HORIZONTAL_SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") :
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#constant x speed
	velocity.x = HORIZONTAL_SPEED 
	
	
	
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	for index in get_slide_collision_count():
		var coll = get_slide_collision(index)
		if coll.get_collider() is StaticBody2D:
			position = Spawn.position
			print("Collided with ", coll.get_collider())

