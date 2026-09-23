import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/core/theme/app_colors.dart';
import 'package:studybase/core/theme/app_theme.dart';
import 'package:studybase/core/theme/app_elevation.dart';
import 'package:studybase/core/theme/app_radii.dart';
import 'package:studybase/core/theme/app_spacing.dart';

void main() {
  test('StudyBase themes preserve light and dark visual surfaces', () {
    final light = AppTheme.light();
    final dark = AppTheme.dark();

    expect(light.scaffoldBackgroundColor, AppColors.backgroundLight);
    expect(light.cardTheme.color, AppColors.surfaceLight);
    expect(dark.scaffoldBackgroundColor, AppColors.backgroundDark);
    expect(dark.cardTheme.color, AppColors.surfaceDark);
    expect(dark.inputDecorationTheme.fillColor, AppColors.surfaceDark);
  });

  test('StudyBase design tokens remain ordered and valid', () {
    expect(AppSpacing.xs, lessThan(AppSpacing.sm));
    expect(AppSpacing.sm, lessThan(AppSpacing.md));
    expect(AppSpacing.md, lessThan(AppSpacing.lg));
    expect(AppSpacing.lg, lessThan(AppSpacing.xl));
    expect(AppSpacing.xl, lessThan(AppSpacing.xxl));
    expect(AppRadii.sm, lessThan(AppRadii.md));
    expect(AppRadii.md, lessThan(AppRadii.lg));
    expect(AppElevation.none, lessThan(AppElevation.subtle));
  });
}
