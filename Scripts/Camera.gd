extends Camera2D

func _ready():
	GlobalReferences.camera = self

func set_camera_bounds(camera_bounds):
	limit_bottom = camera_bounds.position.y + camera_bounds.shape.size.y/2.
	limit_top = camera_bounds.position.y - camera_bounds.shape.size.y/2.
	limit_left = camera_bounds.position.x - camera_bounds.shape.size.x/2.
	limit_right = camera_bounds.position.x + camera_bounds.shape.size.x/2.
	
	# need to handle camera zoom, currently setting zoom to constant size in main camera
