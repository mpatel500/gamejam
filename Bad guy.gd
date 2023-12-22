extends CharacterBody2D
var SPEED = 50
var STOMPABLE = false

func _physics_process(delta):
	var player_character = get_parent().get_node("Player")
	var direction = player_character.position - position
	var normalised_direction = direction.normalized()
	velocity = normalised_direction * SPEED
	move_and_slide()

func _on_bad_guy_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		scale = Vector2(0.25, 0.25)
		area.queue_free()
