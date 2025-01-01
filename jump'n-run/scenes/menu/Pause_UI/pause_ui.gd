extends CanvasLayer

var pause_sound: AudioStream = load("res://scenes/sound/pausemenu/click_1_pause.wav")

@onready var audio = $PauseSound

func _ready() -> void:
	visible = false
	audio.stream = pause_sound

func _on_button_pressed() -> void:
	GlobalMusicPlayer.scnd_stop_music()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu/Mainmenu/mainmenu.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("PauseUnpause"):
		audio.play()
		if visible == false:
			visible = true
		else:
			visible = false
