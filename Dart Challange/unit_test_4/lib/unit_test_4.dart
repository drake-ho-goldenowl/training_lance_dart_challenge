import 'dart:io';

bool validatePassword({required String password}) {
  if (password.length < 6) {
    stdout.write("Pass length from 6 to infinity character \n");
    return false;
  }
  bool isText = false;
  bool isNum = false;
  bool isSpec = false;
  RegExp regexNum = RegExp(r'\d+');
  RegExp regexText = RegExp(r'[a-zA-Z]');
  RegExp regexSpec = RegExp(r'[\\^$*@#%&+?.(){}\[\]|]');
  for (String character in password.split('')) {
    if (regexNum.hasMatch(character) && !isNum) isNum = true;

    if (regexText.hasMatch(character) && !isText) isText = true;

    if (regexSpec.hasMatch(character) && !isSpec) isSpec = true;
  }
  if (isSpec && isNum && isText) {
    stdout.write("Password is validated\n");
    return true;
  }
  stdout.write(
      "Password must has a character\nPassword must has a number\nPassword must has a special character\n");
  return false;
}