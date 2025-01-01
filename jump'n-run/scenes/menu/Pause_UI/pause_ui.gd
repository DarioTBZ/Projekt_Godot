extends CanvasLayer

var pause_sound: AudioStream = load("res://scenes/sound/pausemenu/click_1_pause.wav")

@onready var audio = $PauseSound
@onready var player: Node = null


func _ready() -> void:
	Gamemanager.connect("player_loaded", Callable(self, "on_player_loaded"))
	
	visible = false
	audio.stream = pause_sound

func _on_button_pressed() -> void:
	Gamemanager.current_level.queue_free()
	GlobalMusicPlayer.scnd_stop_music()
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://scenes/menu/Mainmenu/mainmenu.tscn")

func _process(_delta: float) -> void:
	player = Gamemanager.player
	if player == null:
		print(("Player is null"))
		return
	
	if player.is_dead:
		return

	if Input.is_action_just_pressed("PauseUnpause"):
		audio.play()
		if visible == false:
			visible = true
		else:
			visible = false

func on_player_loaded(_player):
	player = Gamemanager.player
