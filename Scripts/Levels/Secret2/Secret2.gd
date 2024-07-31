extends Node2D

@export var ghost_spawner: Node
@export var SKELETOR_spawn: Node2D
@export var door2: Node2D

@onready var SKELETORScene : PackedScene = preload(GlobalPaths.SKELETOR_PATH)

func _ready():
	if get_tree().root.get_node("LabMain").BIO2_flag5:
		get_tree().root.get_node("LabMain").SECRET2_flag7 = true

func _process(_delta):
	if (get_tree().root.get_node("LabMain").SECRET2_flag6 and 
		!get_tree().root.get_node("LabMain").SECRET2_flag7):
		door2.get_node("DoorStaticBody2D").collision_layer = 0
		
	if (get_tree().root.get_node("LabMain").SECRET2_flag11 and 
		!get_tree().root.get_node("LabMain").SECRET2_flag13):
		get_tree().root.get_node("LabMain").SECRET2_flag13 = true
		var SKELETOR = SKELETORScene.instantiate()
		SKELETOR.global_position = SKELETOR_spawn.global_position
		get_tree().root.call_deferred("add_child", SKELETOR)
