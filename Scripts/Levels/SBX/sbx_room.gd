extends Node2D

@export var target_scene: String
@export var target_door_name: String

# connect the signal from the transition
func _on_transition_1_body_entered(body):
	if body is Player:
		var main_scene = get_tree().current_scene
		main_scene.load_level(target_scene, target_door_name)
