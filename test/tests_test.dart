import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/features/tests/tests_screen.dart';

void main() {
  testWidgets('Mock tests list available practice sets', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: TestsScreen()));
    expect(find.text('Mock Tests'), findsOneWidget);
    expect(find.text('General Knowledge — Practice 01'), findsOneWidget);
    expect(find.text('Mathematics — Quick Practice'), findsOneWidget);
    expect(find.text('Reasoning — Starter Set'), findsOneWidget);
    expect(find.text('Start test'), findsNWidgets(3));
  });

  testWidgets('Quiz requires answers and displays score and explanations', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: TestsScreen()));
    await tester.tap(find.text('Start test').first);
    await tester.pumpAndSettle();
    expect(find.text('Question 1 of 5'), findsOneWidget);
    await tester.tap(find.text('Part III'));
    await tester.pump();
    await tester.tap(find.text('Next question'));
    await tester.pumpAndSettle();
    expect(find.text('Question 2 of 5'), findsOneWidget);
    await tester.tap(find.text('Bhopal'));
    await tester.pump();
    await tester.tap(find.text('Next question'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mars'));
    await tester.pump();
    await tester.tap(find.text('Next question'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('1935'));
    await tester.pump();
    await tester.tap(find.text('Next question'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pacific Ocean'));
    await tester.pump();
    await tester.tap(find.text('Submit test'));
    await tester.pumpAndSettle();
    expect(find.text('Test completed'), findsOneWidget);
    expect(find.text('Your score: 5 / 5'), findsOneWidget);
    expect(find.textContaining('Fundamental Rights are provided in Part III'), findsOneWidget);
  });
}
