extends Node2D

@export var pressure_plate: Node2D
@export var door: Node2D
@export var ghost_spawner: GhostSpawner

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().root.get_node("LabMain").ARCH2_flag2: # you could bug this by entering and leaving the room?
		pressure_plate.queue_free()
		door.queue_free()
