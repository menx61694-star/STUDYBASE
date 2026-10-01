import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybase/features/notifications/notifications_screen.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('shows updates and marks a notification as read', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotificationsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Welcome to StudyBase'), findsOneWidget);
    expect(find.text('3 unread updates'), findsOneWidget);

    await tester.tap(find.text('Welcome to StudyBase'));
    await tester.pumpAndSettle();

    expect(find.text('2 unread updates'), findsOneWidget);
    final preferences = await SharedPreferences.getInstance();
    expect(preferences.getStringList('read_notification_ids'), contains('welcome'));
  });

  testWidgets('mark all read clears unread count', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotificationsScreen()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mark all read'));
    await tester.pumpAndSettle();

    expect(find.text('You are all caught up.'), findsOneWidget);
    expect(find.text('Mark all read'), findsNothing);
  });
}
