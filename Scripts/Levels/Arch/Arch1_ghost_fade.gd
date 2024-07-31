extends Area2D

@export var arch_positive_ghost: PositiveGhost

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	
func _on_body_entered(body):
	if body is Player:
		arch_positive_ghost.phasing_in = false
		get_tree().root.get_node("LabMain").ARCH1_flag1 = true
		arch_positive_ghost.phasing_out = true
	
func _on_body_exited(body):
	if body is Player:
		arch_positive_ghost.phasing_out = false
		get_tree().root.get_node("LabMain").ARCH1_flag3 = true
		arch_positive_ghost.phasing_in = true
	
