# Map-specific operations (such as material override).
#
# Copyright © 2017-present Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.
@tool
extends MeshInstance3D


func _ready() -> void:
	for index in mesh.get_surface_count():
		var material := mesh.surface_get_material(index)
		# Use sharper texture rendering, and better rendering for textures viewed at oblique angles.
		# Nearest-neighbor texture filtering is used since the textures are low-resolution
		# and tend to look better with this filtering mode.
		material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC

		# Use non-PBR emulation parameters.
		material.specular_mode = BaseMaterial3D.SPECULAR_DISABLED
		material.roughness = 1.0
		material.metallic = 0.0
