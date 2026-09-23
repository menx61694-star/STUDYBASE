import 'package:flutter/material.dart';

import '../theme/app_radii.dart';

class StudyBasePrimaryButton extends StatelessWidget {
  const StudyBasePrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton.icon(
      onPressed: onPressed,
      icon: icon == null ? null : Icon(icon),
      label: Text(label),
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
