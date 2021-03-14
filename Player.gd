extends KinematicBody

var speed := 0.0
var velocity := Vector3.ZERO
onready var rays = $rays
var powered_up = false

func _physics_process(delta) -> void:
	var input = get_inputs()
	handle_rotation(delta,input)
	handle_movement(delta,input)
	check_collisions()
	power()
	return

func power():
	if !powered_up:
		return
	if Input.is_action_just_pressed("shoot"):
		var new_shot = load("res://Projectile.tscn").instance()
		get_parent().add_child(new_shot)
		new_shot.global_transform = $Position3D.global_transform
		SfxManager.play_sound(3,0.2)

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
	for ray in rays.get_children():
		if ray.is_colliding():
			if ray.get_collider() is Enemy:
				Effects.create_explosion(ray.get_collision_point())
				ray.get_collider().queue_free()
				ScoreManager.increase_score(5)
				SfxManager.play_sound(0,0.25)
				return
			
func power_up():
	powered_up=true
	$PowerUp.start()

func _on_PowerUp_timeout():
	powered_up=false
