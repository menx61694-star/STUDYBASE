import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/main.dart';

void main() {
  testWidgets('StudyBase foundation renders', (WidgetTester tester) async {
    await tester.pumpWidget(const StudyBaseApp());

    expect(find.text('StudyBase'), findsOneWidget);
  });
}
