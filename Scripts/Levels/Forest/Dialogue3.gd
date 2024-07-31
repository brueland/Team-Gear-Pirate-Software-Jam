extends Area2D

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body is Player:
		get_tree().root.get_node("LabMain").FOREST1_flag3 = true
		queue_free()
