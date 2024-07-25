extends EnemyBaseClass
class_name Drone

var player: CharacterBody2D

@export var speed: float = 50.0

# Y offset to have drone "hover" above player
@export var hover_offset: float = -60.0
@export var is_chasing: bool = true


var direction: int = 1
var sprite_direction: String = "right_"

@onready var sprite = $DroneSprite

var is_near_light: bool

func _ready():
	sprite.play("Idle")
	player = GlobalReferences.playerBody

func  _physics_process(delta):
	if is_chasing:
		chase_player(delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta)
	move_and_slide()

func chase_player(delta):
	var target_position = player.position + Vector2(0.0, hover_offset)
	velocity = lerp(velocity, position.direction_to(target_position) * speed, delta) 
	
	if velocity.x < 0.0:
		direction = -1
	elif velocity.x > 0.0:
		direction = 1
