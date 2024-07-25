extends EnemyBaseClass
class_name Ghost

var player: CharacterBody2D

@export var speed: float = 50.0
@export var is_Chasing: bool

var direction: int = 1
var sprite_direction: String = "right_"

@onready var staticsmokeParticles = $GhostSprite/StaticSmokeParticles
@onready var trailParticles = $GhostSprite/TrailParticles
@onready var sprite = $GhostSprite
@onready var collider = $GhostCollider

var is_near_light: bool

func _ready():
	sprite.play("Idle")
	player = GlobalReferences.playerBody

func  _physics_process(delta):
	if is_Chasing:
		chase_player(delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta)
	handle_animation()
	handle_particle_position()
	move_and_slide()

func chase_player(delta):
	var target_position_noise = randf_range(0.90, 1.10)
	var target_position = player.position*target_position_noise
	
	velocity = lerp(velocity, position.direction_to(target_position) * speed, delta) 
	
	if velocity.x < 0.0:
		direction = -1
	elif velocity.x > 0.0:
		direction = 1

func handle_animation():	
	if direction < 0:
		sprite_direction = "right_"
		sprite.flip_h = true
	elif direction > 0:
		sprite_direction = "left_"
		sprite.flip_h = false

func handle_particle_position():
	if direction > 0:
		staticsmokeParticles.position = Vector2(-11,10)
		trailParticles.position = Vector2(-8,9)
	else:
		staticsmokeParticles.position = Vector2(11,10)
		trailParticles.position = Vector2(8,9)
		
