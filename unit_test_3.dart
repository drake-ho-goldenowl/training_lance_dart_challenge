import 'dart:io';

void main() {
  // stdout.write('Nhập vào một số: ');
  // int? number = int.parse(stdin.readLineSync() ?? "0");
  if (unitTest()) {
    stdout.write("Tests passed");
  }
}

bool checkPrimeNumberFunc({required int number}) {
  if (number.isEven && number != 2) {
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

bool unitTest() {
  bool testPass = true;

  //Case 1: Prime number
  bool _result = checkPrimeNumberFunc(number: 5);
  if (!_result) {
    stdout.writeln("Test failed case 1");
    return false;
  }

  //Case 2: No prime number;
  _result = checkPrimeNumberFunc(number: 10);
  if (_result) {
    stdout.writeln("Test failed case 2");
    return false;
  }

  //Case 3: Number 2
  _result = checkPrimeNumberFunc(number: 2);
  if (!_result) {
    stdout.writeln("Test failed case 3");
    return false;
  }

  return testPass;
}
