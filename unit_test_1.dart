import 'dart:io';

void main() {
  // stdout.write('Nhập vào một số: ');
  // int? number = int.parse(stdin.readLineSync() ?? "0");
  if (unitTest()) {
    stdout.write("Tests passed");
  }
}

List<int> getListDivisors(int number) {
  if (number == 0) {
    stdout.write("Vô số ước số \n");
    return [];
  }
  List<int> _listDivisors = [1];
  for (int i = 2; i < number; i++) {
    if (number % i == 0) _listDivisors.add(i);
  }
  _listDivisors.add(number);
  stdout.write("Danh sách ước số: ${_listDivisors.join(" , ")} \n");
  return _listDivisors;
}

bool unitTest() {
  bool testPass = true;

  //Case 1: Normal Number;
  List<int> _result = getListDivisors(100);
  List<int> _resultCase1 = [1, 2, 4, 5, 10, 20, 25, 50, 100];
  if (_result.toString().compareTo(_resultCase1.toString()) != 0) {
    stdout.writeln("Test failed case 1");
    return false;
  }

  //Case 2: Number Zero;
  _result = getListDivisors(0);
  if (_result.isNotEmpty) {
    stdout.writeln("Test failed case 2");
    return false;
  }

  //Case 3: Prime Number;
  _result = getListDivisors(13);
  List<int> _resultCase3 = [1, 13];
  if (_result.toString() != _resultCase3.toString()) {
    stdout.writeln("Test failed case 3");
    return false;
  }

  return testPass;
}
