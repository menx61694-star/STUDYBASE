import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybase/features/profile/profile_screen.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('validates and saves profile details locally', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Your learning profile'), findsOneWidget);
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    expect(find.text('Enter a display name'), findsOneWidget);

    await tester.enterText(find.widgetWithText(TextFormField, 'Enter your name'), 'Vivek');
    await tester.enterText(find.widgetWithText(TextFormField, 'you@example.com'), 'vivek@example.com');
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();

    final preferences = await SharedPreferences.getInstance();
    expect(preferences.getString('profile_display_name'), 'Vivek');
    expect(preferences.getString('profile_email'), 'vivek@example.com');
    expect(find.text('Profile saved on this device.'), findsOneWidget);
  });

  testWidgets('loads saved profile values', (tester) async {
    SharedPreferences.setMockInitialValues({
      'profile_display_name': 'Learner',
      'profile_email': 'learner@example.com',
    });
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Learner'), findsOneWidget);
    expect(find.text('learner@example.com'), findsOneWidget);
  });
}
