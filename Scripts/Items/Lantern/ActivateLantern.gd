extends Sprite2D

@onready var floating_tween: Tween
@export var bounce_height: float = 4.0
@export var bounce_duration: float = 2.0 
@onready var lanternScene : PackedScene = preload(GlobalPaths.LANTERN_PATH)

func _ready():
	for child in get_tree().root.get_children():
		if child is Lantern:
			queue_free()
	if !get_tree().root.get_node("LabMain").LANTERN_flag:
		start_floating()

func start_floating():
	floating_tween = create_tween().set_loops()
	floating_tween.set_trans(Tween.TRANS_SINE)
	floating_tween.tween_property(self, "position:y", position.y - bounce_height, bounce_duration / 2)
	floating_tween.tween_property(self, "position:y", position.y, bounce_duration / 2)

func stop_floating():
	if floating_tween:
		floating_tween.kill()

func _on_lantern_area_body_entered(body):
	if body is Player:
		stop_floating()
		var lantern = lanternScene.instantiate()
		lantern.global_position = global_position
		get_tree().root.call_deferred("add_child", lantern)

		if !get_tree().root.get_node("LabMain").LANTERN_flag:
			get_tree().root.get_node("LabMain").LANTERN_flag = true
			get_tree().root.get_node("LabMain").SECRET2_flag3 = true

		queue_free()
