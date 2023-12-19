import 'dart:io';

List<int> getListItemsInTwoList(
    {required List<int> listNumber1, required List<int> listNumber2}) {
  if (listNumber1.isEmpty || listNumber2.isEmpty) return [];

  List<int> _subList = [];
  for (int i = 0; i < listNumber1.length; i++) {
    if (listNumber2.contains(listNumber1[i]) &&
        !_subList.contains(listNumber1[i])) _subList.add(listNumber1[i]);
  }

  return _subList;
}

bool unitTest() {
  bool testPass = true;

  //Case 1: Normal case;
  List<int> _listNumber1 = [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55];
  List<int> _listNumber2 = List.generate(13, (index) => index + 1);
  List<int> _result = getListItemsInTwoList(
      listNumber1: _listNumber1, listNumber2: _listNumber2);
  List<int> _resultCase1 = [1, 2, 3, 5, 8, 13];
  if (_result.toString().compareTo(_resultCase1.toString()) != 0) {
    stdout.writeln("Test failed case 1");
    return false;
  }

  //Case 2: List 1 is empty;
  _listNumber1 = List.empty();
  _listNumber2 = List.generate(13, (index) => index + 1);
  _result = getListItemsInTwoList(
      listNumber1: _listNumber1, listNumber2: _listNumber2);
  if (_result.isNotEmpty) {
    stdout.writeln("Test failed case 2");
    return false;
  }

  //Case 3: 2 different lists;
  _listNumber1 = List.generate(13, (index) => index * 2 + 1);
  _listNumber2 = List.generate(13, (index) => index * 2);
  _result = getListItemsInTwoList(
      listNumber1: _listNumber1, listNumber2: _listNumber2);
  if (_result.isNotEmpty) {
    stdout.writeln("Test failed case 3");
    return false;
  }

  return testPass;
}
