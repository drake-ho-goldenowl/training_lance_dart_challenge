import 'dart:io';

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
