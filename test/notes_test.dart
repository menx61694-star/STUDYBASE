import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/features/notes/notes_screen.dart';

void main() {
  testWidgets('Notes screen renders the notes list', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotesScreen()));

    expect(find.text('Notes'), findsOneWidget);
    expect(find.text('Study notes'), findsOneWidget);
    expect(find.text('All notes'), findsOneWidget);
    expect(find.text('General Knowledge — Quick Revision'), findsOneWidget);
    expect(find.text('Mathematics — Practice Set 01'), findsOneWidget);
    expect(find.text('Reasoning — Important Questions'), findsOneWidget);
    expect(find.text('English — Grammar Essentials'), findsOneWidget);
    expect(find.text('Search notes, subjects...'), findsOneWidget);
  });

  testWidgets('Notes screen can be scoped to a subject', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: NotesScreen(subject: 'Mathematics')),
    );

    expect(find.text('Mathematics Notes'), findsOneWidget);
    expect(find.text('Notes for Mathematics'), findsOneWidget);
    expect(find.text('Mathematics — Practice Set 01'), findsOneWidget);
    expect(find.text('General Knowledge — Quick Revision'), findsNothing);
  });
}
