import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/widgets/studybase_logo.dart';

void main() {
  runApp(const StudyBaseApp());
}

class StudyBaseApp extends StatelessWidget {
  const StudyBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyBase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const _BrandFoundationScreen(),
    );
  }
}

class _BrandFoundationScreen extends StatelessWidget {
  const _BrandFoundationScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: StudyBaseLogo(
          size: 148,
          showWordmark: true,
        ),
      ),
    );
  }
}
