extends EnemyBaseClass
class_name Ghost

var player: CharacterBody2D

@export var speed: float = 50.0
@export var is_Chasing: bool
@export var max_health: float = 10.0
@onready var current_health: float = max_health

@export var shader_resource: Shader
@export var shader_noise_texture: Texture
@export var ghost_noise: AudioStream

var in_light: bool = false
var direction: int = 1
var sprite_direction: String = "right_"
var dying: bool = false

@onready var staticsmokeParticles = $GhostSprite/StaticSmokeParticles
@onready var trailParticles = $GhostSprite/TrailParticles
@onready var sprite = $GhostSprite
@onready var collider = $GhostCollider

func _ready():
	sprite.play("Idle")
	player = GlobalReferences.playerBody
	var unique_material = ShaderMaterial.new()
	unique_material.shader = shader_resource
	sprite.material = unique_material
	
	sprite.material.set_shader_parameter("alpha", 1)
	sprite.material.set_shader_parameter("distortion_strength", 0)
	sprite.material.set_shader_parameter("dissolve_percent", 0)
	sprite.material.set_shader_parameter("dissolve_noise", shader_noise_texture)
	sprite.material.set_shader_parameter("dissolve_noise2", shader_noise_texture)
	sprite.material.set_shader_parameter("dissolve_noise3", shader_noise_texture)

func  _physics_process(delta):
	if is_Chasing and !in_light:
		chase_player(delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta*40)
		
	if !dying:
		handle_animation()
		handle_particle_position()
		#handle_particle_ratio()
		heal(delta)
	else:
		dying_sequence(delta)
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
		
func handle_particle_ratio():
	staticsmokeParticles.amount_ratio = clamp(current_health/max_health, 0.1, 1.0)

func take_damage(damage_amount):
	current_health -= damage_amount
	current_health = max(current_health, 0)
		
	if current_health <= 0:
		dying = true
		is_Chasing = false

func dying_sequence(delta):
	set_collision_layer_value(5, false)
	var distortion_strength = sprite.material.get_shader_parameter("distortion_strength")
	var dissolve_percent = sprite.material.get_shader_parameter("dissolve_percent")

	if distortion_strength < 1:
		sprite.material.set_shader_parameter("distortion_strength", clamp(distortion_strength + delta, 0, 1))
	elif dissolve_percent < 1:
		sprite.material.set_shader_parameter("dissolve_percent", clamp(dissolve_percent + delta, 0, 1))
	else:
		queue_free()

func heal(delta):
	if !dying and !in_light and current_health < max_health:
		current_health += delta
	current_health = min(current_health, max_health)

func play_random_sound():
	var i = randi_range(0,50)
	if i == 25:
		AudioManager.play_sound(ghost_noise)
