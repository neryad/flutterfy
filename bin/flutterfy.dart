import 'package:flutterfy/flutterfy.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Error: Please provide a version level (major, minor, patch)');
    return;
  }
  updateVersion(args[0]);
}
