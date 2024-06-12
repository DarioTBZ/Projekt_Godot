extends CharacterBody2D

@onready var axis = Vector2.ZERO

var MAX_SPEED = 150
var ACCELERATION = 6000


func _physics_process(delta):
	move(delta)




# Movement
func get_input_axis():
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		apply_movement(axis * MAX_SPEED * delta)
		
	move_and_slide()
	
func apply_movement(_accel):
	velocity += axis * MAX_SPEED
	velocity = velocity.limit_length(MAX_SPEED)
