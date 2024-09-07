extends Camera2D

var shake_amount : float = 0
var default_offset : Vector2 = offset
var current_shake : Vector2 = Vector2.ZERO
var shake_decay : float = 0.1  # Controls how quickly the shake effect decays
var noise : FastNoiseLite  # For smoother random movement
var noise_y : float = 0

func _ready():
	GlobalReferences.camera = self
	noise = FastNoiseLite.new()
	noise.seed = randi()
	set_process(false)
	
func set_camera_bounds(camera_bounds):
	limit_bottom = camera_bounds.position.y + camera_bounds.shape.size.y/2.
	limit_top = camera_bounds.position.y - camera_bounds.shape.size.y/2.
	limit_left = camera_bounds.position.x - camera_bounds.shape.size.x/2.
	limit_right = camera_bounds.position.x + camera_bounds.shape.size.x/2.
	# need to handle camera zoom, currently setting zoom to constant size in main camera    

func _process(delta):	
	# Use noise for smoother random movement
	noise_y += delta * 100  # Control speed of noise change
	var noise_vector = Vector2(
		noise.get_noise_2d(1, noise_y) * shake_amount,
		noise.get_noise_2d(100, noise_y) * shake_amount
	)
	
	# Interpolate towards the target shake
	current_shake = current_shake.lerp(noise_vector, shake_decay)
	
	offset = default_offset + current_shake

func shake(amount: float):
	shake_amount = amount
	noise_y = 0
	set_process(true)

func stop_shake():
	set_process(false)
