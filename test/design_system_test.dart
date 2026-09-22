import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/core/widgets/note_card.dart';
import 'package:studybase/core/widgets/primary_button.dart';
import 'package:studybase/core/widgets/section_header.dart';
import 'package:studybase/core/widgets/studybase_search_field.dart';
import 'package:studybase/core/widgets/subject_tile.dart';

void main() {
  testWidgets('common StudyBase components render', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const StudyBaseSectionHeader(title: 'Popular Subjects'),
              const StudyBaseSearchField(),
              const StudyBaseSubjectTile(
                title: 'Mathematics',
                noteCount: 120,
                icon: Icons.calculate_rounded,
              ),
              const StudyBaseNoteCard(
                title: 'Number System',
                subject: 'Mathematics',
              ),
              StudyBasePrimaryButton(
                label: 'Continue',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Popular Subjects'), findsOneWidget);
    expect(find.text('Mathematics'), findsOneWidget);
    expect(find.text('Number System'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);
  });
}
