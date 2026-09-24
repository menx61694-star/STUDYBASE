import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/features/home/home_screen.dart';
import 'package:studybase/core/widgets/section_header.dart';

void main() {
  testWidgets('Home screen renders core study sections', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('StudyBase'), findsOneWidget);
    expect(find.text('Ready to learn?'), findsOneWidget);
    expect(find.widgetWithText(StudyBaseSectionHeader, 'Subjects'), findsOneWidget);
    final recentNotes = find.widgetWithText(StudyBaseSectionHeader, 'Recent notes');
    await tester.ensureVisible(recentNotes);
    expect(recentNotes, findsOneWidget);
    expect(find.text('General Knowledge'), findsWidgets);
    expect(find.text('Mathematics'), findsWidgets);
    expect(find.text('Search notes, subjects...'), findsOneWidget);
  });
}
