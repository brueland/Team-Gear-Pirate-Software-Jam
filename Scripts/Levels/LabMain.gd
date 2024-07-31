extends Node2D
class_name MainScene

@export_category("Music")
@export var lab_music: AudioStream
@export var bio2_music: AudioStream
@export var boss_music: AudioStream

@export_category("Player")
@export var LANTURN_flag: bool = false

@export_category("Enemies")
@export var SKELTOR_flag: bool = false

@export_category("Rooms")
@export var FOREST1_flag1: bool = false
@export var FOREST1_flag2: bool = false
@export var FOREST1_flag3: bool = false
@export var FOREST1_flag4: bool = false

@export var FOREST2_flag1: bool = false
@export var FOREST2_flag2: bool = false
@export var FOREST2_flag3: bool = false
@export var FOREST2_flag4: bool = false

@export var ARCH1_flag1: bool = false
@export var ARCH1_flag2: bool = false
@export var ARCH1_flag3: bool = false
@export var ARCH1_flag4: bool = false

@export var ARCH2_flag1: bool = false
@export var ARCH2_flag2: bool = false
@export var ARCH2_flag3: bool = false
@export var ARCH2_flag4: bool = false

@export var CHEM1_flag1: bool = false
@export var CHEM1_flag2: bool = false
@export var CHEM1_flag3: bool = false
@export var CHEM1_flag4: bool = false

@export var CHEM2_flag1: bool = false
@export var CHEM2_flag2: bool = false
@export var CHEM2_flag3: bool = false
@export var CHEM2_flag4: bool = false

@export var BIO1_flag1: bool = false
@export var BIO1_flag2: bool = false
@export var BIO1_flag3: bool = false
@export var BIO1_flag4: bool = false

@export var BIO2_flag1: bool = false
@export var BIO2_flag2: bool = false
@export var BIO2_flag3: bool = false
@export var BIO2_flag4: bool = false
@export var BIO2_flag5: bool = false

@export var SECRET1_flag1: bool = false
@export var SECRET1_flag2: bool = false

@export var SECRET2_flag1: bool = false
@export var SECRET2_flag2: bool = false

@export_category("Menus")

@onready var player = $Player
@onready var room_container = $RoomContainer
@onready var dialogue_timer : Timer = $DialogueTimer

# Dialogue options
@export var dialogue_box: NinePatchRect
@export var dialogue_text: Label
var is_dialogue_visible: bool = false


func _ready():
	AudioManager.play_music(lab_music)
	#connect("game_over", game_over)
	dialogue_timer.connect("timeout", _on_dialogue_timer_timeout)
	
func _process(_delta):
	check_room_flags()

func check_room_flags():
	if "FOREST1_PATH" in room_container.current_room:
		if !FOREST1_flag1:
			show_dialogue("I know the lab was around here somewhere...")
			FOREST1_flag1 = true
		
		if FOREST1_flag2:
			show_dialogue("Maybe I can JUMP and get a better view from up there?")
			
		if FOREST1_flag3:
			show_dialogue("That vine up there looks sturdy enough to GRAPPLE!")
		
		if FOREST1_flag4:
			show_dialogue("I'm going to have to time this JUMP GRAPPLE just right.")
	
	elif "FOREST2_PATH" in room_container.current_room:
		if FOREST2_flag1:
			show_dialogue("A good JUMP DASH will get me across that gap.")
			FOREST2_flag1 = true
			
		if FOREST2_flag2:
			show_dialogue("That damn fence, I don't want to fall down there...")
			FOREST2_flag2 = true
			
		if FOREST2_flag3:
			show_dialogue("Well at least it's still standing. Guess I'll see if anyone is home.")
			FOREST2_flag3 = true
			
	elif "ARCH1_PATH" in room_container.current_room:
		if !ARCH1_flag1:
			show_dialogue("Is anybody here?")
			ARCH1_flag1 = true
		
		if !ARCH1_flag2:
			show_dialogue("I could have sworn I saw someone...")
			ARCH1_flag2 = true
			
	elif "ARCH2_PATH" in room_container.current_room:	
		pass
		
	elif "CHEM1_PATH" in room_container.current_room:
		pass
		
	elif "CHEM2_PATH" in room_container.current_room:
		pass
		
	elif "BIO1_PATH" in room_container.current_room:
		pass
		
	elif "BIO2_PATH" in room_container.current_room:
		if !BIO2_flag1:
			AudioManager.stop_music()
			BIO2_flag1 = true
		elif BIO2_flag2 and !BIO2_flag3:
			AudioManager.play_music(bio2_music)
			show_dialogue("What the hell u doin wit my arm, brah?")
			BIO2_flag3 = true
			
	elif "SECRET1_PATH" in room_container.current_room:
		pass
		
	elif "SECRET2_PATH" in room_container.current_room:
		if !SECRET2_flag1:
			AudioManager.stop_music()
			SECRET2_flag1 = true
		elif SECRET2_flag2:
			AudioManager.play_music(boss_music)
			SECRET2_flag2 = false
		
func show_dialogue(dialogue: String):
	dialogue_text.text = dialogue
	dialogue_box.visible = true
	is_dialogue_visible = true
	dialogue_timer.start()
	
func hide_dialogue():
	dialogue_box.visible = false
	is_dialogue_visible = false
	
func _on_dialogue_timer_timeout():
	hide_dialogue()
