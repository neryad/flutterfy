# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.1+1727741864] - 2025-08-11

### Added

- 🚀 **pub.dev Package Support**: Full restructure for pub.dev distribution
- 📦 **Global Installation**: Install globally with `dart pub global activate flutterfy`
- 🔧 **Programmatic API**: Use Flutterfy functions directly in your Dart code
- 📚 **Comprehensive Examples**: Added example/ directory with usage demonstrations
- 🏷️ **Better Argument Parsing**: Improved CLI with `--build=NUMBER` syntax
- 🎯 **Enhanced Documentation**: Professional README with badges, examples, and guides
- 🧪 **Test Framework**: Added test structure for better reliability
- 🌐 **Cross-Platform Support**: Explicit support for all major platforms
- 📝 **Rich Metadata**: Added topics, funding, and repository information

### Improved

- 🛡️ **Error Handling**: More descriptive error messages with emojis
- 💻 **CLI Interface**: Cleaner help messages and better UX
- 🔍 **Version Detection**: More robust regex patterns for version parsing
- 📖 **Code Documentation**: Added comprehensive inline documentation
- 🎨 **Output Formatting**: Better visual feedback with success/error indicators

### Changed

- 🏗️ **Project Structure**: Reorganized to follow pub.dev standards
  - Main logic moved to `lib/src/version_updater.dart`
  - CLI executable in `bin/flutterfy.dart`
  - Public API exported from `lib/flutterfy.dart`
- 📋 **Dependencies**: Added useful packages (args, yaml, path, io)
- 🎯 **Targeting**: Updated SDK constraints to `>=3.0.0 <4.0.0`

### Fixed

- 🐛 **Build Number Handling**: Fixed edge cases with custom build numbers
- 🔄 **Version Transitions**: Better handling of versions without build numbers
- 📄 **File Encoding**: Improved file reading with proper error handling

## [1.0.1+1727741864] - 2024-09-30

### Fixed

- 🔧 **YAML Parsing**: Fix on yaml file parsing and version detection

### Notes

- Improved stability when reading pubspec.yaml files
- Better error messages for debugging

## [1.0.0] - 2024-09-30

### Added

- 🎉 **Initial Release**: First working version of Flutterfy
- 📈 **Version Management**: Support for major, minor, and patch version increments
- 🔨 **CLI Interface**: Command-line functionality for version updates
- 🛡️ **Error Handling**: Basic error handling for missing files and invalid versions
- 📝 **Build Numbers**: Support for build number generation and custom values
- 🎯 **Semantic Versioning**: Full compliance with semantic versioning standards

### Features

- Update versions with simple commands: `major`, `minor`, `patch`
- Automatic build number generation using timestamps
- Custom build number support
- Validation of pubspec.yaml format and structure
- Cross-platform compatibility (Windows, macOS, Linux)

### Notes

- Ensure that the `pubspec.yaml` file has the correct format (e.g., `version: 1.0.0+1`) for the functionality to work properly
- Recommended to add `+1` to the version if you receive the error "version not found in pubspec.yaml"
- Initial version focused on core functionality and reliability

---

## 🚀 Upcoming Features (Roadmap)

### v1.2.0 (Planned)

- 🎨 Interactive CLI with prompts and confirmations
- 📊 Version history tracking and rollback capabilities
- 🔄 Git tag automation integration
- 🌐 Web dashboard for team version management
- 📱 Flutter plugin for IDE integration

### v1.3.0 (Future)

- 🤖 AI-powered version suggestions based on commit messages
- 📈 Analytics and version usage insights
- 🔐 Advanced validation rules and policies
- 🌍 Multi-project workspace support
- 🎯 Custom version patterns and formats

---

## 📋 Migration Guide

### From 1.0.x to 1.1.x

No breaking changes! Simply update your installation method:

**Old way:**

```bash
dart run bin/flutterfy.dart patch
```

**New way (recommended):**

```bash
dart pub global activate flutterfy
flutterfy patch
```

### Programmatic Usage (New in 1.1.0)

```dart
import 'package:flutterfy/flutterfy.dart';

// Now you can use Flutterfy in your Dart code
updateVersion('patch', null);
updateVersion('minor', '42');
```

---

## 🤝 Contributing

We follow [Conventional Commits](https://www.conventionalcommits.org/) for our changelog generation.

### Commit Types

- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

### Example

```bash
git commit -m "feat: add interactive CLI prompts"
git commit -m "fix: resolve build number parsing issue"
git commit -m "docs: update installation instructions"
```
