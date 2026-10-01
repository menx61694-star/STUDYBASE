import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DownloadsService {
  DownloadsService._();

  static Future<Directory> _downloadsDirectory() async {
    final documents = await getApplicationDocumentsDirectory();
    final directory = Directory('${documents.path}/StudyBase/Downloads');
    await directory.create(recursive: true);
    return directory;
  }

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
      bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    } else {
      final response = await http.get(uri!).timeout(const Duration(seconds: 30));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw HttpException('PDF download failed: HTTP ${response.statusCode}');
      }
      bytes = response.bodyBytes;
    }
    if (bytes.isEmpty) throw const FormatException('The PDF is empty.');

    final directory = await _downloadsDirectory();
    final safeName = title
        .replaceAll(RegExp(r'[^a-zA-Z0-9 _-]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '_');
    final file = File('${directory.path}/${safeName.isEmpty ? 'note' : safeName}.pdf');
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  static Future<List<File>> listSavedPdfs() async {
    final directory = await _downloadsDirectory();
    final files = await directory
        .list()
        .where((entity) => entity is File && entity.path.toLowerCase().endsWith('.pdf'))
        .cast<File>()
        .toList();
    files.sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
    return files;
  }

  static Future<void> deleteSavedPdf(File file) async {
    final directory = await _downloadsDirectory();
    final parent = file.parent.absolute.path;
    if (parent != directory.absolute.path) {
      throw ArgumentError('File is outside the StudyBase downloads folder.');
    }
    if (await file.exists()) await file.delete();
  }
}
