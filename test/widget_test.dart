import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/main.dart';

void main() {
  test('launcher source is a registered PNG asset', () async {
    final data = await rootBundle.load('assets/branding/studybase_launcher.png');
    final bytes = data.buffer.asUint8List();

    expect(bytes.length, greaterThan(32));
    expect(bytes.sublist(0, 8), <int>[137, 80, 78, 71, 13, 10, 26, 10]);
  });

  testWidgets('StudyBase brand foundation renders', (WidgetTester tester) async {
    await tester.pumpWidget(const StudyBaseApp());

    expect(find.text('StudyBase'), findsOneWidget);
    expect(find.bySemanticsLabel('StudyBase logo'), findsOneWidget);
  });
}
