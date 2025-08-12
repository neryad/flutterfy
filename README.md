# 🚀 Flutterfy

[![Pub Version](https://img.shields.io/pub/v/flutterfy)](https://pub.dev/packages/flutterfy)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/github/workflow/status/neryad/flutterfy/CI)](https://github.com/neryad/flutterfy/actions)
[![Coverage](https://img.shields.io/codecov/c/github/neryad/flutterfy)](https://codecov.io/gh/neryad/flutterfy)

A powerful and intuitive command-line tool for **Flutter** and **Dart** projects that automates semantic version management in your `pubspec.yaml` file. Say goodbye to manual version updates and embrace automated, error-free versioning!

## ✨ Features

- 🎯 **Semantic Versioning**: Full support for `major.minor.patch+build` format
- 🔧 **Intelligent Build Numbers**: Auto-generates timestamp-based build numbers or accepts custom ones
- 🛡️ **Robust Error Handling**: Comprehensive validation and clear error messages
- 💻 **Cross-Platform**: Works on Windows, macOS, Linux, and CI/CD environments
- 📝 **Smart Detection**: Handles both versioned and non-versioned `pubspec.yaml` files
- ⚡ **Lightning Fast**: Minimal dependencies for maximum performance

## 🚀 Quick Start

### Global Installation (Recommended)

```bash
dart pub global activate flutterfy
```

After installation, use it anywhere:

```bash
flutterfy patch
```

### Local Installation

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  flutterfy: ^1.0.1
```

Then run:

```bash
dart pub get
dart run flutterfy patch
```

## 📖 Usage

### Basic Commands

```bash
# Increment patch version (1.0.0 → 1.0.1+timestamp)
flutterfy patch

# Increment minor version (1.0.1 → 1.1.0+timestamp)
flutterfy minor

# Increment major version (1.1.0 → 2.0.0+timestamp)
flutterfy major

# Use custom build number
flutterfy patch --build=42

# Show help
flutterfy --help
```

### Advanced Usage

```bash
# CI/CD integration with build ID
flutterfy patch --build=$BUILD_NUMBER

# Pre-release versions
flutterfy minor --build=beta-1
```

## 🎮 Interactive Examples

### Before:

```yaml
name: my_awesome_app
version: 1.0.0
```

### After running `flutterfy minor`:

```yaml
name: my_awesome_app
version: 1.1.0+1703123456
```

## 🔧 Programmatic Usage

You can also use Flutterfy in your Dart scripts:

```dart
import 'package:flutterfy/flutterfy.dart';

void main() {
  // Update patch version
  updateVersion('patch', null);

  // Update with custom build number
  updateVersion('minor', '42');
}
```

## 📋 Version Levels Explained

| Level   | Description                       | Example Transform | Use Case            |
| ------- | --------------------------------- | ----------------- | ------------------- |
| `patch` | Bug fixes and small updates       | `1.0.0` → `1.0.1` | 🐛 Bug fixes        |
| `minor` | New features, backward compatible | `1.0.1` → `1.1.0` | ✨ New features     |
| `major` | Breaking changes                  | `1.1.0` → `2.0.0` | 💥 Breaking changes |

## 🛡️ Error Handling

Flutterfy provides clear, actionable error messages:

```bash
❌ Error: pubspec.yaml not found in current directory
❌ Error: No valid version found in pubspec.yaml
❌ Error: Invalid build number: abc123
```

## 🧪 Testing

```bash
# Run tests
dart test

# Run with coverage
dart test --coverage=coverage
genhtml coverage/lcov.info -o coverage/html
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🌟 Support the Project

If Flutterfy has helped you in your projects, consider supporting its development:

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/M4M31DTPAL)

## 📱 Connect with the Creator

Follow **Neryad** for updates and more awesome tools:

- 🟣 **Twitch**: [twitch.tv/neryad](https://twitch.tv/neryad)
- 🐤 **Twitter**: [@neryadg](https://twitter.com/neryadg)
- 🔴 **YouTube Gaming**: [youtube.com/@neryadg](https://youtube.com/@neryadg)
- 📱 **WhatsApp Channel**: [Join Community](https://whatsapp.com/channel/0029VaG0AFBE50Uq77BaL10p)
- 🌐 **Website**: [beacons.ai/neryad](https://beacons.ai/neryad)

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/neryad/flutterfy?style=social)
![GitHub forks](https://img.shields.io/github/forks/neryad/flutterfy?style=social)
![GitHub issues](https://img.shields.io/github/issues/neryad/flutterfy)
![GitHub pull requests](https://img.shields.io/github/issues-pr/neryad/flutterfy)

## 🗂️ Related Projects

- [Flutter Version Manager](https://fvm.app/) - Manage Flutter SDK versions
- [Pub.dev](https://pub.dev/) - The official Dart package repository
- [Semantic Versioning](https://semver.org/) - Learn about semantic versioning

## 📈 Changelog

All notable changes to this project are documented in the [CHANGELOG.md](CHANGELOG.md).

## 🔮 Roadmap

- [ ] 🎨 Interactive CLI with prompts
- [ ] 📊 Version history tracking
- [ ] 🔄 Git tag automation
- [ ] 📱 Flutter plugin integration
- [ ] 🌐 Web dashboard for teams

---

<div align="center">

**Made with ❤️ by [Neryad](https://beacons.ai/neryad)**

_Star ⭐ this repo if you find it helpful!_

</div>
