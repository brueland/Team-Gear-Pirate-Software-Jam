extends Area2D

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body is Player and get_tree().root.get_node("LabMain").SECRET2_flag8:
		get_tree().root.get_node("LabMain").SECRET2_flag9 = true
		queue_free()
