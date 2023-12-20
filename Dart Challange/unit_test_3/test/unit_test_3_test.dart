import 'package:unit_test_3/check_prime_number.dart';
import 'package:test/test.dart';

void main() {
  test('Number 26', () {
    expect(checkPrimeNumberFunc(number: 26), false);
  });

  test('Number 13', () {
    expect(checkPrimeNumberFunc(number: 13), true);
  });

  test('Number 2', () {
    expect(checkPrimeNumberFunc(number: 2), true);
  });

  test('Number 1', () {
    expect(checkPrimeNumberFunc(number: 1), false);
  });
}
