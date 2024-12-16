extends Node

@onready var music_player = get_node("AudioStreamPlayer")

func _ready():
	print("Music Player Node: ", music_player)

func play_music(stream: AudioStream):
	if stream == null:
		print("Fehler: Der Musik-Stream ist null!")
		return
	print("Stream wird geladen: ", stream)
	music_player.stream = stream
	music_player.play()
	
func stop_music():
	music_player.stop()
	
func set_volume(volume: float):
	music_player.volume_db = volume
	print("Aktuelles Volume: ", music_player.volume_db)
