extends Node

@onready var background_music: AudioStreamPlayer2D

func play_sound(stream: AudioStream):
	var instance = AudioStreamPlayer.new()
	instance.stream = stream
	instance.bus = GlobalPaths.SFX_BUS
	instance.finished.connect(remove_node.bind(instance))
	add_child(instance)
	instance.add_to_group("sfx_sounds")
	instance.pitch_scale = randf_range(0.95,1.05)
	instance.play()
		
func stop_sounds():
	var audio_players = get_tree().get_nodes_in_group("sfx_sounds")
	for player in audio_players:
		player.stop()
		player.queue_free()
		
func remove_node(instance : AudioStreamPlayer):
	instance.queue_free()

func play_music(stream: AudioStream):
	background_music = AudioStreamPlayer2D.new()
	background_music.stream = stream
	background_music.bus = GlobalPaths.BGM_BUS
	add_child(background_music)

	background_music.finished.connect(_on_music_finished)
	
	background_music.play()

func _on_music_finished():
	# Restart the music from the beginning
	background_music.play()

func stop_music():
	if background_music:
		background_music.stop()
		background_music.finished.disconnect(_on_music_finished)
