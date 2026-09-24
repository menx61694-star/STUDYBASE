import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/features/subjects/subjects_screen.dart';

void main() {
  testWidgets('Subjects screen renders all study subjects', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SubjectsScreen()));

    expect(find.text('Subjects'), findsOneWidget);
    expect(find.text('Explore subjects'), findsOneWidget);
    expect(find.text('All subjects'), findsOneWidget);
    expect(find.text('General Knowledge'), findsOneWidget);
    expect(find.text('Mathematics'), findsOneWidget);
    expect(find.text('Reasoning'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Search notes, subjects...'), findsOneWidget);
  });
}
