extends EnemyBaseClass
class_name Ghost

var player: CharacterBody2D

@export var speed: float = 10.0
@export var dir:Vector2

@export var is_Chasing: bool
var is_near_light: bool
@onready var facing_Right: bool = true

@onready var staticsmokeParticles = $GhostSprite/StaticSmokeParticles
@onready var trailParticles = $GhostSprite/TrailParticles

func _ready():
	player = GlobalReferences.playerBody

func  _process(delta):
	move(delta)
	handle_animation()
	handle_particle_position()
	#print(facing_Right)

func move(delta):
	if!is_Chasing:
		pass
	else:
		velocity = position.direction_to(player.position) * speed
	dir.x = abs(velocity.x) / velocity.x
	move_and_slide()
	
	
func handle_animation():
	var animated_sprite = $GhostSprite
	animated_sprite.play("Idle")
	if dir.x < 0:
		animated_sprite.flip_h = true
	elif dir.x > 0:
		animated_sprite.flip_h = false
	facing_Right = !animated_sprite.flip_h

func handle_particle_position():
	if facing_Right:
		staticsmokeParticles.position = Vector2(-11,10)
		trailParticles.position = Vector2(-8,9)
	elif  !facing_Right:
		staticsmokeParticles.position = Vector2(11,10)
		trailParticles.position = Vector2(8,9)
