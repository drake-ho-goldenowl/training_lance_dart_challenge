import 'dart:io';

bool checkPrimeNumberFunc({required int number}) {
  if ((number.isEven && number != 2) || number == 1) {
    stdout.writeln("$number isn't a Prime Number");
    return false;
  }
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      stdout.writeln("$number isn't a Prime Number");
      return false;
    }
  }
  stdout.writeln("$number is a Prime Number");
  return true;
}
