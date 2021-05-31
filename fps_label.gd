# Displays frames per second.
#
# Copyright © 2017-2021 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.
extends Label

# Timestamps of frames rendered in the last second
var times := []

# Frames per second
var fps := 0


func _process(_delta: float) -> void:
	var now := OS.get_ticks_usec()

	# Remove frames older than 1 second in the `times` array.
	while times.size() > 0 and times[0] <= now - 1000000:
		times.pop_front()

	times.append(now)
	fps = times.size()

	# Display FPS in the label
	text = str(fps) + " FPS"


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_fps_label"):
		visible = not visible
