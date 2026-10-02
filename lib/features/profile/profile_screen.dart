import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/settings/studybase_strings.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const _nameKey = 'profile_display_name';
  static const _emailKey = 'profile_email';
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _loading = true;
  bool _saving = false;

  bool get _hindi => Localizations.localeOf(context).languageCode == 'hi';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final preferences = await SharedPreferences.getInstance();
    if (!mounted) return;
    _nameController.text = preferences.getString(_nameKey) ?? '';
    _emailController.text = preferences.getString(_emailKey) ?? '';
    setState(() => _loading = false);
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_nameKey, _nameController.text.trim());
    await preferences.setString(_emailKey, _emailController.text.trim());
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_hindi ? 'प्रोफ़ाइल इस डिवाइस पर सेव हो गई।' : 'Profile saved on this device.')),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hindi = _hindi;
    return Scaffold(
      appBar: AppBar(title: Text(StudyBaseStrings.profile(context))),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: AppSpacing.page,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        child: Text(
                          _nameController.text.trim().isEmpty
                              ? 'S'
                              : _nameController.text.trim().characters.first.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(hindi ? 'आपकी लर्निंग प्रोफ़ाइल' : 'Your learning profile', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
                      const SizedBox(height: AppSpacing.xs),
                      Text(hindi ? 'आपकी जानकारी इसी डिवाइस पर सेव होती है।' : 'Your details are saved on this device.', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hindi ? 'नाम' : 'Display name', style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: AppSpacing.xs),
                      TextFormField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: hindi ? 'अपना नाम लिखें' : 'Enter your name',
                          prefixIcon: const Icon(Icons.person_outline_rounded),
                        ),
                        validator: (value) => value == null || value.trim().isEmpty
                            ? (hindi ? 'नाम लिखें' : 'Enter a display name')
                            : null,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(hindi ? 'ईमेल (वैकल्पिक)' : 'Email (optional)', style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: AppSpacing.xs),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'you@example.com',
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          final email = value?.trim() ?? '';
                          if (email.isNotEmpty && !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
                            return hindi ? 'सही ईमेल पता लिखें' : 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      StudyBasePrimaryButton(
                        label: _saving ? (hindi ? 'सेव हो रहा है…' : 'Saving...') : (hindi ? 'प्रोफ़ाइल सेव करें' : 'Save profile'),
                        icon: Icons.save_outlined,
                        onPressed: _saving ? null : _saveProfile,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
