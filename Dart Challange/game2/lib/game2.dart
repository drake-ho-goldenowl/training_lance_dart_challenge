import 'dart:io';
import 'dart:math';

void gameStart() {
  bool loopGame = true;
  while (loopGame) {
    stdout.writeln("Type 'exit' to quit the game");
    int randomValue = createRandomNumber();
    String userInput = getUserInput();
    if (userInput.compareTo('exit') == 0) return;
    loopGame = playGame(
      userInput: userInput,
      randomValue: randomValue,
    );

    stdout.writeln(loopGame ? "Play again!" : "\n");
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
    
    // Check 1 of 2 condition: user input 'exit' or user input number
    if ((userInput != null && userInput.trim().isNotEmpty) &&
        (userInput.compareTo('exit') == 0 ||
            !invalidInput.hasMatch(userInput))) {
      if (userInput.compareTo('exit') == 0) break;

      int userNumber = int.parse(userInput);
      if (userNumber <= 100 && userNumber >= 0) break;
    }
  } while (true);
  return userInput;
}

bool playGame({
  required String userInput,
  required int randomValue,
}) {
  int count = 1;
  int userInputValue = int.parse(userInput);
  while (userInputValue != randomValue) {
    if (userInputValue > randomValue) {
      stdout.writeln("You are higher");
    } else if (userInputValue < randomValue) {
      stdout.writeln("You are lower");
    }
    count++;
    String userInput = getUserInput();

    if (userInput.compareTo('exit') == 0) {
      return false;
    }
    userInputValue = int.parse(userInput);
  }
  stdout.writeln("Bingo! You tried $count times \n");
  return true;
}
