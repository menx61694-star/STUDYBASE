import 'package:flutter/material.dart';

class StudyBaseSubjectTile extends StatelessWidget {
  const StudyBaseSubjectTile({
    super.key,
    required this.title,
    required this.noteCount,
    required this.icon,
    this.onTap,
    this.color,
  });

  final String title;
  final int noteCount;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? Theme.of(context).colorScheme.primary;

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: tint.withValues(alpha: 0.12),
          foregroundColor: tint,
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text('$noteCount notes'),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
