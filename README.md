# Flutterfy

Flutterfy is a simple Dart tool to manage versioning in your Flutter projects by updating the version number in the `pubspec.yaml` file. It allows you to increment the version easily using command-line arguments.

## Installation

To use Flutterfy, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutterfy: ^1.0.0
```

### Notes

If you encounter an error stating "version not found in pubspec.yaml," make sure to add +1 to the version in your pubspec.yaml file.

### Usage

To run Flutterfy, use the command line as follows:

```
dart run bin/flutterfy.dart <version_level>
```

### Version Levels

You can specify one of the following version levels:

- `major`: Increments the major version number.
- `minor`: Increments the minor version number.
- `patch`: Increments the patch version number.

### Example

For example, if you want to increment the minor version, you can run:

```
dart run bin/flutterfy.dart minor
```

### Changelog

For a detailed list of changes, refer to the CHANGELOG.md.

### Instructions

- Save this content in a file named `README.md` in the root of your project.
- Make sure to update the version number in the `README.md` file whenever you release a new version.

Let me know if you need any further modifications or additional information!
