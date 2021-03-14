extends Node

export (Array, AudioStream) var sounds

func play_sound(sound,volume):
	var new_sound = AudioStreamPlayer.new()
	add_child(new_sound)
	new_sound.volume_db=-(volume*80)
	new_sound.stream=sounds[sound]
	new_sound.play()
	yield(new_sound,"finished")
	new_sound.queue_free()
