import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DownloadsService {
  DownloadsService._();

  static Future<String> savePdf({
    required String title,
    String? assetPath,
    Uri? uri,
  }) async {
    if ((assetPath == null) == (uri == null)) {
      throw ArgumentError('Provide exactly one PDF source.');
    }

    final List<int> bytes;
    if (assetPath != null) {
      final data = await rootBundle.load(assetPath);
      bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
    } else {
      final response = await http.get(uri!).timeout(
        const Duration(seconds: 30),
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw HttpException('PDF download failed: HTTP ${response.statusCode}');
      }
      bytes = response.bodyBytes;
    }

    if (bytes.isEmpty) {
      throw const FormatException('The PDF is empty.');
    }

    final documents = await getApplicationDocumentsDirectory();
    final directory = Directory('${documents.path}/StudyBase/Downloads');
    await directory.create(recursive: true);

    final safeName = title
        .replaceAll(RegExp(r'[^a-zA-Z0-9 _-]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '_');
    final file = File('${directory.path}/${safeName.isEmpty ? 'note' : safeName}.pdf');
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }
}
