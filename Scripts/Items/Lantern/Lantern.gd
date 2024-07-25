extends Sprite2D
@export var knockback: float = 20.0

var bodies_in_area = []

func _physics_process(_delta):
	pass
	#damage_bodies_in_area(delta) # Something happening with player jumping?

func damage_bodies_in_area(delta):
	for _body in bodies_in_area:
		_body.velocity.x += _body.direction * -1 * knockback * delta
		_body.velocity.y += sign(_body.velocity.y) * -1 * knockback * delta

func _on_lantern_area_body_entered(body):
	if body is Ghost:
		if body not in bodies_in_area:
			bodies_in_area.append(body)

func _on_lantern_area_body_exited(body):
	if body is Ghost:
		if body in bodies_in_area:
			bodies_in_area.erase(body)

