import 'dart:io';

List<int> getListItemsInTwoList(
    {required List<int> listNumber1, required List<int> listNumber2}) {
  if (listNumber1.isEmpty || listNumber2.isEmpty) return [];

  List<int> subList = [];
  for (int i = 0; i < listNumber1.length; i++) {
    if (listNumber2.contains(listNumber1[i]) &&
        !subList.contains(listNumber1[i])) subList.add(listNumber1[i]);
  }

  return subList;
}

bool unitTest() {
  bool testPass = true;

  //Case 1: Normal case;
  List<int> listNumber1 = [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55];
  List<int> listNumber2 = List.generate(13, (index) => index + 1);
  List<int> result = getListItemsInTwoList(
      listNumber1: listNumber1, listNumber2: listNumber2);
  List<int> resultCase1 = [1, 2, 3, 5, 8, 13];
  if (result.toString().compareTo(resultCase1.toString()) != 0) {
    stdout.writeln("Test failed case 1");
    return false;
  }

  //Case 2: List 1 is empty;
  listNumber1 = List.empty();
  listNumber2 = List.generate(13, (index) => index + 1);
  result = getListItemsInTwoList(
      listNumber1: listNumber1, listNumber2: listNumber2);
  if (result.isNotEmpty) {
    stdout.writeln("Test failed case 2");
    return false;
  }

  //Case 3: 2 different lists;
  listNumber1 = List.generate(13, (index) => index * 2 + 1);
  listNumber2 = List.generate(13, (index) => index * 2);
  result = getListItemsInTwoList(
      listNumber1: listNumber1, listNumber2: listNumber2);
  if (result.isNotEmpty) {
    stdout.writeln("Test failed case 3");
    return false;
  }

  return testPass;
}
