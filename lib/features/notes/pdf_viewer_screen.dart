import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

import '../downloads/downloads_service.dart';

class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({
    super.key,
    required this.title,
    this.assetPath,
    this.uri,
  }) : assert(assetPath != null || uri != null);

  final String title;
  final String? assetPath;
  final Uri? uri;

  Future<void> _download(BuildContext context) async {
    try {
      final path = await DownloadsService.savePdf(
        title: title,
        assetPath: assetPath,
        uri: uri,
      );
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved for offline use: $path')),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Download failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewer = assetPath != null
        ? PdfViewer.asset(
            assetPath!,
            params: PdfViewerParams(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : PdfViewer.uri(
            uri!,
            params: PdfViewerParams(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            tooltip: 'Download',
            onPressed: () => _download(context),
            icon: const Icon(Icons.download_outlined),
          ),
        ],
      ),
      body: viewer,
    );
  }
}
