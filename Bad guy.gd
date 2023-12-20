extends CharacterBody2D
var SPEED = 200

func _physics_process(delta):
	var player_character = get_parent().get_node("Player")
	var direction = player_character.position - position
	var normalised_direction = direction.normalized()
	velocity = normalised_direction * SPEED
	move_and_slide()
