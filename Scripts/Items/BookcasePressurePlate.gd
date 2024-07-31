extends Node2D
@export var connected_bookcase: Node2D
@export var one_shot: bool = false
@export var click_sound: AudioStream

@onready var animations = $PressurePlateAnimatedSprite2D

func _ready():
	connected_bookcase.get_node("MovingBookcaseStaticBody2D").collision_layer = 0
	connected_bookcase.get_node("MovingBookcaseStaticBody2D").collision_mask = 0

func _on_pressure_plate_area_2d_body_entered(body):
	
	if body is Player:
		connected_bookcase.get_node("MovingBookcaseAnimatedSprite2D").play("move_forward")
		await connected_bookcase.get_node("MovingBookcaseAnimatedSprite2D").animation_finished
		connected_bookcase.z_index = 0
		connected_bookcase.get_node("MovingBookcaseStaticBody2D").collision_layer = 1
		animations.play("press_down")
		AudioManager.play_sound(click_sound)
		
	# Play door unlocking sound
	# switch door sprite to "open door"?

func _on_pressure_plate_area_2d_body_exited(body):
	if body is Player:
		if !one_shot:

			connected_bookcase.get_node("MovingBookcaseAnimatedSprite2D").play("reset")
			await connected_bookcase.get_node("MovingBookcaseAnimatedSprite2D").animation_finished
			connected_bookcase.z_index = -1
			
			connected_bookcase.get_node("MovingBookcaseStaticBody2D").collision_layer = 0
			animations.play("reset")
			AudioManager.play_sound(click_sound)
