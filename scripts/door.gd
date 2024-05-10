extends Area2D

@export var next_scene_name: String = "level_1"

func _on_body_entered(body):
	if body.name == "Player":
		TransitionScrene.transition()
		await TransitionScrene.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/" + next_scene_name + ".tscn")
