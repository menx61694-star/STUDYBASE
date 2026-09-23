import 'package:flutter_test/flutter_test.dart';
import 'package:studybase/features/auth/auth_validators.dart';

void main() {
  test('auth validators accept valid credentials', () {
    expect(AuthValidators.email('student@example.com'), isNull);
    expect(AuthValidators.password('study123'), isNull);
    expect(AuthValidators.confirmPassword('study123', 'study123'), isNull);
  });

  test('auth validators reject invalid credentials', () {
    expect(AuthValidators.email('student'), isNotNull);
    expect(AuthValidators.password('123'), isNotNull);
    expect(AuthValidators.confirmPassword('different', 'study123'), isNotNull);
  });
}
