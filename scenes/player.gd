extends CharacterBody2D


const SPEED: int = 200
const ACCELERATION: int = 10
const FRICTION: int = 15
const JUMP_VELOCITY: int = -300


@onready var jump_buffer_timer: Timer = $Timer/JumpBufferTimer
@onready var coyote_timer: Timer = $Timer/CoyoteTimer


func _physics_process(delta: float) -> void:
    # Add the gravity.
    if not is_on_floor():
        velocity += get_gravity() * delta

    # Handle jump.
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY
    
    var direction := Input.get_axis("left", "right")
    
    run(delta, direction)

    move_and_slide()


func run(delta: float, direction: float) -> void:
    var body_weight: float = delta * (ACCELERATION if direction else FRICTION)
    velocity.x = lerp(velocity.x, direction * SPEED, body_weight)


func jump() -> void:
    pass
