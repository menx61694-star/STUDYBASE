import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

import '../../core/theme/app_colors.dart';

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
            onPressed: () {},
            icon: const Icon(Icons.download_outlined),
          ),
        ],
      ),
      body: viewer,
    );
  }
}
