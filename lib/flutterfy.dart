import 'dart:developer';
import 'dart:io';

/// The above Dart function updates the version number in a pubspec.yaml file based
/// on the provided level change (major, minor, or patch).
///
/// Args:
///   arguments (List<String>): The `arguments` parameter in the `main` function is
/// a list of strings that represent the command-line arguments passed to the Dart
/// program when it is executed. In this specific code snippet, the `arguments` list
/// is expected to contain at least one element which represents the version level
/// (major, minor
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Error: Please provide a version level (major, minor, patch)');
    exit(1);
  }

  String levelChange = arguments[0];
  updateVersion(levelChange);
}

void updateVersion(String levelChange) {
  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    log('Error: pubspec.yaml not found');
    exit(1);
  }

  String content = pubspec.readAsStringSync();
  RegExp versionRegex = RegExp(r'version:\s*(\d+)\.(\d+)\.(\d+)\+(\d+)');
  Match? match = versionRegex.firstMatch(content);

  if (match == null) {
    print('Error: version not found in pubspec.yaml');
    exit(1);
  }

  int major = int.parse(match.group(1)!);
  int minor = int.parse(match.group(2)!);
  int patch = int.parse(match.group(3)!);

  switch (levelChange) {
    case 'major':
      major++;
      minor = 0;
      patch = 0;
      break;
    case 'minor':
      minor++;
      patch = 0;
      break;
    case 'patch':
      patch++;
      break;
    default:
      print('Error: Invalid version level. Use major, minor, or patch.');
      exit(1);
  }

  String newVersionName = '$major.$minor.$patch';
  String newVersion =
      '$newVersionName+${DateTime.now().millisecondsSinceEpoch ~/ 1000}';

  // Actualiza la versión en pubspec.yaml
  content = content.replaceFirst(versionRegex, 'version: $newVersion');
  pubspec.writeAsStringSync(content);

  print('Updated to version: $newVersion');
}
