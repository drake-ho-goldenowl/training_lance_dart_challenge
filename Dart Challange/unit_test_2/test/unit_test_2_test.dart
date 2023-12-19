import 'package:unit_test_2/get_list_item_in_two_list.dart';
import 'package:test/test.dart';

void main() {
  test('Two lists sample', () {
    expect(
        getListItemsInTwoList(
            listNumber1: [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55],
            listNumber2: List.generate(13, (index) => index + 1)),
        [1, 2, 3, 5, 8, 13]);
  });

  test('Empty list', () {
    expect(
        getListItemsInTwoList(
            listNumber1: [],
            listNumber2: List.generate(13, (index) => index + 1)),
        []);
  });

  test('Two different lists', () {
    expect(
        getListItemsInTwoList(
            listNumber1: List.generate(13, (index) => index * 2 + 1),
            listNumber2: List.generate(13, (index) => index * 2)),
        []);
  });
}
