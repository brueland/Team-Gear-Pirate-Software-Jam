extends Area2D

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body is Player and !get_tree().root.get_node("LabMain").LANTERN_flag:
		get_tree().root.get_node("LabMain").SECRET1_flag3 = true
		queue_free()

	if body is Player and get_tree().root.get_node("LabMain").LANTERN_flag:
		get_tree().root.get_node("LabMain").SECRET1_flag5 = true
		queue_free()
