extends Node2D

@export var ghost_spawner: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	if (get_tree().root.get_node("LabMain").LANTERN_flag and 
		get_tree().root.get_node("LabMain").SECRET2_flag4):
		ghost_spawner.enabled = true

