extends EnemyBaseClass
class_name PositiveGhost

var player: CharacterBody2D

@export var speed: float = 50.0
@export var max_health: float = 10.0
@onready var current_health: float = max_health

@export var shader_resource: Shader
@export var shader_noise_texture: Texture
@export var ghost_noise: AudioStream

var in_light: bool = false
var direction: int = 1
var sprite_direction: String = "right_"
var dying: bool = false
var phasing_in: bool = false
var phasing_out: bool = false

@onready var sprite = $GhostSprite
@onready var collider = $GhostCollider
@onready var intent: bool = get_meta("Positive_Ghost", false)

func _ready():
	player = GlobalReferences.playerBody
	var unique_material = ShaderMaterial.new()
	unique_material.shader = shader_resource
	sprite.material = unique_material
	
	sprite.material.set_shader_parameter("alpha", 1)
	sprite.material.set_shader_parameter("distortion_strength", 0.02)
	sprite.material.set_shader_parameter("dissolve_percent", 0)
	sprite.material.set_shader_parameter("dissolve_noise", shader_noise_texture)
	sprite.material.set_shader_parameter("dissolve_noise2", shader_noise_texture)
	sprite.material.set_shader_parameter("dissolve_noise3", shader_noise_texture)
	AudioManager.play_sound(ghost_noise)

func  _physics_process(delta):
	velocity = lerp(velocity, Vector2.ZERO, delta*40)
		
	if !dying:
		handle_animation()
		heal(delta)
		if phasing_in:
			set_collision_layer_value(5, false)
			phase_in(delta)
		if phasing_out:
			set_collision_layer_value(5, false)
			phase_out(delta)
	else:
		
		dying_sequence(delta)
	move_and_slide()

func handle_animation():	
	if direction < 0:
		sprite_direction = "right_"
		sprite.flip_h = true
	elif direction > 0:
		sprite_direction = "left_"
		sprite.flip_h = false

func phase_out(delta):
	var alpha_strength = sprite.material.get_shader_parameter("alpha")
	if alpha_strength > 0:
		sprite.material.set_shader_parameter("alpha", alpha_strength - (delta))
	
func phase_in(delta):
	var alpha_strength = sprite.material.get_shader_parameter("alpha")
	set_collision_layer_value(5, false)
	if alpha_strength < 1:
		sprite.material.set_shader_parameter("alpha",  alpha_strength + (delta/2.0))
	
func take_damage(damage_amount):
	current_health -= damage_amount
	current_health = max(current_health, 0)
		
	if current_health <= 0:
		dying = true

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
