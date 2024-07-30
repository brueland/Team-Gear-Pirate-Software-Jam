extends Node

# Player Sprite
@export var playerSprite : AnimatedSprite2D

# Footsteps
@export var concreteStepOne : AudioStream
@export var concreteStepTwo : AudioStream
@export var woodStepOne : AudioStream
@export var woodStepTwo : AudioStream

# Other
@export var hurt : AudioStream
@export var mantle : AudioStream
@export var mantle_w_Grunt : AudioStream
@export var dash : AudioStream
@export var playerJump : AudioStream
@export var playerJump_w_Grunt : AudioStream
@export var playerLanding : AudioStream
@export var playerLanding_w_Grunt: AudioStream

# preferably this is a list or an array so we can add more than two sounds
func play_random(r1:AudioStream, r2 :AudioStream):
	var randomRange = RandomNumberGenerator.new()
	var randomNumber = randomRange.randi_range(1,2)
	if randomNumber == 1:
		AudioManager.play_sound(r1)
		
	if randomNumber == 2:
		AudioManager.play_sound(r2)

func _on_player_sprite_frame_changed():
	var current_anim = playerSprite.get_animation()
	if "running" in current_anim: 
		if playerSprite.frame == 0:
			AudioManager.play_sound(woodStepOne)
		elif playerSprite.frame == 4:
			AudioManager.play_sound(woodStepTwo)

func _on_player_sprite_animation_changed():
	var current_anim = playerSprite.get_animation()
	if "damage" in current_anim:
		AudioManager.play_sound(hurt)
	elif "mantling" in current_anim:
		play_random(mantle, mantle_w_Grunt)
	elif "jump" in current_anim and !_check_for_grapple_instance():
		play_random(playerJump, playerJump_w_Grunt)
	elif "dash" in current_anim:
		AudioManager.play_sound(dash)

func _check_for_grapple_instance():
	for child in get_tree().root.get_node("LabMain").get_children():
		if child is Grapple:
			return true
	return false
