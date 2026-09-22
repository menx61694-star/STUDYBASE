import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyBaseLogo extends StatelessWidget {
  const StudyBaseLogo({
    super.key,
    this.size = 96,
    this.showWordmark = true,
  });

  final double size;
  final bool showWordmark;

  @override
  Widget build(BuildContext context) {
    final logo = SvgPicture.asset(
      'assets/branding/studybase_logo.svg',
      width: size,
      height: size,
      semanticsLabel: 'StudyBase logo',
    );

    if (!showWordmark) return logo;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        logo,
        const SizedBox(height: 12),
        Text(
          'StudyBase',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4,
              ),
        ),
      ],
    );
  }
}
