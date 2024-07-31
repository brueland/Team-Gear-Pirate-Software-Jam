extends Node2D

@export var chem2_positive_ghost: PositiveGhost

func _ready():	
	if get_tree().root.get_node("LabMain").CHEM2_flag4:
		chem2_positive_ghost.queue_free()
