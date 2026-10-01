import 'package:flutter/material.dart';

import '../../core/settings/app_preferences.dart';
import '../../core/settings/studybase_strings.dart';
import '../../core/theme/app_spacing.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final preferences = AppPreferences.instance;
    final hindi = Localizations.localeOf(context).languageCode == 'hi';
    return AnimatedBuilder(
      animation: preferences,
      builder: (context, _) => Scaffold(
        appBar: AppBar(title: Text(StudyBaseStrings.settings(context))),
        body: ListView(
          padding: AppSpacing.page,
          children: [
            Text(StudyBaseStrings.language(context),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.sm),
            Card(
              child: Column(
                children: [
                  RadioListTile<String>(
                    value: 'en',
                    groupValue: preferences.locale.languageCode,
                    title: const Text('English'),
                    subtitle: const Text('English interface'),
                    onChanged: (value) {
                      if (value != null) preferences.setLanguage(value);
                    },
                  ),
                  RadioListTile<String>(
                    value: 'hi',
                    groupValue: preferences.locale.languageCode,
                    title: const Text('हिन्दी'),
                    subtitle: const Text('Hindi interface'),
                    onChanged: (value) {
                      if (value != null) preferences.setLanguage(value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(StudyBaseStrings.appearance(context),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.sm),
            Card(
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: preferences.themeMode,
                    title: Text(hindi ? 'डिवाइस के अनुसार' : 'System default'),
                    onChanged: (value) {
                      if (value != null) preferences.setThemeMode(value);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: preferences.themeMode,
                    title: Text(hindi ? 'लाइट मोड' : 'Light mode'),
                    onChanged: (value) {
                      if (value != null) preferences.setThemeMode(value);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: preferences.themeMode,
                    title: Text(hindi ? 'डार्क मोड' : 'Dark mode'),
                    onChanged: (value) {
                      if (value != null) preferences.setThemeMode(value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              hindi
                  ? 'आपकी भाषा और थीम इस डिवाइस पर सेव होती हैं।'
                  : 'Your language and theme choices are saved on this device.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
