extends Area2D

@onready var timer = $Timer
@onready var hit_sound = $HitSound

func _on_body_entered(body):
	await get_tree().process_frame
	
	var child_collision_shape = get_child(2) as CollisionShape2D
	if child_collision_shape and child_collision_shape.disabled == false:
		hit_sound.play()
		Engine.time_scale = 0.5
		(body.get_node("CollisionShape2D") as CollisionShape2D).queue_free()
		timer.start()
	
	
func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
