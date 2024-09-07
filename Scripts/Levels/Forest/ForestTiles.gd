extends TileMap

@onready var player: CharacterBody2D = GlobalReferences.playerBody
@export var layer_index: int = 4
@export var alpha_when_touching: float = 1.0
@export var max_alpha_when_touching: float = 0.6
@export var alpha_when_not_touching: float = 1.0

var is_player_touching: bool = false

func _process(_delta):
	check_player_collision()
	update_layer_alpha()

func check_player_collision():
	var player_position = local_to_map(player.global_position)
	var tile_data = get_cell_tile_data(layer_index, player_position)
	
	is_player_touching = tile_data != null
	if is_player_touching:
		alpha_when_touching = lerp(alpha_when_touching, max_alpha_when_touching, 0.005)
	else:
		alpha_when_touching = lerp(alpha_when_touching, alpha_when_not_touching, 0.005)
		
func update_layer_alpha():
	var target_alpha = alpha_when_touching if is_player_touching else alpha_when_not_touching
	var current_color = get_layer_modulate(layer_index)
	var new_color = Color(current_color.r, current_color.g, current_color.b, target_alpha)
	set_layer_modulate(layer_index, new_color)

func set_layer_alpha(alpha: float):
	var current_color = get_layer_modulate(layer_index)
	var new_color = Color(current_color.r, current_color.g, current_color.b, alpha)
	set_layer_modulate(layer_index, new_color)
