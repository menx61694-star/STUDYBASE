import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/app_spacing.dart';

class StudyBaseNotification {
  const StudyBaseNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.dateLabel,
  });

  final String id;
  final String title;
  final String message;
  final String dateLabel;
}

const studyBaseNotifications = <StudyBaseNotification>[
  StudyBaseNotification(
    id: 'welcome',
    title: 'Welcome to StudyBase',
    message: 'Explore notes, save PDFs for offline study, and practise with mock tests.',
    dateLabel: 'StudyBase',
  ),
  StudyBaseNotification(
    id: 'mock-tests',
    title: 'Mock tests are ready',
    message: 'Try a practice set and review the explanations after submitting your answers.',
    dateLabel: 'Study tips',
  ),
  StudyBaseNotification(
    id: 'downloads',
    title: 'Study offline',
    message: 'Download supported notes to revisit them without an internet connection.',
    dateLabel: 'Study tips',
  ),
];

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  static const _readKey = 'read_notification_ids';
  Set<String> _readIds = <String>{};
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadReadIds();
  }

  Future<void> _loadReadIds() async {
    final preferences = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _readIds = preferences.getStringList(_readKey)?.toSet() ?? <String>{};
      _loaded = true;
    });
  }

  Future<void> _markRead(String id) async {
    final next = <String>{..._readIds, id};
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(_readKey, next.toList());
    if (mounted) setState(() => _readIds = next);
  }

  Future<void> _markAllRead() async {
    final next = studyBaseNotifications.map((item) => item.id).toSet();
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(_readKey, next.toList());
    if (mounted) setState(() => _readIds = next);
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = studyBaseNotifications.where((item) => !_readIds.contains(item.id)).length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          if (unreadCount > 0)
            TextButton(onPressed: _markAllRead, child: const Text('Mark all read')),
        ],
      ),
      body: !_loaded
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: AppSpacing.page,
              children: [
                Text('Your study updates', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  unreadCount == 0 ? 'You are all caught up.' : '$unreadCount unread updates',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                ...studyBaseNotifications.map((item) {
                  final isRead = _readIds.contains(item.id);
                  return Card(
                    key: ValueKey('notification-${item.id}'),
                    margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(isRead ? Icons.done_rounded : Icons.notifications_active_outlined),
                      ),
                      title: Text(item.title),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.xs),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.message),
                            const SizedBox(height: AppSpacing.xs),
                            Text(item.dateLabel, style: Theme.of(context).textTheme.labelSmall),
                          ],
                        ),
                      ),
                      trailing: isRead ? null : const Icon(Icons.circle, size: 9),
                      onTap: isRead ? null : () => _markRead(item.id),
                    ),
                  );
                }),
              ],
            ),
    );
  }
}
