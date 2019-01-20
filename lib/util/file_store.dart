import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class FileStore {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> writeCounter(Set<String> saved) async {
    final path = await _localPath;
    final file = File('$path/saved_suggestions.json');

    // Write the file
    return file.writeAsString(jsonEncode(saved.toList()));
  }
}
