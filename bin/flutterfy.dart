#!/usr/bin/env dart

import 'package:flutterfy/flutterfy.dart';
import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty ||
      arguments.contains('--help') ||
      arguments.contains('-h')) {
    _showHelp();
    exit(arguments.isEmpty ? 1 : 0);
  }

  String levelChange = arguments[0].toLowerCase();
  String? customBuildNumber;

  if (arguments.length > 1 && arguments[1].startsWith('--build=')) {
    customBuildNumber = arguments[1].substring(8);
  }

  updateVersion(levelChange, customBuildNumber);
}

void _showHelp() {
  print('''
🚀 Flutterfy - Version Management Tool

Usage:
  flutterfy <level> [--build=NUMBER]

Levels:
  major    Increment major version (1.0.0 -> 2.0.0)
  minor    Increment minor version (1.0.0 -> 1.1.0) 
  patch    Increment patch version (1.0.0 -> 1.0.1)

Options:
  --build=NUMBER    Specify a custom build number
  --help, -h        Show this help

Examples:
  flutterfy patch
  flutterfy minor --build=42
  flutterfy major
''');
}
