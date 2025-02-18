extends CharacterBody2D

signal coin_collected
signal died(player)
signal show_deathscreen
signal health_changed(new_health)

var maintheme = load("res://scenes/sound/music/mainmenu-music.mp3")

# Movement
@export var speed := 200
@export var jump_force := -400
@export var gravity := 980
@export var acceleration := 800
@export var friction := 1200
@export var max_jumps := 1
var jumps_available := max_jumps
var is_in_animation = false
# HP and Damage

@export var max_hp:float = 100
var current_hp: float = 100

var is_dead: bool = false
var level: Node = null

# Sprites
@onready var sprite = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D


@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var hurt_sound: AudioStreamPlayer2D = $HurtSound
@onready var death_sound = $DeathSound


@onready var player_ui: CanvasLayer = null

func _ready() -> void:
	level = Gamemanager.current_level
	player_ui = Gamemanager.current_level.get_node("PlayerUI")
	
	call_deferred("get_health", 100)
	connect("coin_collected", Callable(self, "_on_coin_collected"))
	connect("died", Callable(level, "player_died"))
	connect("health_changed", Callable(player_ui, "update_health_bar"))

	
	var cam_zoom: Vector2
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		cam_zoom = config.get_value("video", "cam_zoom", Vector2(2, 2))
	camera.zoom = cam_zoom

func _physics_process(delta: float):	
	if is_dead:
		return
	if is_in_animation == false && camera.enabled == false:
		camera.enabled = true
	if is_in_animation:
		camera.enabled = false
		return
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
		sprite.play("run")
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		sprite.play("idle")
		
	if is_on_floor():
		jumps_available = max_jumps
		
	if Input.is_action_just_pressed("jump") and jumps_available > 0 and is_in_animation == false:
		jump_sound.play()
		velocity.y = jump_force
		jumps_available -= 1

	move_and_slide()

func fell_into_killzone():
	death_sound.play()
	emit_signal("died")
	visible = false
	is_dead = true

func _on_coin_collected():
	%CoinCounter.update_coin_count()

func take_damage(amount: float):
	if is_dead == true:
		return
	current_hp = clamp(current_hp, 0, max_hp)
	hurt_sound.play()
	current_hp -= amount
	emit_signal("health_changed", current_hp)
	if current_hp == 0:
		die()

func get_health(amount: float):
	current_hp += amount
	emit_signal("health_changed", current_hp)

func die():
	death_sound.play()
	is_dead = true
	sprite.play("die")
	GlobalMusicPlayer.stop_music()

func _on_animated_sprite_2d_animation_finished() -> void:
	emit_signal("died")

func AN_play_slow_walk():
	is_in_animation = true
	sprite.play("AN_slow_walk")

func AN_play_idle():
	is_in_animation = true
	sprite.play("AN_idle")

func AN_end_animation():
	is_in_animation = false
	sprite.stop()

func add_jump_from_slime():
	jumps_available += 1

func respawn():
	is_dead = false
	get_health(100)
	GlobalMusicPlayer.play_music(maintheme)
	if visible == false:
		visible = true
