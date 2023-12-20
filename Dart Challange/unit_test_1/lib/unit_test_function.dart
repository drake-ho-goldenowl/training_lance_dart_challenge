import 'dart:io';

List<int> getListDivisors(int number) {
  if (number == 0) {
    stdout.write("Vô số ước số \n");
    return [];
  }
  List<int> listDivisors = [1];
  for (int i = 2; i < number; i++) {
    if (number % i == 0) listDivisors.add(i);
  }
  listDivisors.add(number);
  stdout.write("Danh sách ước số: ${listDivisors.join(" , ")} \n");
  return listDivisors;
}
