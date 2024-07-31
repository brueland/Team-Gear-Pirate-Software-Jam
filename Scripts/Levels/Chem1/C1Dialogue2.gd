extends Area2D

func _ready():
	connect("body_entered", _on_body_entered)
	if get_tree().root.get_node("LabMain").CHEM1_flag4:
		queue_free()

func _on_body_entered(body):
	if body is Player:
		get_tree().root.get_node("LabMain").CHEM1_flag3 = true
		queue_free()

