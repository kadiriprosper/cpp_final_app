import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ImageManager {
  Dio dio = Dio();

  Future<Map<bool, String?>> imageDownloader(String url) async {
    String fileName = 'cppProfImg.png';
    String filePath = await _getFilePath(fileName);
    try {
      await dio.download(
        url,
        filePath,
        deleteOnError: true,
      );
      return {
        true: filePath,
      };
    } catch (e) {}
    return {
      false: null,
    };
  }

  Future<String> _getFilePath(String fileName) async {
    Directory? dir;
    try {
      if (Platform.isIOS) {
        dir = await getApplicationDocumentsDirectory();
      } else {
        dir = Directory('/storage/emulated/0/Download/');
        if (!await dir.exists()) dir = (await getExternalStorageDirectory());
      }
    } catch (e) {
      print('$e occured');
    }
    return "${dir?.path}$fileName";
  }
}
