import 'dart:io';

void main() {
  const row = '---';
  const column = '|';
  stdout.write('Nhập vào kích thước khung cần vẽ: ');
  int? squareSize = int.parse(stdin.readLineSync() ?? "0");
  for (int i = 0; i <= squareSize * 2; i++) {
    i % 2 == 0
        ? drawCrossBar(squareSize, row)
        : drawVerticalColumn(squareSize, row, column);
  }
}

void drawCrossBar(int squareSize, String row) {
  for (int i = 0; i < squareSize * 2 + 1; i++) {
    stdout.write(i % 2 == 0 ? ' ' : row);
  }
  stdout.write('\n');
}

void drawVerticalColumn(int squareSize, String row, String column) {
  for (int i = 0; i < squareSize * 2 + 1; i++) {
    stdout.write(i % 2 == 0 ? column : '   ');
  }
  stdout.write('\n');
}
