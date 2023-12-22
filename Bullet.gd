extends Area2D

var SPEED = 750

func _physics_process(delta):
	position += transform.x * SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	if not body.is_in_group("player"):
		queue_free()
