/// This Dart program takes a version level (major, minor, or patch) as a command
/// line argument and updates the version accordingly using the Flutterfy package.
///
/// Args:
///   arguments (List<String>): The `arguments` variable in the `main` function is a
/// list of strings that contains the command-line arguments passed to the Dart
/// program when it is executed. In this case, the program expects the user to
/// provide a version level (major, minor, or patch) as a command-line argument.
import 'dart:io';

import 'package:flutterfy/flutterfy.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Error: Please provide a version level (major, minor, patch)');
    exit(1);
  }

  updateVersion(arguments[0]);
}
