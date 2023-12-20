extends CharacterBody2D
var Bullet =  preload("res://Bullet.tscn")

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func look_and_shoot():
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
	move_and_slide()
	look_and_shoot()
	
func shoot():
	var bullet = Bullet.instantiate()
	bullet.position = position
	owner.add_child(bullet)
	bullet.transform = $Marker2D.global_transform
