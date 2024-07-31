extends Node2D

@export var bio_positive_ghost: PositiveGhost
@export var ghost_spawner: Node

func _ready():
	if get_tree().root.get_node("LabMain").BIO2_flag4:
		bio_positive_ghost.queue_free()
		ghost_spawner.enabled = true

func _process(_delta):
	if bio_positive_ghost == null:
		get_tree().root.get_node("LabMain").BIO2_flag4 = true
	
	
