import 'package:flutter/material.dart';

class StudyBaseSearchField extends StatelessWidget {
  const StudyBaseSearchField({
    super.key,
    this.controller,
    this.hintText = 'Search notes, subjects...',
    this.onChanged,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search_rounded),
      ),
    );
  }
}
