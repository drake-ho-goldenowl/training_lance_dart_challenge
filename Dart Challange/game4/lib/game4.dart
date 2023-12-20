import 'dart:io';

void startGame() {
  bool loopGame = true;
  while (loopGame) {
    stdout.writeln('Welcome to Magical Hat Game.');
    stdout.writeln('Type \'exit\' to stop the game');
    final resultText = 'Lance Lancelot'.toUpperCase();
    List<String> listResultText = resultText.split('');
    List<String> listHints = createHintText(listResultText);

    loopGame = playGame(
      resultText: listResultText,
      hintText: listHints
    );

    stdout.writeln(loopGame ? "Play again!\n" : "\n");
  }
}

List<String> createHintText(List<String> resultText) {
  List<String> listHintText = [];
  for (String character in resultText) {
    if (character != ' ') {
      listHintText.add('_');
    } else {
      listHintText.add(' ');
    }
  }
  return listHintText;
}

String getUserInput() {
  String? userInput;
  do {
    stdout.write("Please guess a letter: ");
    userInput = stdin.readLineSync();
  } while (userInput!.length != 1 && userInput != 'exit');
  return userInput;
}

void renderHintText(List<String> hints){
  for (String character in hints){
    stdout.write(character);
  }
  print('');
}

bool playGame({
  required List<String> resultText,
  required List<String> hintText,
}) {
  while (resultText.toString().compareTo(hintText.toString()) != 0) {
    print('');
    renderHintText(hintText);
    String userInput = getUserInput();
    if (userInput.compareTo('exit') == 0) return false;
    if (resultText.contains(userInput.toUpperCase())){
      for (int i = 0; i<resultText.length ;i++) { 
        if (resultText[i].toUpperCase() == userInput.toUpperCase()){
          hintText[i] = userInput.toUpperCase();
        }
      }
    }
  }
  stdout.write('Bingo: ');
  renderHintText(hintText);
  return true;
}
