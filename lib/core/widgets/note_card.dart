import 'package:flutter/material.dart';

class StudyBaseNoteCard extends StatelessWidget {
  const StudyBaseNoteCard({
    super.key,
    required this.title,
    required this.subject,
    this.onOpen,
    this.onDownload,
  });

  final String title;
  final String subject;
  final VoidCallback? onOpen;
  final VoidCallback? onDownload;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onOpen,
        leading: CircleAvatar(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
          foregroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.picture_as_pdf_rounded),
        ),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text('$subject • PDF'),
        trailing: IconButton(
          tooltip: 'Download',
          onPressed: onDownload,
          icon: const Icon(Icons.download_rounded),
        ),
      ),
    );
  }
}
