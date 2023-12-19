import 'dart:io';

void main() {
  // stdout.write('Nhập vào một số: ');
  // int? number = int.parse(stdin.readLineSync() ?? "0");
  if (unitTest()) {
    stdout.write("Tests passed");
  }
}

bool validatePassword({required String password}) {
  if (password.length < 6) {
    stdout.write("Pass length from 6 to infinity character \n");
    return false;
  }
  bool _isText = false;
  bool _isNum = false;
  bool _isSpec = false;
  RegExp regexNum = RegExp(r'\d+');
  RegExp regexText = RegExp(r'[a-zA-Z]');
  RegExp regexSpec = RegExp(r'[\\^$*@#%&+?.(){}\[\]|]');
  for (String character in password.split('')) {
    if (regexNum.hasMatch(character) && !_isNum) _isNum = true;

    if (regexText.hasMatch(character) && !_isText) _isText = true;

    if (regexSpec.hasMatch(character) && !_isSpec) _isSpec = true;
  }
  if (_isSpec && _isNum && _isText) {
    stdout.write("Password is validated\n");
    return true;
  }
  stdout.write(
      "Password must has a character\nPassword must has a number\nPassword must has a special character\n");
  return false;
}

bool unitTest() {
  bool testPass = true;

  //Case 1: Short pass
  stdout.writeln("\nPass : 5\n");
  bool _result = validatePassword(password: "5");
  if (_result) {
    stdout.writeln("Test failed case 1");
    return false;
  }

  //Case 2: Leak special character;
  stdout.writeln("\nPass : Lance1\n");
  _result = validatePassword(password: "Lance1");
  if (_result) {
    stdout.writeln("Test failed case 2");
    return false;
  }

  //Case 3: Leak special character and number
  stdout.writeln("\nPass : Lancee\n");
  _result = validatePassword(password: "Lancee");
  if (_result) {
    stdout.writeln("Test failed case 3");
    return false;
  }

  //Case 4: Validate pass
  stdout.writeln("\nPass : L@nce1\n");
  _result = validatePassword(password: "L@nce1");
  if (!_result) {
    stdout.writeln("Test failed case 4");
    return false;
  }

  return testPass;
}
