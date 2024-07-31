extends Node2D

@export var chem1_positive_ghost: PositiveGhost
@export var ghost_spawner: Node


func _ready():	
	if get_tree().root.get_node("LabMain").CHEM1_flag4:
		chem1_positive_ghost.queue_free()

func _process(_delta):
	if get_tree().root.get_node("LabMain").CHEM1_flag4:
		ghost_spawner.enabled = true
