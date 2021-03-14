extends Position3D

var timer=0
onready var enemy = preload("res://Enemy.tscn")
func _process(delta):
	timer+=delta
	if timer > 5:
		var new = enemy.instance()
		get_parent().add_child(new)
		new.global_transform.origin=global_transform.origin+Vector3(rand_range(-1,1),0,rand_range(-1,1))
		timer=0
