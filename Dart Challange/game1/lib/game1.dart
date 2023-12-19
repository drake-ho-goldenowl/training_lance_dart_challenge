import 'dart:io';
import 'dart:math';

import 'package:game1/policy.dart';

void main() {
  stdout.writeln('Welcome to Rock, Paper, Scissors.');
  stdout.writeln('Type \'exit\' to stop the game');
  int score = 0;
  String _userChoice = userChoiceFunc();

  // while end when user input 'exit'
  while (_userChoice != 'exit') {
    String _pcChoice = getRandomPCChoice();
    score += calculateResult(userChoice: _userChoice, pcChoice: _pcChoice);
    _userChoice = userChoiceFunc();
  }
  stdout.writeln('\n\nYour score: $score');
}

String userChoiceFunc() {
  String? _userChoice;
  // Loop until User choice 1 of 4 
  do {
    stdout.write('Please choose Rock(R), Paper(P) or Scissors(S): ');
    _userChoice = stdin.readLineSync();
  } while (_userChoice == null ||
      (_userChoice != "R" &&
          _userChoice != 'P' &&
          _userChoice != "S" &&
          _userChoice != 'exit'));
  return _userChoice;
}

String getRandomPCChoice() {
  Random random = Random();
  List<RockPaperScissors> listChoice = RockPaperScissors.values;
  RockPaperScissors pcChoice = listChoice[random.nextInt(listChoice.length)];
  return RockPaperScissorsPolicy.getChoice(pcChoice);
}

int calculateResult({required String userChoice, required String pcChoice}) {
  //Change value of Map RPS before check who's win
  RockPaperScissorsPolicy.changeValue(userChoice);

  int _userValue =
      RockPaperScissorsPolicy.rockPaperScissorsValue[userChoice] ?? 0;
  int _pcValue = RockPaperScissorsPolicy.rockPaperScissorsValue[pcChoice] ?? 0;

  if (_userValue > _pcValue) {
    print('You win');
    return 1;
  } else if (_userValue < _pcValue) {
    print('You lose');
    return -1;
  } else {
    print('Draw score');
  }
  return 0;
}
