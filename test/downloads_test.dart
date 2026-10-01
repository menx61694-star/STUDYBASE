import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/features/downloads/downloads_screen.dart';

void main() {
  testWidgets('Downloads screen shows offline empty state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: DownloadsScreen(initialDownloads: Future.value(<File>[]))),
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('Downloads'), findsOneWidget);
    expect(find.text('No downloads yet'), findsOneWidget);
    expect(find.text('Save a PDF from Notes to read it offline here.'), findsOneWidget);
  });
}
