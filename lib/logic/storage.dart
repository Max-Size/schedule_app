import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class WeekStorage {
  const WeekStorage();
  Future<String> get _getLocalPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/schedule.json');
  }

  Future<void> writeToFile(String text) async {
    final file = await getLocalFile;
    file.writeAsStringSync(text);
  }

  Future<String> readFromFile() async {
    try {
      final file = await getLocalFile;
      return file.readAsStringSync();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return '{}';
    }
  }
}
