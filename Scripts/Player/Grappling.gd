extends Area2D
class_name Grapple

@export var max_speed : float = 300.0
@export var max_range : float = .5
var grapple_speed : float = max_speed
var attached : bool = false
var retracting : bool = false
var distance_travelled : float = 0.0
var distance_retracted : float = 0.0

var player: Player


func _physics_process(delta):
	position += transform.x * grapple_speed * delta
	if retracting and (abs(player.global_position-global_position).length()) <= 4:
		queue_free()
	
	if !attached and !retracting:
		distance_travelled += delta
	if !attached and retracting:
		distance_retracted += delta

	if distance_travelled >= max_range:
		retract()
	if distance_travelled >= max_range * 2.0:
		queue_free()
	if distance_retracted >= distance_travelled:
		queue_free()
		
func _on_body_shape_entered(body_rid, body, _body_shape_index, _local_shape_index):
	if not retracting:
		if body.is_class("TileMap"):
			var rid = body.get_layer_for_body_rid(body_rid)
			if rid == 0: # Wall and floor RID
				retract()
			if rid == 1: # Hook RID
				grapple_speed = 0.0
				attached = true
				retracting = true
		elif body is EnemyBaseClass:
			retract()

func retract():
	retracting = true
	grapple_speed = -1.0 * max_speed

func _on_area_entered(area):
	if not retracting:
		if area.name == "GrappleObjectArea2D":
			grapple_speed = 0.0
			attached = true
			retracting = true
