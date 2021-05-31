# Time of day slider.
#
# Copyright © 2017-2021 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.
extends HBoxContainer

@onready var sun := $"../Sun" as DirectionalLight3D
@onready var moon := $"../Sun/Moon" as DirectionalLight3D
@onready var time_label := $TimeLabel as Label
@onready var slider := $HSlider as HSlider


func _ready() -> void:
	_on_HSlider_value_changed(slider.value)


func _on_HSlider_value_changed(value: float) -> void:
	sun.rotation_degrees.x = range_lerp(value, 0, 100, 130, -130)
	if value <= 50:
		sun.use_in_sky_only = true
		moon.use_in_sky_only = false
	else:
		sun.use_in_sky_only = false
		moon.use_in_sky_only = true

	var minutes := int(range_lerp(value, 0, 100, 0, 900))
	time_label.text = "%2d:%02d" % [minutes / 60, minutes % 60]
