extends CharacterBody2D

signal make_damage(amount: float)
signal add_jump_to_player

var death_sound_1: AudioStream = load("res://assets/sounds/slime/death/slime_death_1.wav")
var death_sound_2: AudioStream = load("res://assets/sounds/slime/death/slime_death_2.wav")
var death_sound_3: AudioStream = load("res://assets/sounds/slime/death/slime_death_3.wav")

@onready var death_sounds = [death_sound_1, death_sound_2, death_sound_3]


var is_dead = false
@onready var sprite = $AnimatedSprite2D
@export var speed: float = 100.0
var direction: int = -1
var damage:float = 20.0
var gravity: float = 980.0
var max_fall_speed: float = 980.0


var player: Node = null
var death_sound_played = false
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	death_sound_played = false
	player = get_node("/root/Level1/Player")
	if player and player.is_in_group("player"):
		connect("make_damage", Callable(player, "take_damage"))
		connect("add_jump_to_player", Callable(player, "add_jump_from_slime"))

func _physics_process(_delta: float) -> void:
	if is_dead:
		return
	
	velocity.y = gravity
	
	velocity.x = speed * direction
	
	move_and_slide()
	
	if is_on_wall():
		direction *= -1

func _on_damage_region_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if is_dead == false:
			emit_signal("make_damage", damage)
		else:
			return


func _on_die_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("add_jump_to_player")
		play_death_sound()
		death_sound_played = true
		is_dead = true
		sprite.play("die")

func _on_animated_sprite_2d_animation_finished() -> void:
	visible = false

func _on_death_sound_finished() -> void:
	queue_free()


func play_death_sound():
	if death_sound_played:
		return
	else:
		var random_index = randi() % death_sounds.size()
		audio.stream = death_sounds[random_index]
		audio.play()
