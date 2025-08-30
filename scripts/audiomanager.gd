extends AudioStreamPlayer



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func play_track(track: String):
	if playing: stop()
	
	var loaded_track=load(track)
	stream=loaded_track
	play()
	
