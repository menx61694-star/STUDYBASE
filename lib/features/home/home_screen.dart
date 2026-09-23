import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/widgets/note_card.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/studybase_search_field.dart';
import '../../core/widgets/subject_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const subjects = [
    (title: 'General Knowledge', icon: Icons.public_rounded, count: 24),
    (title: 'Mathematics', icon: Icons.calculate_rounded, count: 18),
    (title: 'Reasoning', icon: Icons.psychology_rounded, count: 15),
    (title: 'English', icon: Icons.translate_rounded, count: 12),
  ];

  static const recentNotes = [
    (title: 'General Knowledge — Quick Revision', subject: 'General Knowledge'),
    (title: 'Mathematics — Practice Set 01', subject: 'Mathematics'),
    (title: 'Reasoning — Important Questions', subject: 'Reasoning'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudyBase'),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            tooltip: 'Profile',
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.page,
          children: [
            Text(
              'Ready to learn?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Find notes, practice and keep learning.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.lg),
            const StudyBaseSearchField(),
            const SizedBox(height: AppSpacing.xl),
            SectionHeader(title: 'Subjects', actionLabel: 'View all', onAction: () {}),
            const SizedBox(height: AppSpacing.sm),
            ...subjects.map(
              (subject) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: StudyBaseSubjectTile(
                  title: subject.title,
                  icon: subject.icon,
                  noteCount: subject.count,
                  onTap: () {},
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionHeader(
              title: 'Recent notes',
              actionLabel: 'View all',
              onAction: () {},
            ),
            const SizedBox(height: AppSpacing.sm),
            ...recentNotes.map(
              (note) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: StudyBaseNoteCard(
                  title: note.title,
                  subject: note.subject,
                  onOpen: () {},
                  onDownload: () {},
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Subjects',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            selectedIcon: Icon(Icons.quiz_rounded),
            label: 'Tests',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
