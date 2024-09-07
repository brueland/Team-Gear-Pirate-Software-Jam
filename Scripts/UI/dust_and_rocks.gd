extends CPUParticles2D

@export var particle_texture: Texture2D

func _ready():
	# Set up initial properties
	emitting = false
	lifetime = 4.0
	texture = particle_texture

	direction = Vector2(0, 1)
	spread = 10.0
	gravity = Vector2(0, 80)
	initial_velocity_min = 50.0
	initial_velocity_max = 100.0
	scale_amount_min = 0.5
	scale_amount_max = 2.0

func start():
	emitting = true
	
func stop():
	emitting = false
	






