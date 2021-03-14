extends KinematicBody

var speed := 0.0
var velocity := Vector3.ZERO

func _physics_process(delta) -> void:
	var input = get_inputs()
	handle_rotation(delta,input)
	handle_movement(delta,input)
	check_collisions()
	return


func handle_rotation(delta,input)->void:
	rotation_degrees.y+=input.x*delta*90
	return

func handle_movement(delta,input)->void:
	var new_velocity = Vector3(0,0,input.z)
	velocity=lerp(velocity,new_velocity*7.5,delta*3)
	var final_velocity=velocity.rotated(Vector3.UP,rotation.y)
	final_velocity = move_and_slide(final_velocity)

func get_inputs()->Vector3:
	var v = Vector3.ZERO
	v.x=int(Input.is_action_pressed("left"))-int(Input.is_action_pressed("right"))
	v.z=int(Input.is_action_pressed("forwards"))-int(Input.is_action_pressed("backwards"))
	return v

func check_collisions():
	if $RayCast.is_colliding():
		print($RayCast.get_collider())
