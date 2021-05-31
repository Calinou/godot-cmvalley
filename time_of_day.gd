# Time of day slider.
#
# Copyright © 2017-2021 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.
extends HBoxContainer

@onready var sun := $"../Sun" as DirectionalLight3D
@onready var moon := $"../Sun/Moon" as DirectionalLight3D
@onready var point_lights := $"../PointLights" as Node3D
@onready var time_label := $TimeLabel as Label
@onready var slider := $HSlider as HSlider


func _ready() -> void:
	_on_HSlider_value_changed(slider.value)


func _on_HSlider_value_changed(value: float) -> void:
	sun.rotation_degrees.x = range_lerp(value, 0, 100, 130, -130)
	# Enable/disable sun/moon lights depending on time of day.
	sun.use_in_sky_only = value <= 50
	moon.use_in_sky_only = value >= 50
	# Only enable lamps during night and early morning.
	point_lights.visible = value <= 57.5

	var minutes := int(range_lerp(value, 0, 100, 0, 900))
	time_label.text = "%2d:%02d" % [minutes / 60, minutes % 60]
