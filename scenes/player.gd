extends CharacterBody2D


const SPEED: int = 200
const ACCELERATION: int = 10
const FRICTION: int = 15
const JUMP_VELOCITY: int = -300

var coyote_time_activated: bool = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var jump_buffer_timer: Timer = $Timer/JumpBufferTimer
@onready var coyote_timer: Timer = $Timer/CoyoteTimer


func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta
    
    var direction := Input.get_axis("left", "right")
    
    run(delta, direction)
    jump()
    animation(direction)

    move_and_slide()


func run(delta: float, direction: float) -> void:
    var body_weight: float = delta * (ACCELERATION if direction else FRICTION)
    velocity.x = lerp(velocity.x, direction * SPEED, body_weight)


func jump() -> void:
    if is_on_floor():
        coyote_time_activated = false
    else:
        if coyote_timer.is_stopped() and !coyote_time_activated:
            coyote_timer.start()
            coyote_time_activated = true
        
        if Input.is_action_just_released("jump") or is_on_ceiling():
            velocity.y *= 0.1
    
    if Input.is_action_just_pressed("jump"):
        if jump_buffer_timer.is_stopped():
            jump_buffer_timer.start()
    
    if !jump_buffer_timer.is_stopped() and (!coyote_timer.is_stopped() or is_on_floor()):
        velocity.y = JUMP_VELOCITY
        jump_buffer_timer.stop()
        coyote_timer.stop()
        coyote_time_activated = true


func animation(direction: float) -> void:
    if direction > 0:
        sprite.flip_h = false
    elif direction < 0:
        sprite.flip_h = true
