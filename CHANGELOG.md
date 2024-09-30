# Changelog

## [1.0.0] - 2024-09-30

### Added

- Initial functionality to update the version in the `pubspec.yaml` file.
- Support for version changes at major, minor, and patch levels.
- Error handling if the `pubspec.yaml` file is not found or if the version is not defined.
- Command-line functionality to execute version updates.

### Notes

- Ensure that the `pubspec.yaml` file has the correct format (e.g., `version: 1.0.0+1`) for the functionality to work properly.
- Recommended to add `+1` to the version if you receive the error "version not found in pubspec.yaml".
