import 'dart:io';
import 'dart:math';

void gameStart() {
  while (true) {
    stdout.writeln("Type 'exit' to quit the game");
    int count = 1;
    int randomValue = createRandomNumber();
    String userInput = getUserInput();
    if (userInput.compareTo('exit') == 0) return;

    int userInputValue = int.parse(userInput);
    while (userInputValue != randomValue) {
      if (userInputValue > randomValue) {
        stdout.writeln("You are higher");
      } else if (userInputValue < randomValue) {
        stdout.writeln("You are lower");
      }
      count++;
      userInput = getUserInput();
      if (userInput.compareTo('exit') == 0) return;
      userInputValue = int.parse(userInput);
    }
    stdout.writeln("Bingo! You tried $count times \n");

    stdout.writeln("Play again!");
  }
}

int createRandomNumber() {
  Random random = Random();
  int guessValue = random.nextInt(101);
  return guessValue;
}

String getUserInput() {
  RegExp invalidInput = RegExp(r'[a-zA-Z]|[^\w\s]');
  String? userInput;
  do {
    stdout.write("Please choose a number between 0 and 100:");
    userInput = stdin.readLineSync();
    if (userInput != null &&
        (userInput.compareTo('exit') == 0 ||
            !invalidInput.hasMatch(userInput))) {
      if (userInput.compareTo('exit') == 0) break;

      int userNumber = int.parse(userInput);
      if (userNumber <= 100 && userNumber >= 0) break;
    }
  } while (true);
  return userInput;
}
