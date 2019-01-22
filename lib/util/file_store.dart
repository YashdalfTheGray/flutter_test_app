import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class FileStore {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> writeSuggestions(Set<String> saved) async {
    final path = await _localPath;
    final file = File('$path/saved_suggestions.json');

    return file.writeAsString(jsonEncode(saved.toList()));
  }

  static Future<Set<String>> readSuggestions() async {
    try {
      final path = await _localPath;
      final file = File('$path/saved_suggestions.json');

      String contents = await file.readAsString();
      return Set<String>.from(jsonDecode(contents));
    } catch (e) {
      print(e);
      return new Set<String>();
    }
  }
}
