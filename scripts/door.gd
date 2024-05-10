extends Area2D

@export var next_scene_name: String = "level_1"

@onready var collision_shape = $"CollisionShape2D"

func _on_body_entered(body):
	if body.name == "Player":
		collision_shape.set_deferred("disabled", true)
		TransitionScrene.transition()
		await TransitionScrene.on_transition_finished
		collision_shape.set_deferred("disabled", false)
		get_tree().change_scene_to_file("res://scenes/" + next_scene_name + ".tscn")
