extends Node
class_name GhostSpawner

@export var max_ghosts: int = 5
@export var enabled: bool = true
var current_ghosts: Array
var spawn_timer_ready: bool = true

@onready var spawn_timer: Timer = $SpawnTimer
@onready var ghostScene : PackedScene = preload(GlobalPaths.GHOST_PATH)
@onready var player = GlobalReferences.playerBody

func _ready():
	spawn_timer.connect("timeout", _on_spawn_timer_timeout)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if enabled:
		if current_ghosts.size() < max_ghosts and spawn_timer_ready:
			spawn_ghost()
		
func spawn_ghost():
	var ghost = ghostScene.instantiate()
	
	ghost.tree_exiting.connect(_on_ghost_freeing.bind(ghost))
	add_child(ghost)
	
	var speed_noise = randf_range(0.5, 1.0)

	ghost.global_position = player.position + _set_random_start_position()
	ghost.speed *= speed_noise
	
	current_ghosts.append(ghost)
	spawn_timer_ready = false
	spawn_timer.start()
	
func _set_random_start_position():    
	var angle = randf() * 2 * PI 
	var distance = randf_range(100, 300) 
	
	var spawn_offset = Vector2(cos(angle), sin(angle)) * distance	
	return spawn_offset

func _on_ghost_freeing(ghost):
	# Remove the scene from the array
	current_ghosts.erase(ghost)

func _on_spawn_timer_timeout():
	spawn_timer_ready = true
