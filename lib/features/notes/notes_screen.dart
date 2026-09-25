import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/widgets/note_card.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/studybase_search_field.dart';
import 'pdf_viewer_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key, this.subject});

  final String? subject;

  static const notes = [
    (title: 'General Knowledge — Quick Revision', subject: 'General Knowledge'),
    (title: 'Mathematics — Practice Set 01', subject: 'Mathematics'),
    (title: 'Reasoning — Important Questions', subject: 'Reasoning'),
    (title: 'English — Grammar Essentials', subject: 'English'),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = subject == null
        ? notes
        : notes.where((note) => note.subject == subject).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(subject == null ? 'Notes' : '$subject Notes'),
      ),
      body: ListView(
        padding: AppSpacing.page,
        children: [
          Text(
            subject == null ? 'Study notes' : 'Notes for $subject',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Open a note to continue studying or save it for offline access.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          const StudyBaseSearchField(),
          const SizedBox(height: AppSpacing.xl),
          StudyBaseSectionHeader(
            title: subject == null ? 'All notes' : subject!,
          ),
          const SizedBox(height: AppSpacing.sm),
          ...filtered.map(
            (note) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: StudyBaseNoteCard(
                title: note.title,
                subject: note.subject,
                onOpen: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PdfViewerScreen(
                        title: note.title,
                        assetPath: 'assets/pdfs/studybase_preview.pdf',
                      ),
                    ),
                  );
                },
                onDownload: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
