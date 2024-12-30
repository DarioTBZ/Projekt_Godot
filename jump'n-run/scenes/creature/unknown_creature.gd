extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var gravity: float = 980.0

func _ready() -> void:
	visible = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

func AN_play_run():
	sprite.play("run")

func AN_play_idle():
	sprite.play("idle")

func AN_stop_all():
	sprite.stop()
