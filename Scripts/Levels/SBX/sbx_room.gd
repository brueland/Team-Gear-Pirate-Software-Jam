extends Node2D

@export var target_scene: String
@export var target_door_name: String

@export var cameraLimitLeft: float = -100
@export var cameraLimitRight: float = 100
@export var cameraLimitTop: float = -100
@export var cameraLimitBottom: float = 100

# connect the signal from the transition
func _on_transition_1_body_entered(body):
	if body is Player:
		var main_scene = get_tree().current_scene
		main_scene.load_level(target_scene, target_door_name)
		GlobalReferences.camera.limit_left = cameraLimitLeft
		GlobalReferences.camera.limit_right = cameraLimitRight
		GlobalReferences.camera.limit_top = cameraLimitTop
		GlobalReferences.camera.limit_bottom = cameraLimitBottom
