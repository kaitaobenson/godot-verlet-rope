extends Label


func set_fps(fps: int) -> void:
	text = "FPS: %d" % Engine.get_frames_per_second()
