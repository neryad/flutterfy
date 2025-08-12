import 'dart:io';
import 'package:flutterfy/flutterfy.dart';

/// Example demonstrating how to use the Version Updater package
///
/// This example shows different ways to update version numbers in your pubspec.yaml:
/// - Incrementing patch, minor, and major versions
/// - Using custom build numbers
/// - Handling different version formats
void main() async {
  print('=== Version Updater Example ===\n');

  // First, let's create a sample pubspec.yaml for demonstration
  await _createSamplePubspec();

  print('📝 Created sample pubspec.yaml with version: 1.0.0\n');

  // Example 1: Patch update (increments patch version)
  print('🔄 Example 1: Updating patch version...');
  try {
    updateVersion('patch', null);
    await _showCurrentVersion();
  } catch (e) {
    print('Error: $e');
  }

  await _pause();

  // Example 2: Minor update (increments minor, resets patch)
  print('\n🔄 Example 2: Updating minor version...');
  try {
    updateVersion('minor', null);
    await _showCurrentVersion();
  } catch (e) {
    print('Error: $e');
  }

  await _pause();

  // Example 3: Patch with custom build number
  print('\n🔄 Example 3: Patch update with custom build number...');
  try {
    updateVersion('patch', '100');
    await _showCurrentVersion();
  } catch (e) {
    print('Error: $e');
  }

  await _pause();

  // Example 4: Major update (increments major, resets minor and patch)
  print('\n🔄 Example 4: Updating major version...');
  try {
    updateVersion('major', null);
    await _showCurrentVersion();
  } catch (e) {
    print('Error: $e');
  }

  await _pause();

  // Example 5: Show different usage scenarios
  print('\n📚 Usage Examples:\n');

  print('// Basic usage - increment patch version');
  print('updateVersion("patch", null);');
  print('// Result: 1.0.0 → 1.0.1+[timestamp]\n');

  print('// Increment minor version');
  print('updateVersion("minor", null);');
  print('// Result: 1.0.1+123 → 1.1.0+[timestamp]\n');

  print('// Increment major version');
  print('updateVersion("major", null);');
  print('// Result: 1.1.0+123 → 2.0.0+[timestamp]\n');

  print('// Use custom build number');
  print('updateVersion("patch", "42");');
  print('// Result: 1.0.0 → 1.0.1+42\n');

  // Show programmatic usage
  await _showProgrammaticUsage();

  // Cleanup
  await _cleanup();

  print(
      '\n✅ Example completed! Check the generated pubspec.yaml to see the changes.');
  print('\n💡 Tips:');
  print('   - Always backup your pubspec.yaml before making changes');
  print('   - Use semantic versioning: major.minor.patch+build');
  print('   - Major: breaking changes, Minor: new features, Patch: bug fixes');
}

/// Creates a sample pubspec.yaml file for demonstration
Future<void> _createSamplePubspec() async {
  final pubspec = File('pubspec.yaml');
  const sampleContent = '''name: my_awesome_app
description: A sample Flutter application for version updater demo.
publish_to: 'none'

version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
''';

  await pubspec.writeAsString(sampleContent);
}

/// Shows the current version in pubspec.yaml
Future<void> _showCurrentVersion() async {
  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    print('❌ pubspec.yaml not found');
    return;
  }

  final content = await pubspec.readAsString();
  final versionMatch = RegExp(r'version:\s*(.+)').firstMatch(content);

  if (versionMatch != null) {
    print('📋 Current version: ${versionMatch.group(1)}');
  }
}

/// Demonstrates programmatic usage patterns
Future<void> _showProgrammaticUsage() async {
  print('🔧 Programmatic Usage Examples:\n');

  print('''
// In your Dart application or script:

void deploymentScript() {
  try {
    // Update version before building
    updateVersion('patch', null);
    print('Version updated for deployment');
    
    // Your build process here...
    // buildApp();
    // deployToStore();
    
  } catch (e) {
    print('Failed to update version: \$e');
  }
}

// Conditional version updates
void conditionalUpdate(bool isHotfix, bool hasBreakingChanges) {
  if (hasBreakingChanges) {
    updateVersion('major', null);
  } else if (isHotfix) {
    updateVersion('patch', null);
  } else {
    updateVersion('minor', null);
  }
}

// Custom build numbers for CI/CD
void cicdUpdate(String buildId) {
  updateVersion('patch', buildId);
  print('Updated for build: \$buildId');
}
''');
}

/// Pauses execution to show results
Future<void> _pause() async {
  await Future.delayed(Duration(milliseconds: 500));
}

/// Cleans up example files
Future<void> _cleanup() async {
  print('\n🧹 Cleaning up example files...');
  // In a real scenario, you might want to restore the original pubspec.yaml
  // or move the example file to a different location
}
