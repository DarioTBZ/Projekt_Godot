extends CharacterBody2D
class_name Player

@onready var animated_sprite = $AnimatedSprite2D


@export var speed: float = 130

var current_health = 100.0
var max_health = 100.0
var total_mines = 3
var coin_amount: int
var high_score: int
var item = null

const MINE = preload("res://scenes/mine.tscn")

signal life(current_health)
signal coins(coin_amount, high_score)
signal died(coin_amount, high_score)

func _ready():
	var save_file = FileAccess.open("user://save.data", FileAccess.READ)
	
	if save_file != null:
		high_score = save_file.get_32()
	else:
		high_score = 0
		save_game()

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	look_at(get_global_mouse_position())
	move_and_slide()
	
	if direction == Vector2(-1, 0):
		animated_sprite.play("left")
	elif direction == Vector2(1, 0):
		animated_sprite.play("right")
	elif direction == Vector2(0, 1) or direction == Vector2(0, -1):
		animated_sprite.play("forward")
	elif direction == Vector2(0, 0):
		animated_sprite.play("idle")
	
	
	if Input.is_action_just_pressed("mine") && total_mines > 0:
		mines()
	
func mines():
	var instance = MINE.instantiate()
	instance.global_position = self.global_position
	var item_place_mine = get_tree().get_nodes_in_group("items")[0]
	item_place_mine.add_child(instance)
	total_mines -= 1

func take_damage(enemy_damage):
	current_health -= enemy_damage
	life.emit(current_health)
	animated_sprite.play("hurt")
	
	if current_health <= 0:
		died.emit(coin_amount, high_score)
		save_game()
		queue_free()

func heal(hp, item):
	if current_health != max_health:
		current_health += hp
		life.emit(current_health)
		item.queue_free()

	else:
		return

func collect_coin(value):
	coin_amount += value
	if coin_amount > high_score:
		high_score = coin_amount

	coins.emit(coin_amount, high_score)

func save_game():
	var save_file = FileAccess.open("user://save.data", FileAccess.WRITE)
	save_file.store_32(high_score)

