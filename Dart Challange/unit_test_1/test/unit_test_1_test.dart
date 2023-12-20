import 'package:unit_test_1/unit_test_function.dart';
import 'package:test/test.dart';

void main() {
  test('List Divisors of 100', () {
    expect(getListDivisors(100), [1, 2, 4, 5, 10, 20, 25, 50, 100]);
  });

  test('List Divisors of 0', () {
    expect(getListDivisors(0), []);
  });

  test('List Divisors of 13', () {
    expect(getListDivisors(13), [1, 13]);
  });
}
