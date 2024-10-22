extends CanvasLayer

signal transitioned

var faded := true
@export var player : Player

var start := true

var fall := true
var savePoint := true
var dream1 := false

func _ready():
	fadetonormal()

func fadetonormal():
	$AnimationPlayer.play("Fade_To_Normal")

func transition():
	$AnimationPlayer.play("Fade_To_Black")

func _on_animation_player_animation_finished(anim_name):
	var currentSceneName = get_tree().get_current_scene().name
	if anim_name == "Fade_To_Black" and currentSceneName == "MainMenu":
		emit_signal("transitioned")
		get_tree().change_scene_to_file(GlobalPaths.LAB_MAIN_PATH)
