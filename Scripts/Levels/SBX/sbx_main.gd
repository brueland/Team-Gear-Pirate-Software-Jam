extends Node
class_name MainLevel

@onready var LevelContainer: Node = $LevelContainer

@export var player: Player

@export var first_room: String
@export var room_entrance: String

func _ready():
	player = GlobalReferences.playerBody	
	load_level(first_room, room_entrance)

# Function to load a level
func load_level(level_path: String, level_entrance: String):
	# Defer the entire process to avoid modification during physics processing
	call_deferred("_deferred_load_level", level_path, level_entrance)

func _deferred_load_level(level_path: String, level_entrance: String):
	# Clear the current level
	if LevelContainer.get_child_count() > 0:
		queue_free_children()
	
	# Load the new level scene
	var new_level = load(GlobalPaths.get(level_path)).instantiate()

	# Add the new level to the LevelContainer
	LevelContainer.add_child(new_level)
	# Get the target door in the new scene
	var target_door = new_level.get_node(level_entrance)

	if target_door:
		# Position the player at the target door
		player.global_position = target_door.global_position

	
# Helper function to clear children
func queue_free_children():
	for child in LevelContainer.get_children():
		child.queue_free()
