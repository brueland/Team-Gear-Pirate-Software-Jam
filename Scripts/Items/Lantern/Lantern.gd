extends Sprite2D
class_name Lantern

@onready var floating_tween: Tween
@export var bounce_height: float = 4.0
@export var bounce_duration: float = 2.0 
@export var intensity: float = 10.0 # How strong the light kills ghosts

var bodies_in_area = []
var held: bool = false

func _ready():
	GlobalReferences.lantern = self
	start_floating()

func _physics_process(delta):
	damage_bodies_in_area(delta) 

func damage_bodies_in_area(delta):
	for _body in bodies_in_area:
		if _body is EnemyBaseClass:
			_body.take_damage(intensity*delta)

func start_floating():
	floating_tween = create_tween().set_loops()
	floating_tween.set_trans(Tween.TRANS_SINE)
	floating_tween.tween_property(self, "position:y", position.y - bounce_height, bounce_duration / 2)
	floating_tween.tween_property(self, "position:y", position.y, bounce_duration / 2)

func stop_floating():
	if floating_tween:
		floating_tween.kill()

func _on_lantern_area_body_entered(body):
	if body is Ghost or PositiveGhost:
		if body not in bodies_in_area:
			bodies_in_area.append(body)
	if body is Player:
		stop_floating()
		body.held_lantern = self
		held = true

func _on_lantern_area_body_exited(body):
	if body is Ghost or PositiveGhost:
		if body in bodies_in_area:
			bodies_in_area.erase(body)
	if body is Player:
		held = false
		start_floating()
