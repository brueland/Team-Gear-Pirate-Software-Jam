extends Node2D

@export var arch_positive_ghost: PositiveGhost
@export var ghost_phaser: Area2D
@export var ghost_spawner: Node
@export var escape_door: Node2D
@export var pressure_plate: Node2D

func _ready():	
	if get_tree().root.get_node("LabMain").SECRET2_flag4:
		arch_positive_ghost.queue_free()
		ghost_phaser.queue_free()
		ghost_spawner.enabled = true
		pressure_plate.one_shot = true
	
	if get_tree().root.get_node("LabMain").SKELTOR_flag:
		escape_door.queue_free()
