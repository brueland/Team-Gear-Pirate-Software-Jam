extends Node2D

@export var connected_door1: Node2D
@export var connected_door2: Node2D
@export var click_sound: AudioStream

@onready var animations = $PressurePlateAnimatedSprite2D


func _on_pressure_plate_area_2d_body_entered(body):
	if body is Player and get_tree().root.get_node("LabMain").SECRET2_flag7:
		connected_door1.visible = true
		connected_door1.get_node("DoorStaticBody2D").collision_layer = 1
		connected_door2.visible = true
		connected_door2.get_node("DoorStaticBody2D").collision_layer = 1
		animations.play("press_down")
		AudioManager.play_sound(click_sound)
		
func unlock_door():
	connected_door1.visible = false
	connected_door1.get_node("DoorStaticBody2D").collision_layer = 0
	queue_free()
