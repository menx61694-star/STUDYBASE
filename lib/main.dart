import 'package:flutter/material.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2F80ED),
          brightness: Brightness.light,
        ),
      ),
      home: const _FoundationScreen(),
    );
  }
}

class _FoundationScreen extends StatelessWidget {
  const _FoundationScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'StudyBase',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
