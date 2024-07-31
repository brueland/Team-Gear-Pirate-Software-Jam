extends Area2D

@export var pressure_plate: Node2D

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body is Player and get_tree().root.get_node("LabMain").SECRET2_flag10:
		get_tree().root.get_node("LabMain").SECRET2_flag11 = true
		pressure_plate.unlock_door()
		
		queue_free()
		
