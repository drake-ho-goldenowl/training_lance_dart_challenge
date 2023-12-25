import 'dart:io';
import 'dart:math';

void startGame() {
  bool loopGame = true;
  while (loopGame) {
    stdout.writeln('Welcome to Cows and Bulls.');
    stdout.writeln('Type \'exit\' to stop the game');
    List<String> randomValue = createRandomNumber();

    loopGame = playGame(
      randomValue: randomValue,
    );

    stdout.writeln(loopGame ? "Play again!" : "\n");
  }
}

List<String> createRandomNumber() {
  List<String> randomNumbers = [];
  Random random = Random();
  // Create first digit >= 1
  randomNumbers.add((random.nextInt(9) + 1).toString());
  while (randomNumbers.length < 4) {
    randomNumbers.add(random.nextInt(10).toString());
    randomNumbers = randomNumbers.toSet().toList();
  }
  return randomNumbers;
}

String getUserInput() {
  RegExp invalidInput = RegExp(r'[a-zA-Z]|[^\w\s]');
  String? userInput;
  do {
    stdout.write("Please choose a four digit number: ");
    userInput = stdin.readLineSync();

    // Check 1 of 2 condition: user input 'exit' or user input number
    if ((userInput != null && userInput.trim().isNotEmpty) &&
        (userInput.compareTo('exit') == 0 ||
            !invalidInput.hasMatch(userInput))) {
      if (userInput.compareTo('exit') == 0) break;

      int userNumber = int.parse(userInput);
      if (userNumber < 10000 &&
          userNumber >= 1000 &&
          userInput.split('').toSet().toList().length == 4) break;
    }
    stdout.writeln(
        "Incorrect number. Make sure to give 4 differrent digit number");
  } while (true);
  return userInput;
}

//1234 2234
bool playGame({
  required List<String> randomValue,
}) {
  int attempts = 0;
  int cows = 0;
  int bulls = 0;

  while (cows != 4) {
    cows = 0;
    bulls = 0;
    String userInput = getUserInput();
    if (userInput.compareTo('exit') == 0) return false;
    List<String> listCharactersUserInput = userInput.split('');

    for (int i = 0; i < listCharactersUserInput.length; i++) {
      if (randomValue.contains(listCharactersUserInput[i])) {
        if (randomValue[i] == listCharactersUserInput[i]) {
          cows++;
        } else {
          bulls++;
        }
      }
    }
    attempts++;
    stdout.writeln("Attempts: $attempts. \nCows: $cows, Bulls: $bulls \n");
  }
  return true;
}
