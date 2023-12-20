import 'package:unit_test_4/unit_test_4.dart';
import 'package:test/test.dart';

void main() {
  test('Pass: Lance', () {
    expect(validatePassword(password: "Lance"), false);
  });

  test('Pass: Lance1', () {
    expect(validatePassword(password: "Lance1"), false);
  });

  test('Pass: L@nce1', () {
    expect(validatePassword(password: "L@nce1"), true);
  });

  test('Pass: Lancegggg', () {
    expect(validatePassword(password: "Lancegggg"), false);
  });
}
