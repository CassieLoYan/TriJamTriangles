extends Area
class_name Enemy
onready var ray = $RayCast
var direction
var speed = 5

func _ready():
	change_direction()

func _physics_process(delta):
	move_to_pos(delta)



func move_to_pos(delta)->void:
	var mov = direction*delta*speed
	ray.set_cast_to(mov)
	ray.force_raycast_update()
	if ray.is_colliding():
		change_direction()
		return
	global_transform.origin+=mov
	return

func change_direction()->void:
	var dir = Vector3.FORWARD
	direction=dir.rotated(Vector3.UP,deg2rad(rand_range(-180,180)))
	return


func _on_Enemy_body_entered(body):
	SaveScore.appear()
	body.queue_free()
#	get_tree().reload_current_scene()
