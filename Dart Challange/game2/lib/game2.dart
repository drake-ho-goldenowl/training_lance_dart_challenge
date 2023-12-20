import 'dart:io';
import 'dart:math';

void gameStart() {
  while (true) {
    stdout.write("Type 'exit' to quit the game");
    int randomValue = createRandomNumber();
    String userInputValue = getUserInput();
    if (userInputValue)
  }
}

int createRandomNumber() {
  Random random = Random();
  int guessValue = random.nextInt(101);
  return guessValue;
}

String getUserInput() {
  stdout.write("Please choose a number between 0 and 100:");
  String? userInput = stdin.readLineSync();
  return userInput ?? '';
}
