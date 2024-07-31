extends Node2D
@export var connected_door: Node2D
@export var one_shot: bool = false

var door_body: CollisionShape2D
@onready var animations = $PressurePlateAnimatedSprite2D

func _ready():
	door_body = connected_door.get_node("DoorStaticBody2D/DoorCollisionShape2D")

func _on_pressure_plate_area_2d_body_entered(body):
	if body is Player:
		connected_door.visible = false
		connected_door.get_node("DoorStaticBody2D").collision_layer = 0
		animations.play("press_down")

func _on_pressure_plate_area_2d_body_exited(body):
	if body is Player:
		if !one_shot:
			connected_door.visible = true
			connected_door.get_node("DoorStaticBody2D").collision_layer = 1
			animations.play("reset")
