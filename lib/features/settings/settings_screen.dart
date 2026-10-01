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
              child: RadioGroup<String>(
                groupValue: preferences.locale.languageCode,
                onChanged: (value) {
                  if (value != null) preferences.setLanguage(value);
                },
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      value: 'en',
                      title: Text('English'),
                      subtitle: Text('English interface'),
                    ),
                    RadioListTile<String>(
                      value: 'hi',
                      title: Text('हिन्दी'),
                      subtitle: Text('Hindi interface'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(StudyBaseStrings.appearance(context),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.sm),
            Card(
              child: RadioGroup<ThemeMode>(
                groupValue: preferences.themeMode,
                onChanged: (value) {
                  if (value != null) preferences.setThemeMode(value);
                },
                child: Column(
                  children: [
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.system,
                      title: Text(hindi ? 'डिवाइस के अनुसार' : 'System default'),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.light,
                      title: Text(hindi ? 'लाइट मोड' : 'Light mode'),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.dark,
                      title: Text(hindi ? 'डार्क मोड' : 'Dark mode'),
                    ),
                  ],
                ),
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
