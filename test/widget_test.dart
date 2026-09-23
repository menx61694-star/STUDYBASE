import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybase/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  test('launcher source is a registered PNG asset', () async {
    final data = await rootBundle.load('assets/branding/studybase_launcher.png');
    final bytes = data.buffer.asUint8List();

    expect(bytes.length, greaterThan(32));
    expect(bytes.sublist(0, 8), <int>[137, 80, 78, 71, 13, 10, 26, 10]);
  });

  testWidgets('StudyBase splash and onboarding flow renders',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StudyBaseApp());

    expect(find.bySemanticsLabel('StudyBase logo'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pump();

    expect(find.text('Learn smarter'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
  });

  testWidgets('onboarding exposes all core learning steps',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StudyBaseApp());
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pump();

    expect(find.text('Learn smarter'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Keep your notes close'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Practice and grow'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
