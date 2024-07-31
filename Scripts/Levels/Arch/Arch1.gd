extends Node2D

@export var arch_positive_ghost: PositiveGhost
@export var ghost_spawner: Node

func _ready():
	if get_tree().root.get_node("LabMain").ARCH2_flag4:
		arch_positive_ghost.queue_free()
		ghost_spawner.enabled = true

func _process(_delta):
	if arch_positive_ghost == null:
		get_tree().root.get_node("LabMain").ARCH2_flag4 = true
	
	
