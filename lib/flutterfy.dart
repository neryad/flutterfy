import 'dart:developer';
import 'dart:io';

/// Improved script for updating versions in pubspec.yaml
/// Supports semantic versioning with robust build number handling
void main(List<String> arguments) {
  if (arguments.isEmpty ||
      arguments.contains('--help') ||
      arguments.contains('-h')) {
    _showHelp();
    exit(arguments.isEmpty ? 1 : 0);
  }

  String levelChange = arguments[0].toLowerCase();
  String? customBuildNumber;

  // Look for custom build number
  if (arguments.length > 1 && arguments[1].startsWith('--build=')) {
    customBuildNumber = arguments[1].substring(8);
  }

  updateVersion(levelChange, customBuildNumber);
}

void _showHelp() {
  print('''
Version Updater - Updates versions in pubspec.yaml

Usage:
  dart version_updater.dart <level> [--build=NUMBER]

Levels:
  major    Increment major version (1.0.0 -> 2.0.0)
  minor    Increment minor version (1.0.0 -> 1.1.0) 
  patch    Increment patch version (1.0.0 -> 1.0.1)

Options:
  --build=NUMBER    Specify a custom build number
  --help, -h        Show this help

Examples:
  dart version_updater.dart patch
  dart version_updater.dart minor --build=42
  dart version_updater.dart major
''');
}

void updateVersion(String levelChange, String? customBuildNumber) {
  final pubspec = File('pubspec.yaml');

  // Check file existence
  if (!pubspec.existsSync()) {
    _logError('pubspec.yaml not found in current directory');
    exit(1);
  }

  String content;
  try {
    content = pubspec.readAsStringSync();
  } catch (e) {
    _logError('Error reading pubspec.yaml: $e');
    exit(1);
  }

  // Improved regex that handles versions with or without build numbers
  RegExp versionWithBuildRegex =
      RegExp(r'version:\s*(\d+)\.(\d+)\.(\d+)\+(\d+)');
  RegExp versionWithoutBuildRegex =
      RegExp(r'version:\s*(\d+)\.(\d+)\.(\d+)(?!\+)');

  Match? matchWithBuild = versionWithBuildRegex.firstMatch(content);
  Match? matchWithoutBuild = versionWithoutBuildRegex.firstMatch(content);

  int major, minor, patch;
  int? currentBuildNumber;
  RegExp replaceRegex;

  if (matchWithBuild != null) {
    // Version with existing build number
    major = int.parse(matchWithBuild.group(1)!);
    minor = int.parse(matchWithBuild.group(2)!);
    patch = int.parse(matchWithBuild.group(3)!);
    currentBuildNumber = int.parse(matchWithBuild.group(4)!);
    replaceRegex = versionWithBuildRegex;
    print('Current version: $major.$minor.$patch+$currentBuildNumber');
  } else if (matchWithoutBuild != null) {
    // Version without build number
    major = int.parse(matchWithoutBuild.group(1)!);
    minor = int.parse(matchWithoutBuild.group(2)!);
    patch = int.parse(matchWithoutBuild.group(3)!);
    currentBuildNumber = null;
    replaceRegex = versionWithoutBuildRegex;
    print('Current version: $major.$minor.$patch (no build number)');
  } else {
    _logError('No valid version found in pubspec.yaml');
    _logError('Expected format: version: X.Y.Z or version: X.Y.Z+BUILD');
    exit(1);
  }

  // Update version according to level
  String oldVersion =
      '$major.$minor.$patch${currentBuildNumber != null ? '+$currentBuildNumber' : ''}';

  switch (levelChange) {
    case 'major':
      major++;
      minor = 0;
      patch = 0;
      currentBuildNumber = null; // Reset build number on major
      break;
    case 'minor':
      minor++;
      patch = 0;
      currentBuildNumber = null; // Reset build number on minor
      break;
    case 'patch':
      patch++;
      // For patch, preserve or increment build number
      break;
    default:
      _logError('Invalid version level: $levelChange');
      _logError('Use: major, minor, or patch');
      exit(1);
  }

  // Determine build number for new version
  int newBuildNumber;
  if (customBuildNumber != null) {
    try {
      newBuildNumber = int.parse(customBuildNumber);
    } catch (e) {
      _logError('Invalid build number: $customBuildNumber');
      exit(1);
    }
  } else if (levelChange == 'patch' && currentBuildNumber != null) {
    // For patches, increment existing build number
    newBuildNumber = currentBuildNumber + 1;
  } else {
    // For major/minor or when no build number exists, use timestamp
    newBuildNumber = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  String newVersion = '$major.$minor.$patch+$newBuildNumber';

  // Update content
  try {
    content = content.replaceFirst(replaceRegex, 'version: $newVersion');
    pubspec.writeAsStringSync(content);
  } catch (e) {
    _logError('Error writing pubspec.yaml: $e');
    exit(1);
  }

  // Show result
  print('✅ Version updated successfully:');
  print('   Previous: $oldVersion');
  print('   New:      $newVersion');
  print('   Change:   $levelChange');
}

void _logError(String message) {
  print('❌ Error: $message');
}
