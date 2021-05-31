# Map-specific operations (such as material override).
#
# Copyright © 2017-2021 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.
@tool
extends MeshInstance3D


func _ready() -> void:
	for index in mesh.get_surface_count():
		# Use sharper texture rendering, and better rendering for textures viewed at oblique angles.
		# Nearest-neighbor texture filtering is used since the textures are low-resolution
		# and tend to look better with this filtering mode.
		mesh.surface_get_material(index).texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC
