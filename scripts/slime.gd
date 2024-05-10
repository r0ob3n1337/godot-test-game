extends Node2D

@export var SPEED = 60
@export var is_alive = true

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var hitbox = $Hitbox
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var audio_stream = $AudioStreamPlayer2D
@onready var killzone_collision = $Killzone/CollisionShape2D

func _process(delta):
	if (ray_cast_right.is_colliding()):
		direction = -1
		animated_sprite.flip_h = true
	if (ray_cast_left.is_colliding()):
		direction = 1
		animated_sprite.flip_h = false
		
	if (is_alive):
		position.x += direction * SPEED * delta


func _on_hitbox_body_entered(body):
	if body.is_in_group("player") and is_alive:
		is_alive = false
		killzone_collision.set_deferred("disabled", true)
		audio_stream.play()
		animated_sprite.play("die")
		animation_player.play("die")
