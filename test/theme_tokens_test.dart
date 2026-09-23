import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/core/theme/app_elevation.dart';
import 'package:studybase/core/theme/app_radii.dart';
import 'package:studybase/core/theme/app_spacing.dart';

void main() {
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
