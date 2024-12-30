extends Node

@onready var main_music_player = get_node("AudioStreamPlayer")
@onready var scnd_music_player: AudioStreamPlayer = $AudioStreamPlayerSCND

func play_music(stream: AudioStream):
	main_music_player.stream = stream
	main_music_player.play()
	
func stop_music():
	main_music_player.stop()
	
func set_volume(volume: float):
	main_music_player.volume_db = volume

func is_playing():
	if main_music_player.playing:
		return true

func main_pause_player(paused: bool):
	if paused == true:
		main_music_player.stream_paused = true
	elif paused == false:
		main_music_player.stream_paused = false

func scnd_play_music(stream: AudioStream):
	scnd_music_player.stream = stream
	scnd_music_player.play()

func scnd_stop_music():
	scnd_music_player.stop()

func scnd_set_volume(volume: float):
	scnd_music_player.volume_db = volume

func scnd_is_playing():
	if scnd_music_player.playing:
		return true

func scnd_pause_player(paused: bool):
	if paused == true:
		scnd_music_player.stream_paused = true
	elif paused == false:
		scnd_music_player.stream_paused = false
