import 'package:flutter/widgets.dart';

class StudyBaseStrings {
  const StudyBaseStrings._();

  static bool _h(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'hi';

  static String appTitle(BuildContext context) => 'StudyBase';
  static String readyToLearn(BuildContext context) =>
      _h(context) ? 'पढ़ाई के लिए तैयार हैं?' : 'Ready to learn?';
  static String homeSubtitle(BuildContext context) => _h(context)
      ? 'नोट्स खोजें, अभ्यास करें और सीखते रहें।'
      : 'Find notes, practice and keep learning.';
  static String subjects(BuildContext context) =>
      _h(context) ? 'विषय' : 'Subjects';
  static String recentNotes(BuildContext context) =>
      _h(context) ? 'हाल के नोट्स' : 'Recent notes';
  static String viewAll(BuildContext context) =>
      _h(context) ? 'सभी देखें' : 'View all';
  static String home(BuildContext context) => _h(context) ? 'होम' : 'Home';
  static String tests(BuildContext context) => _h(context) ? 'टेस्ट' : 'Tests';
  static String profile(BuildContext context) =>
      _h(context) ? 'प्रोफ़ाइल' : 'Profile';
  static String language(BuildContext context) =>
      _h(context) ? 'भाषा' : 'Language';
  static String appearance(BuildContext context) =>
      _h(context) ? 'थीम' : 'Appearance';
  static String settings(BuildContext context) =>
      _h(context) ? 'सेटिंग्स' : 'Settings';
  static String downloads(BuildContext context) =>
      _h(context) ? 'डाउनलोड' : 'Downloads';
  static String notifications(BuildContext context) =>
      _h(context) ? 'सूचनाएँ' : 'Notifications';
}
