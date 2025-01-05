extends Node

@onready var main_player: AudioStreamPlayer = $MainPlayer
@onready var scnd_player: AudioStreamPlayer = $ScndPlayer

# Main Player

func play_main_music(stream: AudioStream):
	main_player.stream = stream
	main_player.play()
	
func stop_main_music():
	main_player.stop()
	
func set_main_volume(volume: float):
	main_player.volume_db = volume

func is_main_playing():
	if main_player.playing:
		return true

func pause_main_player(paused: bool):
	if paused == true:
		main_player.stream_paused = true
	elif paused == false:
		main_player.stream_paused = false


# Second Player

func play_scnd_music(stream: AudioStream):
	scnd_player.stream = stream
	scnd_player.play()

func stop_scnd_music():
	scnd_player.stop()

func set_scnd_volume(volume: float):
	scnd_player.volume_db = volume

func is_scnd_playing():
	if scnd_player.playing:
		return true

func pause_scnd_player(paused: bool):
	if paused == true:
		scnd_player.stream_paused = true
	elif paused == false:
		scnd_player.stream_paused = false
