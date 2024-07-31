extends Node2D
class_name MainScene

@export_category("Music")
@export var lab_music: AudioStream
@export var bio2_music: AudioStream
@export var boss_music: AudioStream

@export_category("Player")

@export_category("Enemies")

@export_category("Rooms")
@export var FOREST1_flag: bool = true
@export var FOREST2_flag: bool = false

@export var ARCH1_flag1: bool = false
@export var ARCH1_flag2: bool = false

@export var BIO2_flag1: bool = false
@export var BIO2_flag2: bool = false

@export var SECRET2_flag1: bool = false
@export var SECRET2_flag2: bool = false

@export_category("Menus")


@onready var player = $Player
@onready var room_container = $RoomContainer

func _ready():
	AudioManager.play_music(lab_music)
	#connect("game_over", game_over)

func _process(_delta):
	check_room_flags()

func check_room_flags():
	if "FOREST1_PATH" in room_container.current_room and !FOREST1_flag:
		FOREST1_flag = true
	
	elif "BIO2_PATH" in room_container.current_room:
		if !BIO2_flag1:
			AudioManager.stop_music()
			BIO2_flag1 = true
		elif BIO2_flag2:
			AudioManager.play_music(bio2_music)
			BIO2_flag2 = false
			show_dialog("BlahBlahBlah")
	
	elif "SECRET2_PATH" in room_container.current_room:
		if !SECRET2_flag1:
			AudioManager.stop_music()
			SECRET2_flag1 = true
		elif SECRET2_flag2:
			AudioManager.play_music(boss_music)
			SECRET2_flag2 = false
		
func show_dialog(dialogue: String):
	pass
	
#func game_over():
	#print('game over')
	#player.current_health = player.max_health
