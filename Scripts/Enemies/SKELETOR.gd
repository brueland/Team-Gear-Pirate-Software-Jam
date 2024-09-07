extends CharacterBody2D
class_name skeletor

var player: CharacterBody2D

@export var speed: float = 50.0
@export var is_Chasing: bool = true

@export var skeletor_scream: AudioStream
@export var glass_break: AudioStream
@export var building_collapse: AudioStream
@export var bone_break: AudioStream

var direction: int = 1
var sprite_direction: String = "right_"

@onready var animated_sprite = $SkeletorAnimatedSprite2D
@onready var sprite = $SkeletorAnimatedSprite2D/SkeletorSprite2D
@onready var collider = $SkeletorCollider

func _ready():
	animated_sprite.play("default")
	player = GlobalReferences.playerBody
	GlobalReferences.SKELETOR = self

func  _physics_process(delta):
	chase_player(delta)
	handle_animation()
	move_and_slide()

func _process(_delta):
	var i = randi_range(0,150)
	if i == 10:
		AudioManager.play_sound(glass_break)
	elif i == 20:
		AudioManager.play_sound(building_collapse)
	elif i == 30:
		AudioManager.play_sound(bone_break)
	if get_tree().root.get_node("LabMain").finished_flag:
		queue_free()
		
func chase_player(delta):
	var target_position_noise = randf_range(0.5, 1.50)
	var target_position = player.position*target_position_noise+Vector2(0.0, -50.0)
	
	velocity = lerp(velocity, position.direction_to(target_position) * speed, delta)
	
	if velocity.x < 0.0:
		direction = -1
	elif velocity.x > 0.0:
		direction = 1

func handle_animation():	
	if direction < 0:
		animated_sprite.flip_h = true
		sprite.flip_h = true
		sprite.position = Vector2(-8,0)
		
	elif direction > 0:
		AudioManager.play_sound(skeletor_scream)
		animated_sprite.flip_h = false
		sprite.flip_h = false
		sprite.position = Vector2(7,1)
