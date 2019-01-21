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

    // Write the file
    return file.writeAsString(jsonEncode(saved.toList()));
  }

  static Future<Set<String>> readSuggestions() async {
    try {
      final path = await _localPath;
      final file = File('$path/saved_suggestions.json');

      // Read the file
      String contents = await file.readAsString();
      Set<String> savedSuggestions = jsonDecode(contents);

      return savedSuggestions;
    } catch (e) {
      // If we encounter an error, return 0
      return new Set<String>();
    }
  }
}
