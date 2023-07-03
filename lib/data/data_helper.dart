import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DataHelper {
  late Directory _directory;

  initDirectory() async {
    _directory = await getApplicationDocumentsDirectory();
  }

  Future<String> get directory async => _directory.path;

  saveData(List<int> data) async {
    final file = File('$directory/certificate.png');
    file.writeAsBytes(data);
  }
}
