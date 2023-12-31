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
		STOMPABLE = true
		

func _on_bad_guy_area_2d_body_entered(body):
	if body.is_in_group("player"):
		if STOMPABLE:
			queue_free()
		else:
			body.visible = false
			get_tree().change_scene_to_file("res://you_fail.tscn")
