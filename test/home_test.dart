import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/features/home/home_screen.dart';

void main() {
  testWidgets('Home screen renders core study sections', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('StudyBase'), findsOneWidget);
    expect(find.text('Ready to learn?'), findsOneWidget);
    expect(find.text('Subjects'), findsOneWidget);
    expect(find.text('Recent notes'), findsOneWidget);
    expect(find.text('General Knowledge'), findsWidgets);
    expect(find.text('Mathematics'), findsWidgets);
    expect(find.text('Search notes, subjects...'), findsOneWidget);
  });
}
