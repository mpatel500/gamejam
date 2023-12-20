extends Area2D

var SPEED = 750

func _physics_process(delta):
	position += transform.x * SPEED * delta

#func _on_Bullet_body_entered(body):
	#print_debug("ouchies")
	#if body.is_in_group("mobs"):
		#body.queue_free()
	#queue_free()


func _on_bad_guy_area_2d_body_entered(body):
	print_debug("ouchies")
	#if body.is_in_group("mobs"):
		#body.queue_free()
	queue_free()
