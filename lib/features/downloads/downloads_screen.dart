import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/widgets/empty_state.dart';
import 'downloads_service.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key, this.initialDownloads});

  /// Allows the initial list to be supplied by tests or a parent screen.
  final Future<List<File>>? initialDownloads;

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  late Future<List<File>> _downloads;

  @override
  void initState() {
    super.initState();
    _downloads = widget.initialDownloads ?? DownloadsService.listSavedPdfs();
  }

  Future<void> _refresh() async {
    final next = DownloadsService.listSavedPdfs();
    setState(() => _downloads = next);
    await next;
  }

  Future<void> _delete(File file) async {
    try {
      await DownloadsService.deleteSavedPdf(file);
      if (!mounted) return;
      await _refresh();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Download removed.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not delete this download.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Downloads')),
      body: FutureBuilder<List<File>>(
        future: _downloads,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: AppSpacing.page,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Could not load downloads.'),
                    const SizedBox(height: AppSpacing.sm),
                    OutlinedButton(onPressed: _refresh, child: const Text('Retry')),
                  ],
                ),
              ),
            );
          }
          final files = snapshot.data ?? const <File>[];
          if (files.isEmpty) {
            return const StudyBaseEmptyState(
              icon: Icons.download_for_offline_outlined,
              title: 'No downloads yet',
              message: 'Save a PDF from Notes to read it offline here.',
            );
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.separated(
              padding: AppSpacing.page,
              itemCount: files.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final file = files[index];
                final name = file.uri.pathSegments.last
                    .replaceAll(RegExp(r'\.pdf$', caseSensitive: false), '')
                    .replaceAll('_', ' ');
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.picture_as_pdf_rounded),
                    title: Text(name, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: const Text('Available offline • PDF'),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => _LocalPdfScreen(file: file, title: name),
                      ),
                    ),
                    trailing: IconButton(
                      tooltip: 'Delete download',
                      icon: const Icon(Icons.delete_outline_rounded),
                      onPressed: () => _delete(file),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _LocalPdfScreen extends StatelessWidget {
  const _LocalPdfScreen({required this.file, required this.title});

  final File file;
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfViewer.file(file.path),
      );
}
