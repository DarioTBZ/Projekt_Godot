extends Node

@onready var music_player = get_node("AudioStreamPlayer")

func _ready():
	pass

func play_music(stream: AudioStream):
	music_player.stream = stream
	music_player.play()
	
func stop_music():
	music_player.stop()
	
func set_volume(volume: float):
	music_player.volume_db = volume
