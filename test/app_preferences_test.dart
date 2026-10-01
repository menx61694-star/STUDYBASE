import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybase/core/settings/app_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('theme and language preferences persist', () async {
    final preferences = AppPreferences.instance;
    await preferences.load();
    await preferences.setThemeMode(ThemeMode.dark);
    await preferences.setLanguage('hi');

    final stored = await SharedPreferences.getInstance();
    expect(stored.getString('studybase_theme_mode'), 'dark');
    expect(stored.getString('studybase_language'), 'hi');
    expect(preferences.themeMode, ThemeMode.dark);
    expect(preferences.locale.languageCode, 'hi');
  });

  test('unsupported language falls back to English', () async {
    final preferences = AppPreferences.instance;
    await preferences.setLanguage('fr');
    expect(preferences.locale.languageCode, 'en');
  });
}
