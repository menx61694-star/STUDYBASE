import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/studybase_search_field.dart';
import '../../core/widgets/subject_tile.dart';
import '../notes/notes_screen.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  static const subjects = [
    (title: 'General Knowledge', icon: Icons.public_rounded, count: 24),
    (title: 'Mathematics', icon: Icons.calculate_rounded, count: 18),
    (title: 'Reasoning', icon: Icons.psychology_rounded, count: 15),
    (title: 'English', icon: Icons.translate_rounded, count: 12),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subjects')),
      body: ListView(
        padding: AppSpacing.page,
        children: [
          Text(
            'Explore subjects',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Choose a subject to find your study notes.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          const StudyBaseSearchField(),
          const SizedBox(height: AppSpacing.xl),
          const StudyBaseSectionHeader(title: 'All subjects'),
          const SizedBox(height: AppSpacing.sm),
          ...subjects.map(
            (subject) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: StudyBaseSubjectTile(
                title: subject.title,
                icon: subject.icon,
                noteCount: subject.count,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NotesScreen(subject: subject.title),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
