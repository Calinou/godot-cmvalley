# cm|Valley for Godot 4.0

[![Screenshot of cm|Valley](https://raw.githubusercontent.com/Calinou/media/master/godot-cmvalley/screenshot-thumb.png)](https://raw.githubusercontent.com/Calinou/media/master/godot-cmvalley/screenshot.png)

A port of [cm|Valley](http://quadropolis.us/node/4196) for testing Godot 4.0's new renderer.
Uses SDFGI for global illumination in addition to volumetric fog.

The OBJ and MTL files were sourced from [game-maps-obj](https://github.com/Calinou/game-maps-obj).

*Looking for a smaller urban/industrial test scene? See [godot-reflection](https://github.com/Calinou/godot-reflection).*

## Try it out

If you just want to run this demo,
[download the ZIP archive](https://github.com/Calinou/godot-cmvalley/releases/download/download/godot-cmvalley.zip)
that includes all the required files.

**You need a development build of Godot 4.0 to run this demo.**

Once you have the project files, open the Godot Project Manager, click the
**Import** button, then select the `project.godot` file of this project.
Confirm importing, then edit the project (so that the resources are imported
by the editor). Exit the editor (go back to the project manager), then run
the project. This is to make sure the editor does not render the demo in
the background, which would slow down the running project a lot.

**Note:** If some materials don't show up, try selecting
`cmvalley/cmvalley.obj` in the FileSystem dock, go to the Import dock then
click **Reimport**.

## Development

If you'd like to run this demo but also be able to contribute pull requests,
clone the Git repository:

```bash
git clone https://github.com/Calinou/godot-cmvalley.git
```

The cm|Valley OBJ file is too large to be included in the repository. Download it from
[this link](https://github.com/Calinou/game-maps-obj/releases/download/download/cmvalley.zip)
and place it in the `cmvalley/` folder. Don't replace the `.mtl` file contained
in this repository! Otherwise, materials won't show up.

## License

Copyright © 2020-2021 Hugo Locurcio and contributors

- Unless otherwise specified, files in this repository are licensed under the
  MIT license, see [LICENSE.md](LICENSE.md) for more information.
- The cm|Valley map is licensed under CC BY 4.0.
- Textures in the `cmvalley/` folder are licensed under various proprietary licenses.
  Some of them are pending replacements.

A big thanks to the Cube 2 engine community for making and releasing all these maps
:slightly_smiling_face:
